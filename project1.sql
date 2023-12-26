USE Movies;
SELECT 
	Title,
    Runtime AS 'Duration',
    (CASE
		WHEN IMDBRating >= 8.5 THEN 'Excellent'
		WHEN IMDBRating >= 8.0 THEN 'Very Good'
        WHEN IMDBRating >= 7.5 THEN 'Good'
        ELSE 'Ok'
	END) AS 'Ratings Category',
    YEAR(CURRENT_DATE()) - ReleaseYear AS 'Years Since Release',
    CONCAT("$", FORMAT(GrossRevenue / 1000000, 1)) AS "Gross Revenue ($1MM)"
FROM Movie
WHERE Runtime >= 105 
	AND Runtime <= 120 
    AND Title LIKE 'G%'
    AND GrossRevenue IS NOT NULL
ORDER BY `Years Since Release` ASC;


USE Movies;
SELECT MovieRating, COUNT(*) AS 'Number of Movies'
FROM Movie
INNER JOIN Rating AS R
	ON MovieRating = Code
WHERE ReleaseYear < 2010
GROUP BY MovieRating
HAVING MovieRating IN ('G', 'PG', 'A');

USE Movies;
SELECT Title,
	CONCAT_WS(' ',FirstName, MiddleName, LastName) AS Name,
    BillingRank AS 'Billing Rank'
FROM Movie AS M
INNER JOIN MovieActor AS MA
	ON MA.MovieId = M.MovieId
INNER JOIN Celebrity AS C
	USING (CelebrityID)
WHERE Title LIKE '%sunshine%'
ORDER BY BillingRank ASC;


USE Movies;
SELECT Genre, 
COUNT(*) AS 'Number of Movies', 
MAX(IMDBRating) AS 'Highest Rating'
FROM Genre
INNER JOIN MovieGenre
	USING (GenreId)
INNER JOIN Movie
	USING (MovieId)
GROUP BY Genre
ORDER BY `Number of Movies` DESC;




USE Movies;
SELECT Title, ReleaseYear, Genre, MovieRating, Category
FROM Movie AS M
INNER JOIN MovieGenre AS MG
	USING (MovieId)
INNER JOIN Genre AS G
	ON G.GenreId = MG.GenreId
    AND Genre = 'Horror'
INNER JOIN Rating
	ON MovieRating = Code
ORDER BY ReleaseYear ASC, Title ASC;


USE Movies;
SELECT Title,
IMDBRating AS 'Rating',
CONCAT_WS(" ", C.FirstName, C.LastName) AS 'Leading Actor'
FROM Movie AS M
INNER JOIN Celebrity
	ON CONCAT_WS(" ", FirstName, LastName) = 'Martin Scorsese'
    AND DirectorId = CelebrityId
INNER JOIN MovieActor AS MA
	ON M.MovieId = MA.MovieId
	AND BillingRank = 1
INNER JOIN Celebrity AS C
	ON C.CelebrityId = MA.CelebrityId
WHERE IMDBRating >= 8.0
ORDER BY Title ASC;


USE Movies;
SELECT COUNT(*) AS 'Forgetables'
FROM Celebrity AS C
LEFT OUTER JOIN MovieActor AS MA
	ON BillingRank = 1
	AND C.CelebrityId = MA.CelebrityId
GROUP BY MovieId
HAVING MovieId IS NULL;


USE Movies;
SELECT 
CONCAT_WS(' ', FirstName, LastName) AS 'Name', 
COUNT(*) AS 'Appearances',
FORMAT(AVG(IMDBRating), 2) AS 'Average Rating'
FROM Celebrity
INNER JOIN MovieActor
	USING(CelebrityId)
INNER JOIN Movie
	USING(MovieId)
GROUP BY CelebrityId
HAVING COUNT(*) >= 5
ORDER BY COUNT(*)
LIMIT 10;


##5 Worst unrated horror movies published before 1980
USE Movies;
SELECT Title, 
ReleaseYear AS 'Year',
FORMAT(AVG(IMDBRating), 2) AS 'Average Rating',
MovieRating AS 'Parental Rating'
FROM Movie AS M
INNER JOIN MovieGenre AS MG
	USING (MovieId)
INNER JOIN Genre AS G
	ON G.GenreId = MG.GenreId
    AND Genre = 'Horror'
GROUP BY MovieId
HAVING MovieRating IS NULL AND ReleaseYear < 1980
ORDER BY `Average Rating` ASC
LIMIT 5;





    
    
    
    
