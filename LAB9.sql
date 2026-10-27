CREATE DATABASE lab9;
USE lab9;

CREATE TABLE Exam
(
Examno INT PRIMARY KEY,
Subject VARCHAR(30),
Date_Time DATETIME,
Duration INT
);

CREATE TABLE Result
(
Sid INT PRIMARY KEY,
Examno INT,
Marks INT,
FOREIGN KEY (Examno) REFERENCES Exam(Examno)
);-- Insert into Exam
INSERT INTO Exam VALUES
(101,
'English'
,
'2025-01-10 09:00:00'

,3),

(102,
'Mathematics'
,
'2025-01-12 10:00:00'

,3),

(103,
'Science'
,
'2025-01-15 09:30:00'

,2),

(104,
'Computer'
,
'2025-01-18 11:00:00'

,2),

(105,
'Nepali'
,
'2025-01-20 08:30:00'
,3); -- Insert into Result
INSERT INTO Result VALUES
(201,101,80),
(202,102,75),
(203,103,90),
(204,104,85),
(205,105,78); -- Display records
SELECT * FROM Exam;
SELECT * FROM Result; -- 1. Simple Join
SELECT *
FROM Exam, Result
WHERE Exam.Examno = Result.Examno; -- 2. Inner Join
SELECT *
FROM Exam
INNER JOIN Result
ON Exam.Examno = Result.Examno; -- 3. Left Outer Join
SELECT *
FROM Exam
LEFT JOIN Result
ON Exam.Examno = Result.Examno; -- 4. Right Outer Join
SELECT *
FROM Exam
RIGHT JOIN Result

ON Exam.Examno = Result.Examno; -- 5. Full Outer Join (MySQL)
SELECT *
FROM Exam
LEFT JOIN Result
ON Exam.Examno = Result.Examno

UNION

SELECT *
FROM Exam
RIGHT JOIN Result
ON Exam.Examno = Result.Examno;