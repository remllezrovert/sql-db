
##Populate Country
USE Metal;
INSERT INTO Country
(countryName) 
SELECT DISTINCT country FROM Staging;


##Populate BandCountry
INSERT IGNORE INTO BandCountry
(bandId, countryId)
SELECT bandId, C.countryId
FROM Staging
INNER JOIN Country AS C
ON countryName LIKE country;
