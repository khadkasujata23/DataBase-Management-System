USE lab9; -- 1. Retrieve all information about results for an exam held on 2025- 01-20 08:30:00, -- where the student scored more than 50 marks. SELECT R.*
FROM Exam E
INNER JOIN Result R
ON E.Examno = R.Examno
WHERE E.Date_Time =

'2025-01-20 08:30:00'

AND R.Marks > 50; -- 2. Retrieve the marks obtained by students in the 'English' exam
SELECT R.Marks
FROM Exam E
INNER JOIN Result R
ON E.Examno = R.Examno

WHERE E.Subject =
'English'

AND E.Date_Time =
'2025-01-10 09:00:00'; -- 3. Retrieve the marks obtained by student with ID 201 in the 'English'
subject
SELECT R.Marks
FROM Exam E
INNER JOIN Result R
ON E.Examno = R.Examno
WHERE R.Sid = 201
AND E.Subject =
'English'; -- 4. Retrieve the dates and times of exams for the 'Computer' subject
SELECT E.Date_Time
FROM Exam E
INNER JOIN Result R
ON E.Examno = R.Examno
WHERE E.Subject =
'Computer'; -- 5. Retrieve the subjects and marks for student with ID 204
SELECT E.Subject,
R.Marks
FROM Exam E
INNER JOIN Result R
ON E.Examno = R.Examno
WHERE R.Sid = 204;