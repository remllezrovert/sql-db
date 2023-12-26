
SELECT COUNT(*) FROM Validate;

## Display bandId, name, the date they where formed, their status, and the cities they are from.
USE Metal;
SELECT 
B.bandId, 
B.bandName, 
B.formedIn,
B.bandStatus,
GROUP_CONCAT(cityName) AS cityName, 
GROUP_CONCAT(countryName) AS countryName
FROM Band AS B
INNER JOIN BandCity
USING (bandId)
INNER JOIN City
USING (cityId)
INNER JOIN BandCountry
USING (bandId)
INNER JOIN Country AS C
USING (countryId)
GROUP BY bandId;


#Display the genre of each band
SELECT  
B.bandName,
GROUP_CONCAT(genreName) AS genreName
FROM Band AS B
INNER JOIN BandGenre
USING (bandId)
INNER JOIN Genre
USING (GenreId)
GROUP BY bandId;

#Display the lyrica themes of each band
SELECT
B.BandName,
GROUP_CONCAT(themeName) AS themeName
FROM Band AS B
INNER JOIN BandTheme
USING(bandId)
INNER JOIN Theme
USING(themeId)
GROUP BY bandId;

#Display the name of each band member
SELECT 
B.bandName,
GROUP_CONCAT(memberName) AS memberName
FROM Band AS B
INNER JOIN BandMember
USING(bandId)
INNER JOIN Member
USING(memberId)
GROUP BY bandId;






