-- 1-Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
SELECT * 
FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId;

-- 2-Select ExerciseCategory.Name and Exercise.Name where the ExerciseCategory does not have a ParentCategoryId (it is null).
SELECT ec.Name, e.Name 
FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId
	WHERE ParentCategoryId IS NULL;
    
-- 3-Rewrite the query using aliases:
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
SELECT ec.Name CategoryName, e.Name ExerciseName 
FROM exercise e
INNER JOIN exercisecategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId
	WHERE ParentCategoryId IS NULL;
    
-- 4-Select FirstName, LastName, and BirthDate from Client and EmailAddress from Login where Client.BirthDate is in the 1990s.
SELECT FirstName, LastName, BirthDate, EmailAddress 
FROM client c
INNER JOIN login l ON c.ClientId = l.ClientId
	WHERE BirthDate BETWEEN '1990-01-01' AND '1999-12-31';
    
-- 5-Select Workout.Name, Client.FirstName, and Client.LastName for Clients with LastNames starting with 'C'?
SELECT Name, FirstName, LastName 
FROM client c
INNER JOIN clientworkout cw ON c.ClientId = cw.ClientId
INNER JOIN workout w ON cw.WorkoutId = w.WorkoutId
	 WHERE LastName LIKE 'C%';

-- 6-Select Names from Workouts and their Goals.
SELECT w.Name workoutName, g.Name goalName
FROM workout w 
INNER JOIN workoutgoal wg ON w.WorkoutId = wg.WorkoutId
INNER JOIN goal g ON wg.GoalId = g.GoalId;

-- 7-Select client names and email addresses.
SELECT firstName, lastName, emailAddress 
FROM client c 
LEFT OUTER JOIN login l ON c.ClientId = l.ClientId;

-- Using the query above as a foundation, select Clients who do not have a Login.
SELECT firstName, lastName, emailAddress 
FROM client c 
LEFT OUTER JOIN login l ON c.ClientId = l.ClientId
	WHERE EmailAddress IS NULL;

-- 8-Does the Client, Romeo Seaward, have a Login? nope
SELECT firstName, lastName, emailAddress 
FROM client c 
LEFT OUTER JOIN login l ON c.ClientId = l.ClientId
	WHERE FirstName = 'Romeo' AND LastName = 'Seaward';

-- 9-Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
SELECT child.Name childCategory, parent.Name parentCategory
FROM ExerciseCategory parent 
INNER JOIN exercisecategory child ON child.parentcategoryId = parent.ExerciseCategoryId; 


-- 10-Rewrite the query above so that every ExerciseCategory.Name is included, even if it doesn't have a parent.
SELECT child.Name childCategory, parent.Name parentCategory
FROM ExerciseCategory child 
LEFT OUTER JOIN exercisecategory parent ON child.parentcategoryId = parent.ExerciseCategoryId; 

-- 11-Are there Clients who are not signed up for a Workout?
SELECT CONCAT(firstName, ' ', lastName) `Name`
FROM client c 
LEFT OUTER JOIN clientworkout cw ON c.clientId = cw.clientId
	WHERE cw.WorkoutId IS NULL;
    
-- 12-Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
SELECT firstName, lastName, w.Name 
FROM client c
INNER JOIN clientgoal cg ON c.ClientId = cg.ClientId
INNER JOIN goal g ON cg.GoalId = g.GoalId
INNER JOIN workoutgoal wg ON g.GoalId = wg.GoalId
INNER JOIN workout w ON wg.WorkoutId = w.WorkoutId
	WHERE firstname = 'Shell' AND lastname = 'Creane' AND w.LevelId = 1;
    
-- 13-Select all Workouts having the goal "Core Strength" OR having no goal specified. If you filter on Goal.Name in a WHERE clause, too few rows will be returned. Why? 4 rows vs. 26 rows
SELECT *
FROM workout w
LEFT OUTER JOIN workoutgoal wg ON w.WorkoutId = wg.WorkoutId
	WHERE wg.GoalId = 10;      -- 4 rows

SELECT *
FROM workout w
LEFT OUTER JOIN workoutgoal wg ON w.WorkoutId = wg.WorkoutId AND  wg.GoalId = 10;     -- 26 rows

-- 14-Select Workout.Name and Exercise.Name for related Workouts and Exercises.
SELECT w.Name workoutname, e.Name exerciseName
FROM workout w
INNER JOIN workoutday wd ON w.WorkoutId = wd.WorkoutId
INNER JOIN workoutdayexerciseinstance wde ON wd.WorkoutDayId = wde.WorkoutDayId
INNER JOIN exerciseinstance ei ON wde.ExerciseInstanceId = ei.ExerciseInstanceId
INNER JOIN exercise e ON ei.ExerciseId = e.ExerciseId;

-- 15-Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name for the 'Plank' exercise.   4 rows, 1 Unit, and 4 distinct Values
SELECT e.Name exerciseName, value, u.Name unitName
FROM exercise e
INNER JOIN exerciseinstance ei ON e.ExerciseId = ei.ExerciseId
INNER JOIN exerciseinstanceunitvalue eiuv ON ei.ExerciseInstanceId = eiuv.ExerciseInstanceId
INNER JOIN unit u ON eiuv.UnitId = u.UnitId
	WHERE e.Name = 'Plank';