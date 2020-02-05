
USE Northwind;
/* Assignment1 WHERE */
/* Q1 */
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE 'Santa%' OR TerritoryDescription LIKE '%Santa' OR TerritoryDescription LIKE '%Santa%';
/* Q2 */
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE 'C%';
/* Q3 */
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE 'boro%' OR TerritoryDescription LIKE '%boro' OR TerritoryDescription LIKE '%boro%';
/* Q4 */
SELECT ContactName, ContactTitle FROM Customers WHERE ContactTitle LIKE 'Owner%' OR ContactTitle LIKE '%Owner%' OR ContactTitle LIKE '%Owner';
/* Q5 */
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NOT NULL;
/* Q6 */
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NULL;
/* Q7 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice >= 50.00;
/* Q8 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice <10.00;
/* Q9 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice <=10.00;
/* Q10 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 15 AND 20;
/* Q11 */
SELECT ProductName, UnitsOnOrder FROM Products WHERE UnitsOnOrder>0;
/* Q12 */
SELECT FirstName, LastName, DATEDIFF(YY, BirthDate, GETDATE()) AS Age FROM Employees;
/* Q13 */
SELECT FirstName, LastName, DATEDIFF(YY, HireDate, GETDATE()) AS Age FROM Employees;
/* Q14 */
SELECT SUM(A.Adds )  AS FreightTotal FROM (SELECT SUM(Freight) AS Adds FROM Orders GROUP BY EmployeeID) AS A;
/* Q15 */
SELECT SUM(A.Adds )  AS FreightTotal FROM (SELECT SUM(Freight) AS Adds FROM Orders WHERE OrderDate >= '1996' AND OrderDate <'1997' GROUP BY EmployeeID) AS A;
/* Q16 */
SELECT SUM(A.Adds )  AS FreightTotal FROM (SELECT SUM(Freight) AS Adds FROM Orders WHERE OrderDate >= '1997-01-01' AND OrderDate <'1998-01-01' GROUP BY EmployeeID) AS A;
/* Q17 */
SELECT SUM(A.Adds )  AS FreightTotal FROM (SELECT SUM(Freight) AS Adds FROM Orders WHERE OrderDate between'1998-01-01' AND '1998-12-31' GROUP BY EmployeeID) AS A;
/* Q18 */
SELECT OrderID, ShipCountry FROM Orders WHERE ShipCountry IN ('Switzerland', 'Venezuela', 'Austria');
/* Q19 */
SELECT DISTINCT ShipCity FROM Orders WHERE ShippedDate <= GETDATE() AND ShipCountry IN('Belgium', 'Mexico','Sweden');
/* Q20 */
SELECT CategoryName, ProductName FROM Categories INNER JOIN Products on Products.CategoryID = Categories.CategoryID WHERE Categories.CategoryName IN( 'Dairy Products', 'Seafood', 'Beverages') ORDER BY CategoryName;




/* Assignment1 GROUP BY */
/* Q1 */
SELECT CustomerID, ContactName, phone, ContactTitle, Country FROM Customers WHERE Country IN('USA','UK');
/* Q2 */
SELECT CustomerID, ContactName, ContactTitle, Country, Region FROM Customers WHERE Country = 'USA' OR (Country = 'Brazil' AND Region ='SP')
/* Q3 */
SELECT OrderID, CustomerID  FROM Orders WHERE OrderDate >= '1997-07-01' AND OrderDate <= '1997-09-30';
/* Q4 */
SELECT ContactName FROM Customers WHERE CompanyName LIKE '[A,B,C,D,E,F,G]%' AND CompanyName Like '%[N,E]'; 
/* Q5 */
SELECT ContactName, CompanyName FROM Customers WHERE CompanyName NOT LIKE '_[A,E,I,O,U]%'
/* Q6 */
/*---------------------missing--------------------*/
/* Q7 */
SELECT * FROM Customers WHERE Address LIKE '[0-9]%' OR Address LIKE'%[0-9]';
/* Q8 */
	/* 8-1 */ SELECT  Country, Count(CustomerID) AS NUMBER FROM Customers GROUP BY Country;
	/* 8-2 */ SELECT  Country, Region, Count(CustomerID) AS NUMBER FROM Customers GROUP BY Country, Region;
	/* 8-3 */ SELECT  Country, Region, City, Count(CustomerID) AS NUMBER FROM Customers GROUP BY Country, Region, City;
