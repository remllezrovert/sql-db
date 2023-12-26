


CREATE SCHEMA IF NOT EXISTS Metal;
USE Metal;
DROP TABLE IF EXISTS Staging;
CREATE TABLE IF NOT EXISTS Staging (
	bandId BIGINT PRIMARY KEY,
	bandName varchar(60) NOT NULL,
	formedIn text NULL,
	city text NULL,
    	country varchar(40) NULL,
	genre varchar(120) null,
	lyricalThemes varchar(120) null,
    	bandStatus varchar(60) null,
	memberNames text null,
	albumNames text null
);

LOAD DATA LOCAL INFILE '/home/remllez/Documents/db/bmy.csv'
INTO TABLE Staging
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
ESCAPED BY '\\'
##LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* 
*/
