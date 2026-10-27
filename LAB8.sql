USE lab6; -- 1. Create a view to retrieve supplier names and corresponding item
names
CREATE VIEW Info AS
SELECT S.Name AS Supplier_Name,
I.Name AS Item_Name
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Items I ON SP.ItemID = I.ItemID
JOIN Payment P ON I.ItemID = P.ItemID; -- 2. Create a view to show the relationship between item names and
their corresponding payment amounts
CREATE VIEW Relation AS
SELECT I.Name AS Item_Name,
P.Amount AS Payment
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Items I ON SP.ItemID = I.ItemID
JOIN Payment P ON I.ItemID = P.ItemID; -- 3. Create a view to calculate the total payment amount for each
supplier
CREATE VIEW Supplier_Info AS
SELECT S.Name AS Supplier_Name,
SUM(P.Amount) AS Total_Payment
FROM Supplier S
JOIN Supplies SP ON S.Panno = SP.Panno
JOIN Items I ON SP.ItemID = I.ItemID
JOIN Payment P ON I.ItemID = P.ItemID

GROUP BY S.Name; -- Display the views
SELECT * FROM Info;
SELECT * FROM Relation;
SELECT * FROM Supplier_Info;