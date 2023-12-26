# Week 8 lab solution

create schema if not exists zoo_lab;

use zoo_lab;

# 
# remove all tables to allow for creation below
#
drop table if exists Animal;
drop table if exists Location;
drop table if exists Species;

create table Species (
    SpeciesId  integer     AUTO_INCREMENT PRIMARY KEY,
    CommonName varchar(25) NOT NULL,
    Species    varchar(50) NOT NULL
);

create table Location (
    LocationId  integer     AUTO_INCREMENT PRIMARY KEY,
		Location    varchar(30) NOT NULL,
    ViewingArea integer     NOT NULL COMMENT 'Area in square feet'
);

create table Animal (
    AnimalId       integer     AUTO_INCREMENT PRIMARY KEY,
    AnimalName     varchar(25) NOT NULL,
    BirthDate      date        NOT NULL,
    Weight         mediumint   NOT NULL,
    DateAtLocation date        NOT NULL,
    SpeciesId      integer     NOT NULL,
    LocationId     integer     NOT NULL COMMENT 'Assumes we only keep track of current location'
);

# 
# indexes
#
create index AnimalName_ix 
  on Animal(AnimalName);

create index LocName_ix
  on Location(Location);
