CREATE TABLE Teacher (
tid INT PRIMARY KEY,
tname VARCHAR(50),
qualification VARCHAR(50)
);

CREATE TABLE Course (
cid INT PRIMARY KEY,
cname VARCHAR(50),
ccode VARCHAR(20)
);

CREATE TABLE Teaches (
tid INT,
cid INT,
PRIMARY KEY (tid, cid),
FOREIGN KEY (tid) REFERENCES Teacher(tid),
FOREIGN KEY (cid) REFERENCES Course(cid)
);
INSERT INTO Teacher VALUES
(1,
'Ram'
,
'MSc'),

(2,
'Sita'
,
'MEd'),

(3,
'Hari'
,
'PhD'),

(4,
'Gita'
,
'BEd'),

(5,
'Shyam'
,
'PhD');

INSERT INTO Course VALUES
(101,
'Database'
,
'CS201'),

(102,
'Programming'
,
'CS202'),

(103,
'Networking'
,
'CS203'),

(104,
'Operating System'

,
'CS204'),

(105,
'Data Structure'

,
'CS205');

INSERT INTO Teaches VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);
SELECT tname FROM Teacher WHERE qualification=
"PhD";

SELECT DISTINCT cname FROM course JOIN TEACHES JOIN TEACHER
WHERE tname=

"Ram";

SELECT DISTINCT cname FROM course JOIN TEACHES JOIN TEACHER
WHERE tname=

"Ram";

SELECT c.cname FROM Teacher t, Teaches ts, Course c WHERE t.tid =
ts.tid AND ts.cid = c.cid AND t.tname =

'Ram';

SELECT COUNT(*) AS TotalCourses FROM Teacher t JOIN Teaches ts ON
t.tid = ts.tid WHERE t.tname =

'Ram';

DROP TABLE course;
DROP TABLE teaches;
DROP TABLE teacher;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Teaches;