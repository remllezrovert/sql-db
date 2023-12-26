## Populate Band table


USE Metal;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE Metal.BandCountry;
TRUNCATE Metal.BandCity;
TRUNCATE Metal.BandGenre;
TRUNCATE Metal.BandTheme;
TRUNCATE Metal.BandMember;
TRUNCATE Metal.Album;
TRUNCATE Metal.Country;
TRUNCATE Metal.City;
TRUNCATE Metal.Genre;
TRUNCATE Metal.Theme;
TRUNCATE Metal.Band;
INSERT IGNORE INTO Band
(
bandId,
bandName,
formedIn,
bandStatus
)
SELECT
bandId,
bandName,
formedIn,
bandStatus
FROM Staging;

##Populate Country
USE Metal;
INSERT INTO Country
(countryName) 
SELECT DISTINCT country 
FROM Staging;


##Populate BandCountry
INSERT IGNORE INTO BandCountry
(bandId, countryId)
SELECT bandId, C.countryId
FROM Staging
INNER JOIN Country AS C
ON countryName LIKE country;


#Populate City
INSERT IGNORE INTO City (cityName)
WITH CTE AS (
SELECT REPLACE(city, ';', ',') AS city
FROM (
	SELECT REPLACE(city, '/', ',') AS city
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
	END) AS city
	FROM Staging

        WHERE city <> 'N/A' AND city IS NOT NULL
    ) AS E1
) AS E
)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 1), ',', -1))
END) AS city 
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 2), ',', -1))
END) AS city
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 1
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 3), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 2
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 4), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 3
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 5), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 4
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 6), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 5
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 7), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(city) - CHAR_LENGTH(REPLACE(city, ',', '')) > 6
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(city, ',', 8), ',', -1))
END)
FROM CTE;


#Populate BandCity
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
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.city, ',', 1), ',', -1)))
UNION
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



##Populate Genre
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
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 1), ',', -1))
END) AS genre
FROM CTE UNION
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


##Populate BandGenre
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
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.genre, ',', 1), ',', -1)))
UNION
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



#Populate Themes
INSERT IGNORE INTO Theme (themeName)
WITH CTE AS (
SELECT REPLACE(theme, ';', ',') AS theme
FROM (
	SELECT REPLACE(theme, '/', ',') AS theme
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
	END) AS theme
	FROM Staging
        WHERE lyricalThemes <> 'N/A' AND lyricalThemes IS NOT NULL
    ) AS E1
) AS E
)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 1), ',', -1))
END) AS theme
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 0
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 2), ',', -1))
END) AS theme
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 1
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 3), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 2
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 4), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 3
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 5), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 4
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 6), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 5
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 7), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 6
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 8), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 7
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 9), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 7
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 9), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 7
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 9), ',', -1))
END)
FROM CTE UNION
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(theme) - CHAR_LENGTH(REPLACE(theme, ',', '')) > 8
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(theme, ',', 10), ',', -1))
END)
FROM CTE;

#Populate BandTheme
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
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(CTE.theme, ',', 1), ',', -1)))
UNION
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


#Populate Album
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




#Populate Member
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
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 21
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 23), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 22
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 24), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 23
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 25), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 24
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 26), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 25
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 27), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 26
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 28), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 27
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 29), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 28
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 30), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 29
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 31), ',', -1))
END)
FROM Staging;
INSERT IGNORE INTO Member (memberName)
SELECT DISTINCT(
CASE
WHEN CHAR_LENGTH(memberNames) - CHAR_LENGTH(REPLACE(memberNames, ',', '')) > 30
THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(memberNames, ',', 32), ',', -1))
END)
FROM Staging;




#Populate BandMember
USE Metal;
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 2), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 3), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 4), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 5), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 6), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 7), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 8), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 9), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 10), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 11), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 12), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 13), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 14), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 15), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 16), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 17), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 18), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 19), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 20), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 21), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 22), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 23), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 24), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 25), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 26), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 27), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 28), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 29), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 30), ',', -1)));