/* Q9 */
SELECT  ContactTitle ,Count(ContactTitle) AS Number FROM Customers GROUP BY ContactTitle ORDER BY Number DESC;
/* Q10 */
SELECT CustomerID, Count(OrderID) AS Number FROM Orders GROUP BY CustomerID;
/* Q11 */
SELECT CustomerID, Count(OrderID) AS Number FROM Orders GROUP BY CustomerID ORDER BY Number DESC OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
/* Q12 */
SELECT * FROM (SELECT CustomerID, Count(OrderID) AS Number FROM Orders GROUP BY CustomerID) AAA WHERE AAA.Number > 5;
/* Q13 */
/* 13-1 */SELECT Years, COUNT(Years) AS Numbers FROM (SELECT CustomerID, YEAR(ShippedDate) as Years FROM Orders WHERE ShippedDate IS NOT NULL) AS AAA GROUP BY Years;
/* 13-2 */SELECT  DATEPART(YY,ShippedDate) AS YEAR, DATEPART(qq,ShippedDate) AS QUATER , COUNT(DATEPART(qq,ShippedDate)) AS Number FROM Orders WHERE ShippedDate IS NOT NULL  GROUP BY  DATEPART(YY,ShippedDate), DATEPART(qq,ShippedDate) 
/* 13-3 */SELECT  DATEPART(YY,ShippedDate) AS YEAR, DATEPART(mm,ShippedDate) AS Months, COUNT(DATEPART(mm,ShippedDate)) AS Number FROM Orders WHERE ShippedDate IS NOT NULL  GROUP BY  DATEPART(YY,ShippedDate), DATEPART(mm,ShippedDate)

/* Q14 */
/* 14-1 */SELECT OrderID, AVG(Freight)AS AvgNum, SUM(Freight)AS SumNum, MAX(Freight)AS MaxNum, MIN(Freight)AS MinNum FROM Orders GROUP BY OrderID;
/* 14-2 */SELECT CustomerID,  AVG(Freight)AS AvgNum, SUM(Freight)AS SumNum, MAX(Freight)AS MaxNum, MIN(Freight)AS MinNum FROM Orders GROUP BY CustomerID;
/* 14-3 */SELECT ShipCountry,  AVG(Freight)AS AvgNum, SUM(Freight)AS SumNum, MAX(Freight)AS MaxNum, MIN(Freight)AS MinNum FROM Orders GROUP BY ShipCountry;
/* 14-4 */SELECT ShipVia,  AVG(Freight)AS AvgNum, SUM(Freight)AS SumNum, MAX(Freight)AS MaxNum, MIN(Freight)AS MinNum FROM Orders GROUP BY ShipVia;
/* Q15 */
SELECT OrderID, ProductID , SUM(UnitPrice*Quantity-UnitPrice*Discount) AS Sum FROM [Order Details] GROUP BY OrderID, ProductID;
/* Q16 */
/* 16-1 */SELECT OrderID, COUNT(ProductID)AS ProductCount FROM [Order Details] GROUP BY OrderID;
/* 16-2 */SELECT OrderID, SUM(UnitPrice*Quantity-UnitPrice*Discount) AS TotalSale FROM [Order Details] GROUP BY OrderID;
/* Q17 */
SELECT OrderID,ProductID, SUM(ProductID)AS TotalQuantity FROM [Order Details] GROUP BY OrderID, ProductID;
/* Q18 */
SELECT ProductID, SUM(Quantity) AS SumQuantity FROM [Order Details] GROUP BY ProductID ORDER BY SumQuantity DESC OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
/* Q19 */
SELECT Customers.ContactName,AAA.OrderCount FROM Customers, (SELECT CustomerID, Count(CustomerID) AS OrderCount FROM Orders WHERE ShipCountry='Brazil' AND ShipRegion ='SP' AND (OrderDate Between '1997-01-01' AND '1997-12-31') GROUP BY CustomerID)AS AAA WHERE Customers.CustomerID = AAA.CustomerID ORDER BY ContactName;
/* Q20 */
SELECT * FROM (SELECT Customers.ContactName,AAA.OrderCount FROM Customers, (SELECT CustomerID, Count(CustomerID) AS OrderCount FROM Orders WHERE ShipCountry='Brazil' AND ShipRegion ='SP' AND (OrderDate Between '1998-01-01' AND '1998-12-31') GROUP BY CustomerID)AS AAA WHERE Customers.CustomerID = AAA.CustomerID ) AS BBB WHERE BBB.OrderCount>7;

