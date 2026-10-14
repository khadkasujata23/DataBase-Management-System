CREATE DATABASE lab6;
USE lab6; -- Create Supplier Table
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
);

-- Create Contact Table
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

'Biratnagar'); -- Insert Records into Contact
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

'2025-03-01 17:00:00');

-- Display all records
SELECT * FROM Supplier;
SELECT * FROM Contact;
SELECT * FROM Items;
SELECT * FROM Supplies;
SELECT * FROM Payment;