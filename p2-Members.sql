# Populate Members table
#USE Metal;
#SELECT MAX(char_length(memberNames) - char_length(replace(memberNames, ',',''))) FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 2), ',', -1))
END) AS memberNames
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 1
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 3), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 2
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 4), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 3
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 5), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 4
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 6), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 5
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 7), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 6
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 8), ',', -1))
END)
FROM Staging;

INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 7
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 9), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 8
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 10), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 9
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 11), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 10
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 12), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 11
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 13), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 12
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 14), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 13
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 15), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 14
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 16), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 15
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 17), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 16
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 18), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 17
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 19), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 18
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 20), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 19
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 21), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 20
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 22), ',', -1))
END)
FROM Staging;