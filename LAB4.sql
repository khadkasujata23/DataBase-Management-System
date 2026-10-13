CREATE DATABASE Lab3;
USE Lab3;

CREATE TABLE Customer(
C_ID INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Customer_Address VARCHAR(100),
Customer_Type VARCHAR(20)
);

CREATE TABLE Loan(
L_ID INT PRIMARY KEY,
Amount BIGINT,
Interest_Rate INT,
Yr INT
);

CREATE TABLE Borrow(
C_ID INT,
L_ID INT,
BorrowedDate DATE,
PRIMARY KEY (C_ID, L_ID),
FOREIGN KEY (C_ID) REFERENCES Customer(C_ID),
FOREIGN KEY (L_ID) REFERENCES Loan(L_ID)
);

INSERT INTO Customer VALUES

(1,
'sujata khadka'

,
'Kathmandu'
,
'Regular'),

(2,
'krishu dahal'

,
'Pokhara'
,
'Premium'),

(3,
'anshu baral'

,
'Lalitpur'
,
'Regular'),

(4,
'aamyush kc'

,
'Bhaktapur'
,
'VIP'),

(5,
'ramesh pandey'

,
'Gorkha'
,
'Premium');

INSERT INTO Loan VALUES
(101,50000,8,5),
(102,100000,9,10),
(103,75000,7,7),
(104,200000,10,15),
(105,500000,10,12);

INSERT INTO Borrow VALUES
(1,101,

'2016-07-09'),

(2,102,

'2024-02-15'),

(3,103,

'2026-03-20'),

(4,104,

'2026-04-25'),

(5,105,

'2026-01-12');

SELECT * FROM Customer;
SELECT * FROM Loan;
SELECT * FROM Borrow;
DRop table Customer;
drop table loan;
drop table borrow;

ALTER TABLE loan ADD Branch VARCHAR(30);
UPDATE loan SET Branch=

'kamalpokhari' WHERE l_id=101;

UPDATE loan SET Branch=

'hattisar' WHERE l_id=102;

UPDATE loan SET Branch=

'damak' WHERE l_id=103;

UPDATE loan SET Branch=

'pokhara' WHERE l_id=104;

UPDATE loan SET Branch=

'dharan' WHERE l_id=105;

SELECT BRANCH FROM loan;

SELECT * FROM loan l,customer c,borrow b WHERE c.c_id=b.c_id AND
l.l_id=b.l_id AND branch=

'hattisar';

SELECT * FROM loan l,customer c,borrow b WHERE c.c_id=b.c_id AND
l.l_id=b.l_id AND interest_rate>2;
SELECT * FROM loan l,customer c,borrow b WHERE c.c_id=b.c_id AND
l.l_id=b.l_id AND BorrowedDate=

'2016-07-09' AND yr=5;

SELECT * FROM loan l,customer c,borrow b WHERE c.c_id=b.c_id AND
l.l_id=b.l_id AND BorrowedDate=
'2016-07-09';

SELECT * FROM loan l,customer c,borrow b WHERE c.c_id=b.c_id AND
l.l_id=b.l_id AND c.c_id=3;