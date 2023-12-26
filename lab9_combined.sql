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
  
#
# start of lab 9
# part A: add foreign key constraints
#
alter table Animal
add constraint Animal_Spec_FK FOREIGN KEY (SpeciesId)
    references Species(SpeciesId);
    
alter table Animal
add constraint Animal_Loc_FK FOREIGN KEY (LocationId)
    references Location(LocationId);

#
# lab 9, part B: make changes to structure 
#

# remove the ViewingArea field
alter table Location
drop column ViewingArea;

# Add a DonatedBy field to Animal
alter table Animal
add column DonatedBy varchar(50) null;

# rename Location field to ViewingLocation
alter table Location
rename column Location to ViewingLocation;

# move SpeciesId field
alter table Animal
modify column SpeciesId int not null
    after AnimalName;
    
# force ViewingLocation to be unique
alter table Location
add constraint ViewingLoc_UQ unique (ViewingLocation);
# could also be done using "modify column"

# make name and animal type combo unique
alter table Animal
add constraint Name_Spec_UQ unique (AnimalName, SpeciesId);

# Allow longer animal names
alter table Animal
modify column AnimalName varchar(35) not null;