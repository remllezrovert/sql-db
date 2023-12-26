
#1# How many rows does this table contain
USE Metal;
SELECT * FROM Staging;

#2# Identify a colum that contains a category field. What are the different values in this column. How many rows have each value?
SELECT COUNT(*), bandStatus
FROM Staging
GROUP BY bandStatus;

#3# Identify all columns that uniquely identify each row
SELECT COUNT(*), bandName, bandId FROM Staging
GROUP BY bandId, bandName
HAVING COUNT(*) > 1;


#4# Check for missing values
SELECT city, country, genre, memberNames, albumNames, lyricalThemes
FROM Staging AS S
WHERE city = ''
OR country = ''
OR genre= ''
OR memberNames = ''
OR albumNames = ''
OR lyricalThemes = ''
OR formedIn = ''
OR bandStatus = '';

#5# Which columns have multiple comma separated columns
SELECT MAX(char_length(genre) - char_length(replace(genre, ',',''))) AS 'count', "genre" FROM Staging
UNION
SELECT MAX(char_length(lyricalThemes) - char_length(replace(lyricalThemes, ',',''))) AS 'count', "Lyrical Themes" FROM Staging
UNION
SELECT MAX(char_length(albumNames) - char_length(replace(albumNames, ',',''))) AS 'count', 'Album Names' FROM Staging
UNION
SELECT MAX(char_length(memberNames) - char_length(replace(memberNames, ',',''))) AS 'count', 'Band Members' FROM Staging
UNION
SELECT MAX(char_length(city) - char_length(replace(city, ',',''))) AS 'count', 'City' FROM Staging;


