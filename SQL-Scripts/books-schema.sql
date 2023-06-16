DROP DATABASE IF EXISTS books;
CREATE DATABASE books;
USE books;

CREATE TABLE author (
authorId INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
firstName VARCHAR(25) NOT NULL,
middleName VARCHAR(25),
lastName VARCHAR(50) NOT NULL,
gender CHAR(1),
dateOfBirth DATE NOT NULL,
dateOfDeath DATE
);

DESCRIBE author;
DROP TABLE author;

CREATE TABLE book (
bookId INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
publicationDate DATE
);

DESCRIBE book;

CREATE TABLE format (
formatId INT AUTO_INCREMENT PRIMARY KEY,
formatName VARCHAR(12) NOT NULL
);

DESCRIBE format;

CREATE TABLE genre (
genreId  INT AUTO_INCREMENT PRIMARY KEY,
genreName VARCHAR(25) NOT NULL
);

DESCRIBE genre;

CREATE TABLE authorBook (
authorId INT,
bookId INT,
CONSTRAINT pk_authorBook
	PRIMARY KEY(authorId, bookId),
CONSTRAINT fk_authorbook_author
	FOREIGN KEY (authorId)
    REFERENCES author(authorId),
CONSTRAINT fk_authorbook_book
	FOREIGN KEY (bookId)
    REFERENCES book(bookId)
);

DESCRIBE authorBook;

CREATE TABLE bookFormat (
bookId INT,
formatId INT,
price DOUBLE,
quantityonHand INT,
CONSTRAINT pk_bookFormat
	PRIMARY KEY (bookId, formatId),
CONSTRAINT fk_bookFormat_book
	FOREIGN KEY (bookId)
    REFERENCES book(bookId),
CONSTRAINT fk_bookFormat_format
	FOREIGN KEY (formatId)
    REFERENCES format(formatId)
);
    
DESCRIBE bookFormat;

CREATE TABLE bookGenre (
bookId INT,
genreId INT,
CONSTRAINT pk_bookGenre
	PRIMARY KEY (bookId, genreId),
CONSTRAINT fk_bookGenre_book
	FOREIGN KEY (bookId)
    REFERENCES book(bookId),
CONSTRAINT fk_bookGenre_Genre
	FOREIGN KEY (genreId)
    REFERENCES genre(genreId)
    );
    
DESCRIBE bookGenre;
