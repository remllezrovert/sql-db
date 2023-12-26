USE zoo_lab;
set sql_safe_updates = 0;
DELETE
FROM Staging
WHERE `Animal Name` LIKE '%test%';


UPDATE Staging
SET
	Donated = NULL
WHERE Donated = '';


DELETE FROM Animal;
DELETE FROM Location;
DELETE FROM Species;

INSERT INTO Location
(ViewingLocation)
SELECT DISTINCT Location
FROM Staging;


INSERT INTO Species
(CommonName, Species)
SELECT DISTINCT `Common Name`, Species
FROM Staging;



INSERT IGNORE INTO Animal
	(AnimalName, BirthDate, Weight, DonatedBy, DateAtLocation, LocationId, SpeciesId)
SELECT `Animal Name` AS AnimalName, 
STR_TO_DATE(Birthdate,'%d-%M-%y') AS BirthDate,
CAST(LEFT(Weight, char_length(Weight) - 3) AS UNSIGNED),
Donated AS DonatedBy,
STR_TO_DATE(`Date at Location`,'%m/%d/%Y') AS DateAtLocation,
L.LocationId AS LocationId,
SP.SpeciesId AS SpeciesId
FROM Staging AS S
INNER JOIN Location AS L
ON (L.ViewingLocation = S.Location)
INNER JOIN Species AS SP
ON (SP.Species = S.Species);


