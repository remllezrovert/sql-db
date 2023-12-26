
#Populate bandMember



INSERT IGNORE INTO BandGenre (bandId, genreId)
WITH CTE AS (
SELECT REPLACE(genre, ';', ',') AS genre, bandId
FROM (
	SELECT REPLACE(genre, '/', ',') AS genre, bandId
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
	END) AS genre, bandId
	FROM Staging

        WHERE genre <> 'N/A' AND genre IS NOT NULL
    ) AS E1
) AS E
)
SELECT bandId, genreId
FROM CTE
INNER JOIN Genre AS C
ON (C.genreName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 2), ',', -1)))
UNION
SELECT bandId, genreId
FROM CTE
INNER JOIN Genre AS C
ON (C.genreName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 3), ',', -1)))
UNION
SELECT bandId, genreId
FROM CTE
INNER JOIN Genre AS C
ON (C.genreName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 4), ',', -1)))
UNION
SELECT bandId, genreId
FROM CTE
INNER JOIN Genre AS C
ON (C.genreName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 5), ',', -1)))
UNION
SELECT bandId, genreId
FROM CTE
INNER JOIN Genre AS C
ON (C.genreName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 6), ',', -1)));



