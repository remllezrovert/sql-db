


CREATE TABLE Band (
    bandId bigint  NOT NULL,
    bandName varchar(100)  NOT NULL,
    bandStatus varchar(20)  NOT NULL,
    formedIn varchar(4)  NOT NULL,
    CONSTRAINT Band_pk PRIMARY KEY (bandId)
);


USE Metal;
CREATE TABLE Album (
    albumId int AUTO_INCREMENT NOT NULL,
    bandId bigint  NOT NULL,
    albumName varchar(120)  NOT NULL,
    CONSTRAINT Album_pk PRIMARY KEY (albumId)
);

CREATE TABLE BandCity (
    bandId bigint NOT NULL,
    cityId int  NOT NULL,
    CONSTRAINT BandCity_pk PRIMARY KEY (bandId,cityId)
);

CREATE TABLE BandCountry (
    bandId bigint NOT NULL,
    countryId int  NOT NULL,
    CONSTRAINT BandCountry_pk PRIMARY KEY (bandId,countryId)
);

CREATE TABLE BandGenre (
    bandId bigint NOT NULL,
    genreId int  NOT NULL,
    CONSTRAINT BandGenre_pk PRIMARY KEY (bandId,genreId)
);

CREATE TABLE BandMember (
    bandId bigint  NOT NULL,
    memberId int  NOT NULL,
    CONSTRAINT BandMember_pk PRIMARY KEY (bandId,memberId)
);

CREATE TABLE BandTheme (
    bandId bigint  NOT NULL,
    themeId int  NOT NULL,
    CONSTRAINT BandTheme_pk PRIMARY KEY (bandId,themeId)
);


CREATE TABLE City (
    cityId int AUTO_INCREMENT NOT NULL,
    cityName varchar(60)  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (cityId)
);


CREATE TABLE Country (
    countryId int AUTO_INCREMENT,
    countryName varchar(60)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (countryId)
);



CREATE TABLE Genre (
    genreId int AUTO_INCREMENT NOT NULL,
    genreName varchar(35)  NOT NULL,
    CONSTRAINT Genre_pk PRIMARY KEY (genreId)
);


CREATE TABLE Member (
    memberId int AUTO_INCREMENT NOT NULL,
    memberName varchar(80)  NOT NULL,
    CONSTRAINT Member_pk PRIMARY KEY (memberId)
);


CREATE TABLE Theme (
    themeId int AUTO_INCREMENT NOT NULL,
    themeName varchar(40)  UNIQUE NOT NULL,
    CONSTRAINT Theme_pk PRIMARY KEY (themeId)
);


ALTER TABLE BandCity ADD CONSTRAINT BandCity_Band FOREIGN KEY BandCity_Band (bandId)
    REFERENCES Band (bandId);


ALTER TABLE BandCity ADD CONSTRAINT BandCity_City FOREIGN KEY BandCity_City (cityId)
    REFERENCES City (cityId);


ALTER TABLE BandCountry ADD CONSTRAINT BandCountry_Band FOREIGN KEY BandCountry_Band (bandId)
    REFERENCES Band (bandId);


ALTER TABLE BandCountry ADD CONSTRAINT BandCountry_Country FOREIGN KEY BandCountry_Country (countryId)
    REFERENCES Country (countryId);
    

ALTER TABLE Member ADD CONSTRAINT memberName UNIQUE (memberName);

ALTER TABLE BandGenre ADD CONSTRAINT BandGenre_Band FOREIGN KEY BandGenre_Band (bandId)
    REFERENCES Band (bandId);


ALTER TABLE BandGenre ADD CONSTRAINT BandGenre_Genre FOREIGN KEY BandGenre_Genre (genreId)
    REFERENCES Genre (genreId);


ALTER TABLE BandMember ADD CONSTRAINT BandMember_Band FOREIGN KEY BandMember_Band (bandId)
    REFERENCES Band (bandId);


ALTER TABLE BandMember ADD CONSTRAINT BandMember_member FOREIGN KEY BandMember_member (memberId)
    REFERENCES Member (memberId);


ALTER TABLE BandTheme ADD CONSTRAINT BandTheme_Band FOREIGN KEY BandTheme_Band (bandId)
    REFERENCES Band (bandId);


ALTER TABLE BandTheme ADD CONSTRAINT BandTheme_Theme FOREIGN KEY BandTheme_Theme (themeId)
    REFERENCES Theme (themeId);


ALTER TABLE Album ADD CONSTRAINT Album_Band FOREIGN KEY Album_Band (bandId)
    REFERENCES Band (bandId);



