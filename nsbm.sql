
#1
## Find lyrical themes assosiated with racist bands worldwide
# Rank which themes are the most common for racist bands 
# display the number of bands using each theme
# (NOTE: Some themes in the results aren't in the CTE, this is intensional)
USE Metal;
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology'
'Eugenics', 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy', 'O9A', 'Xenophobia')
GROUP BY bandId
)
SELECT 
themeName AS `Theme Name`,
DENSE_RANK() OVER (ORDER BY COUNT(themeId) DESC) AS `Theme Rank`,
COUNT(themeId) AS `# Bands`
FROM Theme
INNER JOIN BandTheme
USING (themeId)
INNER JOIN CTE
USING(bandId)
GROUP BY themeId
ORDER BY `# Bands` DESC
LIMIT 20;

# 2
# This find the regions (cities, states, etc) with the most active hate bands
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology'
'Eugenics', 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy','O9A', 'Xenophobia')
GROUP BY bandId
)
SELECT
cityName,
COUNT(CTE.bandId) AS `Racist Bands`,
COUNT(CASE WHEN bandStatus = 'active' THEN bandStatus END) AS `# active`,
ROUND(SUM(CASE WHEN formedIn != 'N/A' THEN formedIn END) / COUNT(CASE WHEN formedIn != 'N/A' THEN formedIn END), 0) AS `Avg. year formed`
FROM CTE
INNER JOIN Band
USING(bandId)
INNER JOIN BandCity
USING (bandId)
INNER JOIN City
USING(cityId)
INNER JOIN (SELECT cityId, COUNT(*) AS totalCount FROM Band INNER JOIN BandCity USING (bandId) GROUP BY cityId) AS total
USING (cityId)
GROUP BY cityId
HAVING cityName NOT IN (SELECT countryName FROM Country)
ORDER BY `# active` DESC;

# 3
## Rank which lyrical themes are the most common at each location
## Example: Nature is the 10th most common theme for racist bands in germany. 
## The rightmost column is useful for understanding the global distribution of each theme.
## Example: Finland alone produces 24.39% of all anti-islamic black metal
USE Metal;
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology'
'Eugenics', 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy', 'O9A', 'Xenophobia')
GROUP BY bandId
)
SELECT
themeName AS `Theme Name`,
DENSE_RANK() OVER (PARTITION BY countryId ORDER BY COUNT(bandId) DESC) AS `Theme Rank`,
countryName AS `Location`, 
COUNT(bandId) AS `# Bands`,
CONCAT(ROUND(COUNT(bandId) / globalTotal.C * 100,2), "%") AS `% of global`
FROM BandTheme
INNER JOIN CTE
USING(bandId)
INNER JOIN Theme
USING (themeId)
INNER JOIN BandCountry
USING(bandId)
INNER JOIN Country
USING (countryId)
INNER JOIN (SELECT themeId, COUNT(*) AS C FROM BandTheme GROUP BY themeId) AS globalTotal
USING (themeId)
GROUP BY countryId, themeId
HAVING `# Bands` > 3 AND Location NOT IN ("Unknown", "International")
ORDER BY `Location` DESC, `Theme Rank`, `# Bands` DESC;



# 4
#This counts the total number of black metal bands in each country, the number of racist bands, and the percentage that are racist.
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology'
'Eugenics', 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy','O9A', 'Xenophobia')
GROUP BY bandId
)
SELECT countryName AS Country,
total.totalCount AS `Total Bands`,
COUNT(bandId) AS `# Racist`,
CONCAT(ROUND(COUNT(bandId) / total.totalCount * 100, 1), "%") AS `% Racist`
FROM Band AS B
INNER JOIN CTE
USING (bandId)
INNER JOIN BandCountry
USING (bandId)
INNER JOIN Country
USING (countryId)
INNER JOIN (SELECT countryId, COUNT(*) AS totalCount FROM Band INNER JOIN BandCountry USING (bandId) GROUP BY countryId) AS total
USING (countryId)
GROUP BY countryId
HAVING (`# Racist` > 3 OR `Total Bands` > 50)
AND countryName NOT IN ('International', 'Unknown' )
ORDER BY `% Racist` DESC, `# Racist` DESC;






# 5
## This tracks countries over time, finding when (on average) the most hate bands where formed in each country,
### and how many of these bands are still active
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology', 'Eugenics',
 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy', 'O9A', 'Xenophobia')
GROUP BY bandId
)
SELECT countryName AS Country,
COUNT(bandId) AS `# Racist`,
ROUND(SUM(CASE WHEN formedIn != 'N/A' THEN formedIn END) / COUNT(CASE WHEN formedIn != 'N/A' THEN formedIn END), 0) AS `Avg. year formed`,
CONCAT(ROUND(COUNT(CASE WHEN bandStatus = 'active' THEN bandStatus END)/ COUNT(bandId) * 100, 1), "%") AS `% still active`
FROM Band AS B
INNER JOIN CTE
USING (bandId)
INNER JOIN BandCountry
USING (bandId)
INNER JOIN Country
USING (countryId)
GROUP BY countryId
HAVING `# Racist` > 2
ORDER BY `Avg. year formed` DESC, `# Racist` DESC;




# 6
## Organize data by theme, show the number of active bands using each theme,
### and the average year that they were formed
USE Metal;
WITH CTE AS (
SELECT bandId
FROM Band
INNER JOIN BandTheme AS BT
USING (bandId)
INNER JOIN Theme AS T
ON T.themeId = BT.themeId
AND themeName IN ('Nationalism', 'National Socialism', 'National-Socialism', 'Wotanism',
'Far-right politics', 'Far-right themes', 'Fascism', 'Fascist', 'Fourth Reich', 'Nazis', 'Nazism'
'Esoteric Hitlerism', 'Esoteric Nazism', 'Esoteric reich', 'Esoteric Aryanism', 'Identitarianism'
'Racism','Anti-Jewish','Anti-Jews', 'Anti-Judaism', 'Anti-Islam', 'Homophobia', 'Anti-Communism'
'Antisemitism','Anti-semitism','Anti-Semitism*', 'Antisemite', 'Killing minorities', 'Genocide'
'Aryan', 'Aryans', 'Aryanism', 'Aryan heritage', 'Aryan pride', 'Aryan war', 
'Aryan culture and mythology', 'Aryan Mysticism', 'Aryan mythology', 'Indo-Ayan mythology'
'Eugenics', 'Nazi Occultism', 'White nationalism', 'White pride', 'White supremacy', 'O9A')
GROUP BY bandId
)
SELECT 
themeName AS `Theme Name`,
ROUND(SUM(CASE WHEN formedIn != 'N/A' THEN formedIn END) / COUNT(CASE WHEN formedIn != 'N/A' THEN formedIn END), 0) AS `Avg. year formed`,
COUNT(CASE WHEN bandStatus = 'active' THEN bandStatus END) AS `# active`
FROM Theme
INNER JOIN BandTheme
USING (themeId)
INNER JOIN CTE
USING(bandId)
INNER JOIN Band
USING(bandId)
GROUP BY themeId
ORDER BY `# active` DESC
LIMIT 25;


