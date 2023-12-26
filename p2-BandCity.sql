

INSERT IGNORE INTO BandCity (bandId, cityId)
WITH CTE AS (
SELECT REPLACE(city, ';', ',') AS city, bandId
FROM (
	SELECT REPLACE(city, '/', ',') AS city, bandId
    FROM (
	SELECT
	(CASE
	WHEN city LIKE '%(%)%'
	THEN CONCAT(
		TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, '(', 1), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, '(', 2), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, '(', 3), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, '(', 4), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, '(', 5), ')', -1))
	    )
	ELSE city
	END) AS city, bandId
	FROM Staging

        WHERE city <> 'N/A' AND city IS NOT NULL
    ) AS E1
) AS E
)
SELECT bandId, cityId
FROM CTE
INNER JOIN City AS C
ON (C.cityName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 2), ',', -1)))
UNION
SELECT bandId, cityId
FROM CTE
INNER JOIN City AS C
ON (C.cityName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 3), ',', -1)))
UNION
SELECT bandId, cityId
FROM CTE
INNER JOIN City AS C
ON (C.cityName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 4), ',', -1)))
UNION
SELECT bandId, cityId
FROM CTE
INNER JOIN City AS C
ON (C.cityName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 5), ',', -1)))
UNION
SELECT bandId, cityId
FROM CTE
INNER JOIN City AS C
ON (C.cityName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 6), ',', -1)));



