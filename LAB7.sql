CREATE DATABASE lab7;
USE lab7; -- Create Supplier Table
CREATE TABLE Supplier
(
Panno INT PRIMARY KEY,
Name VARCHAR(30),
Address VARCHAR(30)
);-- Create Items Table
CREATE TABLE Items
(
ItemID INT PRIMARY KEY,
Name VARCHAR(30),
Price INT,
Quantity INT,
Type VARCHAR(30)
);-- Create Contact Table
CREATE TABLE Contact
(
Panno INT,

Contact BIGINT,
PRIMARY KEY (Panno, Contact),
FOREIGN KEY (Panno) REFERENCES Supplier(Panno)
);-- Create Supplies Table
CREATE TABLE Supplies
(
Panno INT PRIMARY KEY,
ItemID INT,
SuppliedDate DATETIME,
FOREIGN KEY (Panno) REFERENCES Supplier(Panno),
FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);-- Create Payment Table
CREATE TABLE Payment
(
ItemID INT,
PaymentNo INT,
Amount INT,
Quantity INT,
LoggedDate DATETIME,
PRIMARY KEY (ItemID, PaymentNo),
FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);-- Insert Records into Supplier
INSERT INTO Supplier VALUES
(101,
'Sujata'
,
'Kathmandu'),

(102,
'Ramesh'
,
'Pokhara'),

(103,
'Krishu'
,
'Lalitpur'),

(104,
'Manu'
,
'Bhaktapur'),

(105,
'Hari'
,
'Biratnagar');

-- Insert Records into Contact
INSERT INTO Contact VALUES
(101, 9823400001),
(102, 9811100002),
(103, 9803300003),
(104, 9841200004),
(105, 9856700005); -- Insert Records into Items
INSERT INTO Items VALUES
(201,
'Noodles'

, 20, 30,
'Grocery'),

(202,
'Soap'
, 80, 50,
'Household'),

(203,
'Rice'
, 70, 100,
'Grocery'),

(204,
'Shampoo'

, 350, 25,
'Cosmetics'),

(205,
'Biscuit'

, 30, 60,

'Snacks'); -- Insert Records into Supplies
INSERT INTO Supplies VALUES
(101, 201,

'2025-01-10 10:00:00'),

(102, 202,

'2025-01-15 11:30:00'),

(103, 203,

'2025-02-05 09:45:00'),

(104, 204,

'2025-02-20 14:20:00'),

(105, 205,
'2025-03-01 16:10:00'); -- Insert Records into Payment
INSERT INTO Payment VALUES
(201, 1, 600, 30,

'2025-01-10 12:00:00'),

(202, 2, 4000, 50,

'2025-01-15 13:00:00'),

(203, 3, 7000, 100,

'2025-02-05 10:30:00'),

(204, 4, 8750, 25,

'2025-02-20 15:00:00'),

(205, 5, 1800, 60,
'2025-03-01 17:00:00'); -- Display all records
SELECT * FROM Supplier;
SELECT * FROM Contact;

SELECT * FROM Items;
SELECT * FROM Supplies;
SELECT * FROM Payment;

-- 1. Update the address of the supplier with Panno 103 to 'Bhaktapur'
UPDATE Supplier
SET Address =
'Bhaktapur'

WHERE Panno = 103; -- 2. Retrieve all information about suppliers who supply Biscuit
SELECT S.*
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Items I ON SP.ItemID = I.ItemID
WHERE I.Name =
'Biscuit'; -- 3. Retrieve the names of items and their corresponding payment
amounts for supplier 'Surya'
SELECT I.Name,
P.Amount
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Items I ON SP.ItemID = I.ItemID
JOIN Payment P ON I.ItemID = P.ItemID
WHERE S.Name =

'Ramesh';

-- 4. Retrieve supplier name and contact information for PaymentNo =
103 involving ItemID = 201
SELECT S.Name,
C.Contact
FROM Supplier S
JOIN Contact C ON S.Panno = C.Panno
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Payment P ON SP.ItemID = P.ItemID
WHERE P.PaymentNo = 1
AND P.ItemID = 201; -- 5. Calculate the total quantity of each item type for payments
between 1000 and 1000000
SELECT I.Type,
SUM(P.Quantity) AS TotalQuantity
FROM Items I
JOIN Payment P ON I.ItemID = P.ItemID
WHERE P.Amount BETWEEN 1000 AND 1000000
GROUP BY I.Type; -- 6. Retrieve the payment amounts for supplier 'Hari'
SELECT P.Amount
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Payment P ON SP.ItemID = P.ItemID
WHERE S.Name =
'Hari'; -- 7. Count the number of transactions of each item type for the date
'2025-02-05'
SELECT I.Type,
COUNT(P.PaymentNo) AS NoOfTransaction
FROM Items I
JOIN Payment P ON I.ItemID = P.ItemID
WHERE DATE(P.LoggedDate) =
'2025-02-05'

GROUP BY I.Type;