
CREATE SCHEMA IF NOT EXISTS ZOO;
USE ZOO;
CREATE TABLE IF NOT EXISTS Animal (
    animalID int  NOT NULL AUTO_INCREMENT,
    speciesID int  NOT NULL,
    name char(30)  NULL,
    weight int  NULL,
    birthDate date  NULL,
    CONSTRAINT Animal_pk PRIMARY KEY (animalID)
);

CREATE TABLE IF NOT EXISTS AnimalLocation (
    animalLocationID int  NOT NULL AUTO_INCREMENT,
    animalID int  NOT NULL,
    locationID int  NOT NULL,
    date date  NOT NULL,
    CONSTRAINT AnimalLocation_pk PRIMARY KEY (animalLocationID)
);

CREATE TABLE IF NOT EXISTS Location (
    locationId int  NOT NULL AUTO_INCREMENT,
    location char(40)  NOT NULL,
    viewingArea bigint  NOT NULL,
    CONSTRAINT Location_pk PRIMARY KEY (locationId)
);

CREATE TABLE IF NOT EXISTS Species (
    speciesID int  NOT NULL AUTO_INCREMENT,
    commonName varchar(50)  NOT NULL,
    species varchar(60)  NOT NULL,
    CONSTRAINT Species_pk PRIMARY KEY (speciesID)
);


CREATE INDEX AnimalNameIndex
	ON Animal 
    	(name);
        
CREATE INDEX LocationIndex
	ON Location
    	(location);
