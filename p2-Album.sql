# Populate Albums table
#USE Metal;
#SELECT * FROM Album
#SELECT MAX(char_length(albumNames) - char_length(replace(albumNames, ',',''))) FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 2), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 1
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 3), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 2
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 4), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 3
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 5), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 4
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 6), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 5
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 7), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 6
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 8), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 7
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 9), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 8
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 10), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 9
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 11), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 10
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 12), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 11
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 13), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 12
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 14), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 13
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 15), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 14
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 16), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 15
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 17), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 16
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 18), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 17
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 19), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 18
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 20), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 19
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 21), ',', -1))
END), bandId
FROM Staging;
INSERT IGNORE INTO Album (albumName, bandId)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(albumNames) - CHAR_LENGTH(REPLACE(albumNames, ',', '')) > 20
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(albumNames, ',', 22), ',', -1))
END), bandId
FROM Staging;
