-- 1-Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
SELECT * FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId;

-- 2-Select ExerciseCategory.Name and Exercise.Name where the ExerciseCategory does not have a ParentCategoryId (it is null).
SELECT ec.Name, e.Name FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId
	WHERE ParentCategoryId IS NULL;
    
-- 3-Rewrite the query using aliases:
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
SELECT ec.Name CategoryName, e.Name ExerciseName FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId
	WHERE ParentCategoryId IS NULL;
    
-- 4-Select FirstName, LastName, and BirthDate from Client and EmailAddress from Login where Client.BirthDate is in the 1990s.
SELECT FirstName, LastName, BirthDate, EmailAddress FROM client c
INNER JOIN login l ON c.ClientId = l.ClientId
	WHERE BirthDate BETWEEN '1990-01-01' AND '1999-12-31';
    
-- 5-Select Workout.Name, Client.FirstName, and Client.LastName for Clients with LastNames starting with 'C'?
SELECT Name, FirstName, LastName FROM client c
INNER JOIN clientworkout cw ON c.ClientId = cw.ClientId
INNER JOIN workout w ON cw.WorkoutId = w.WorkoutId
	 WHERE LastName LIKE 'C%';
