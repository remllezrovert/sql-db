
#Populate bandMember



INSERT IGNORE INTO BandTheme (bandId, themeId)
WITH CTE AS (
SELECT REPLACE(theme, ';', ',') AS theme, bandId
FROM (
	SELECT REPLACE(theme, '/', ',') AS theme, bandId
    FROM (
	SELECT
	(CASE
	WHEN lyricalThemes LIKE '%(%)%'
	THEN CONCAT(
		TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 1), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 2), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 3), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 4), ')', -1)),
	    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 5), ')', -1)),
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 6), ')', -1)),
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(lyricalThemes, '(', 7), ')', -1))
	    )
	ELSE lyricalThemes 
	END) AS theme, bandId
	FROM Staging
        WHERE lyricalThemes <> 'N/A' AND lyricalThemes IS NOT NULL
    ) AS E1
) AS E
)
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 2), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 3), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 4), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 5), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 6), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 7), ',', -1)))
UNION
SELECT bandId, themeId
FROM CTE
INNER JOIN Theme AS C
ON (C.themeName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 8), ',', -1)));



