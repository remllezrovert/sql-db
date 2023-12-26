# Populate Genres table
#USE Metal;
#SELECT MAX(char_length(genre) - char_length(replace(genre, ',',''))) FROM Staging;
SELECT * FROM Genre;

INSERT IGNORE INTO Genre (genreName)
WITH CTE AS (
SELECT REPLACE(genre, ';', ',') AS genre
FROM (
	SELECT REPLACE(genre, '/', ',') AS genre
    FROM (
	SELECT
	(CASE
	WHEN genre LIKE '%(%)%'
	THEN CONCAT(
		TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '(', 1), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '(', 2), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '(', 3), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '(', 4), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, '(', 5), ')', -1))
	    )
	ELSE genre
	END) AS genre
	FROM Staging

        WHERE genre <> 'N/A' AND genre IS NOT NULL
    ) AS E1
) AS E
)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 2), ',', -1))
END) AS genre
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 1
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 3), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 2
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 4), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 3
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 5), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 4
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 6), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 5
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 7), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) > 6
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 8), ',', -1))
END)
FROM CTE;


