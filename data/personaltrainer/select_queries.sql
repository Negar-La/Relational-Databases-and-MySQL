-- 1-Select all rows and columns from the Exercise table. (64 rows)
SELECT * FROM exercise;

-- 2-Select all rows and columns from the Client table. (500 rows)
SELECT * FROM client;

-- 3-Select all columns from Client where the City is Metairie. (29 rows)
SELECT * FROM client
	WHERE city = 'Metairie';
    
-- 4-Is there a Client with the ClientId '818u7faf-7b4b-48a2-bf12-7a26c92de20c'? (0 rows)
SELECT * FROM client 
WHERE clientid = '818u7faf-7b4b-48a2-bf12-7a26c92de20c';

-- 5-How many rows are in the Goal table? (17 rows)
SELECT * FROM goal;
SELECT count(*) FROM goal;

-- 6-Select Name and LevelId from the Workout table. (26 rows)
SELECT Name, LevelId FROM workout;

-- 7-Select Name, LevelId, and Notes from Workout where LevelId is 2. (11 rows)
SELECT Name, LevelId, Notes FROM workout 
	WHERE LevelId = 2;
    
-- 8-Select FirstName, LastName, and City from Client where City is Metairie, Kenner, or Gretna. (77 rows)
SELECT FirstName, LastName, City FROM client
	WHERE City IN ('Metairie', 'Kenner', 'Gretna');
    
-- 9-Select FirstName, LastName, and BirthDate from Client for Clients born in the 1980s. (72 rows)
SELECT FirstName, LastName, BirthDate FROM client
	WHERE BirthDate BETWEEN '1980-01-01' AND '1989-12-31';
    
-- 10-Write the query above in a different way.
SELECT FirstName, LastName, BirthDate FROM client
	WHERE BirthDate >= '1980-01-01' AND BirthDate <='1989-12-31';
    
-- 11-How many rows in the Login table have a .gov EmailAddress? (17 rows)
SELECT * FROM login 
	WHERE EmailAddress LIKE '%.gov';
    
-- 12-How many Logins do NOT have a .com EmailAddress? (122 rows)
SELECT * FROM login
	WHERE EmailAddress NOT LIKE '%.com';
    
-- 13-Select first and last name of Clients without a BirthDate. (37 rows)
SELECT FirstName, LastNamE FROM client 
	WHERE BirthDate IS NULL;