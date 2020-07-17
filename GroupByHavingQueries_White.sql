
USE CarSales
GO

UPDATE tblCar
SET MAKE = '4-Runner'
WHERE VIN = '33RDA'
GO

--1
SELECT COUNT(SalespersonID) As 'Employee Count', Salary
FROM tblSalesperson
GROUP BY Salary;

--2
SELECT SalespersonID, COUNT(SaleID) As 'Sales'
FROM tblSale
GROUP BY SalespersonID
ORDER BY SalespersonID DESC;

--3
SELECT Type, MAX([ListingPrice]) As 'MaxPrice', MIN([ListingPrice]) As 'MinPrice', AVG([ListingPrice]) As 'AvgPrice'
FROM tblCar
GROUP BY Type;

--4
SELECT Model, Make, MIN(Mileage) As 'Lowest Mileage'
FROM tblCar
WHERE [Year] > 2015 AND Type = 'SUV'
GROUP BY Model, Make;

--5
SELECT Year(SaleDate) As 'Year', SUM([SalePrice]) As 'Total'
FROM tblSale
GROUP BY Year(SaleDate);

--6
SELECT DISTINCT COUNT(BuyerID) As 'BuyerCnt', [State]
FROM tblBuyer
WHERE State IS NOT NULL
GROUP BY [State];

--7
SELECT COUNT(BuyerID) As 'BuyerCnt', ISNULL([State], 'NA') AS [State]
FROM tblBuyer
GROUP BY [State]
ORDER BY [State];

--8
SELECT Count(BuyerID) As 'BuyerCnt', State
FROM tblBuyer
WHERE State IS NOT NULL AND FirstName  Like 'A%'
GROUP BY State 
ORDER BY State DESC;


--9
SELECT Count(BuyerID) As 'BuyerCnt', City, State
FROM tblBuyer
WHERE State IS NOT NULL
GROUP BY City, State 
ORDER BY Count(BuyerID);

--10
SELECT Capacity, MIN(PurchaseDate) As 'First Purchase Date', MAX(PurchaseDate) As 'Last Purchase Date'
FROM tblCar
WHERE ListingPrice < 20000
Group By Capacity;

--11
SELECT MAX(ListingPrice - PurchasePrice) As 'MaxProfit', MIN(ListingPrice - PurchasePrice) As 'MinProfit', Model
FROM tblCar
GROUP BY Model
ORDER BY 'MaxProfit' DESC;

--12
SELECT Count(SalespersonID) As 'Employee Count', Salary
FROM tblSalesperson
GROUP BY Salary
HAVING Count(SalespersonID) > 1;

--13
SELECT Color, MAX(ListingPrice) As 'MaxPrice', MIN(ListingPrice) As 'MinPrice', Avg(ListingPrice) As 'AvgPrice'
FROM tblCar
GROUP BY Color
HAVING MAX(ListingPrice) > 30000;

--14
SELECT COUNT(SaleID) As 'Purchase Count', BuyerID
FROM tblSale
GROUP BY BuyerID
HAVING COUNT(SaleID) > 1;

--15
SELECT SalespersonID, COUNT(SaleID) As 'Sales Number'
FROM tblSale
GROUP BY SalespersonID
HAVING COUNT(SaleID) = 1
ORDER BY SalespersonID DESC;

--16
SELECT Color, SUM(ListingPrice) As 'Total Listed'
FROM tblCar
WHERE Year > 2009
GROUP BY Color
HAVING SUM(ListingPrice) > 50000;

--17
SELECT COUNT(BuyerID) As 'BuyerCount', Zip
FROM tblBuyer
GROUP BY Zip
HAVING Zip Like '366%' AND COUNT(BuyerID) = 1;

--18
SELECT COUNT(BuyerID) As 'BuyerCount', LastName
FROM tblBuyer
WHERE State = 'AL'
GROUP BY LastName
HAVING COUNT(BuyerID) > 1;

--19
SELECT MAX(ListingPrice- PurchasePrice) As 'MaxProfit', MIN(ListingPrice- PurchasePrice) As 'MinProfit', Model
FROM tblCar
GROUP BY model
HAVING MAX(ListingPrice- PurchasePrice) <> MIN(ListingPrice- PurchasePrice)
ORDER BY 'MaxProfit' DESC;

--20
SELECT COUNT(BuyerID) As 'Buyer Count', MONTH(Birthday) As 'Birthday Month'
FROM tblBuyer
WHERE State = 'AL' 
GROUP BY MONTH(Birthday)
HAVING MONTH(Birthday) Like MONTH(Birthday) AND COUNT(BuyerID) > 1
ORDER BY MONTH(Birthday) DESC;