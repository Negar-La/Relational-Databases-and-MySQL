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
    
-- 14-Select the Name of each ExerciseCategory that has a parent (ParentCategoryId value is not null). (12 rows)
SELECT Name FROM ExerciseCategory
	WHERE ParentCategoryId IS NOT NULL;
    
-- 15-Select Name and Notes of each level 3 Workout that contains the word 'you' in its Notes. (4 rows)
SELECT Name, Notes FROM workout
	WHERE levelId = 3 AND notes LIKE '%you%';
    
-- 16-Select FirstName, LastName, City from Client whose LastName starts with L,M, or N and who live in LaPlace. (5 rows)
SELECT FirstName, LastName, City FROM client
	WHERE City = 'LaPlace' AND (LastName LIKE 'L%' OR 'M%' OR 'N%'); 
    
-- 17-Select InvoiceId, Description, Price, Quantity, ServiceDate and the line item total, a calculated value, from InvoiceLineItem, where the line item total is between 15 and 25 dollars. (667 rows)
SELECT InvoiceId, Description, Price, Quantity, ServiceDate, (price * Quantity) AS line_item_total FROM InvoiceLineItem
	WHERE (price * Quantity) BETWEEN 15 AND 25;
    
-- 18-Does the database include an email address for the Client, Estrella Bazely?   Answer: ebazelybf@123-reg.co.uk
-- First Select a Client record for Estrella Bazely. Does it exist?
SELECT * FROM client
	WHERE FirstName = 'Estrella' AND LastName = 'Bazely';
    
-- Second If it does, select a Login record that matches its ClientId.
SELECT EmailAddress FROM login
	WHERE ClientId = '87976c42-9226-4bc6-8b32-23a8cd7869a5';
    
-- 19-What are the Goals of the Workout with the Name 'This Is Parkour'?
SELECT workoutId, Name FROM workout
	WHERE Name = 'This Is Parkour';		-- 12
    
SELECT workoutId, goalId FROM workoutgoal
	WHERE workoutId = 12;				-- 3, 8, 15
    
SELECT Name FROM goal
	WHERE goalId IN (3, 8, 15);