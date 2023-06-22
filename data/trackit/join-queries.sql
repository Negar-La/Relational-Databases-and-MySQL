USE TrackIt;
SELECT *
FROM TaskStatus
WHERE IsResolved = 1;

SELECT *
FROM Task
WHERE TaskStatusId BETWEEN 5 AND 8;

-- INNER JOIN
SELECT 
    Task.TaskId,
    Task.Title,
    TaskStatus.Name AS StatusName
FROM TaskStatus
INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;

-- why backticks in `Name` ?
SELECT 
    TaskId,
    Title,
    `Name`
FROM Task
INNER JOIN TaskStatus ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;

-- Multiple JOINs
SELECT
    Project.Name,
    Worker.FirstName,
    Worker.LastName
FROM Project
INNER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
INNER JOIN Worker using (WorkerId)
WHERE Project.ProjectId = 'game-goodboy';

SELECT
    Project.Name,
    Worker.FirstName,
    Worker.LastName,
    Task.Title
FROM Project
INNER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
INNER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
INNER JOIN Task ON ProjectWorker.ProjectId = Task.ProjectId
    AND ProjectWorker.WorkerId = Task.WorkerId
WHERE Project.ProjectId = 'game-goodboy';

-- OUTER JOIN
SELECT * FROM Task;

-- The JOIN condition Task.TaskStatusId = TaskStatus.TaskStatusId fails for the 11 tasks with TaskStatusId = null.
SELECT *
FROM Task
INNER JOIN TaskStatus ON Task.TaskStatusId = TaskStatus.TaskStatusId;

SELECT * 
FROM Task
WHERE TaskStatusId IS NULL;

SELECT *
FROM Task
LEFT OUTER JOIN TaskStatus 
    ON Task.TaskStatusId = TaskStatus.TaskStatusId;
    
-- Replacing a NULL Value With IFNULL()
SELECT
    Task.TaskId,
    Task.Title,
    IFNULL(Task.TaskStatusId, 0) AS TaskStatusId,
    IFNULL(TaskStatus.Name, '[None]') AS StatusName
FROM Task
LEFT OUTER JOIN TaskStatus 
    ON Task.TaskStatusId = TaskStatus.TaskStatusId;