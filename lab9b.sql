USE zoo_lab;
ALTER TABLE Location
	DROP ViewingArea,
	RENAME COLUMN Location TO ViewingLocation,
	ADD CONSTRAINT UC_Location UNIQUE (ViewingLocation);

ALTER TABLE Animal
	ADD COLUMN DonatedBy varchar(50) null,
	MODIFY COLUMN SpeciesId integer AFTER AnimalName,
	ADD CONSTRAINT UC_Animal UNIQUE (AnimalName, SpeciesId),
	MODIFY COLUMN AnimalName varchar(35);