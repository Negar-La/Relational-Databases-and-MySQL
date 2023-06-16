DROP DATABASE IF EXISTS vinylrecordshop;
CREATE DATABASE vinylrecordshop;
USE vinylrecordshop;

CREATE TABLE album (
    albumId INT AUTO_INCREMENT,
    albumTitle VARCHAR(100) NOT NULL,
    label VARCHAR(50),
    releaseDate DATE,
    price DECIMAL(5,2),
    CONSTRAINT pk_album 
        PRIMARY KEY (albumId)
);

describe album;

CREATE TABLE artist(
artistId INT auto_increment,
artistFirstName VARCHAR(25),
artistLastName VARCHAR(50) NOT NULL,
constraint artistId 
	PRIMARY KEY (artistId)
);

DESCRIBE artist;

CREATE TABLE band (
bandId INT auto_increment,
bandName VARCHAR(50) NOT NULL,
CONSTRAINT pk_band 
	primary key (bandId)
);

describe band;

CREATE TABLE song (
songId INT not null auto_increment,
songTitle VARCHAR(100) NOT NULL,
videoURL varchar(100),
bandId INT NOT NULL,
CONSTRAINT pk_song
	primary key (songId),
constraint fk_song_band 
	foreign key (bandId)
	references band(bandId)
);

DESCRIBE song;

create table songAlbum (
albumId INT,
songId INT,
constraint pk_songAlbum
	primary key(songId, albumId),
constraint fk_songAlbum_song
	foreign key (songId)
	references song(songId),
constraint fk_songAlbum_album
	foreign key (albumId)
	references album(albumId)
);

describe songAlbum;

create table bandArtist (
bandId INT,
artistId INT,
constraint pk_songAlbum
	primary key(bandId, artistId),
constraint fk_bandArtist_band
	foreign key (bandid)
	references band(bandId),
constraint fk_bandArtist_artist
	foreign key (artistId)
	references artist(artistId)   
);

describe bandArtist;

SHOW TABLES;


