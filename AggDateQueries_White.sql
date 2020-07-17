

--1
SELECT COUNT(*) AS 'Number of Sales'
FROM tblSale;

--2
SELECT COUNT(*) AS 'Number of Employees', SUM (Salary) AS 'Yearly Payroll'
FROM tblSalesperson;

--3
SELECT MAX([ListingPrice]) As 'High List Price', MIN([ListingPrice]) As 'Low List Price'
FROM tblCar;

--4
SELECT Count(Capacity) As 'Car Count', MIN([PurchasePrice]) as 'Lowest Price', MAX([PurchasePrice]) as 'Highest Price'
FROM tblCar
WHERE Model = 'Toyota';

--5
SELECT AVG([Mileage]) As 'AvgTruckMiles'
FROM tblCar
WHERE Type = 'Truck' AND Year > 2013;

--6
SELECT COUNT(BuyerID) AS 'BuyerCount'
FROM tblBuyer
WHERE Zip IS NULL;

--7
SELECT COUNT(BuyerID) AS 'BuyerCount'
FROM tblBuyer
WHERE Zip IS NOT NULL;

--8
SELECT COUNT(DISTINCT Model) AS 'Unique Model Count'
FROM tblCar;

--9
SELECT SUM([Salary]) as 'Yearly Payroll', (SUM([Salary]) / 12) As 'Monthly Payroll'
FROM tblSalesperson;

--10
SELECT AVG([ListingPrice] - [PurchasePrice]) As 'Avg Profit'
FROM tblCar;

--11
SELECT BuyerID, FirstName, LastName, Year(Birthday) As 'Birth Year'
FROM tblBuyer
WHERE city = 'Mobile';

--12
SELECT SaleID, VIN, SalespersonID, BuyerID, Year(SaleDate) as 'Year Sold'
FROM tblSale
WHERE DatePart(Year,SaleDate) > 2000
ORDER BY SaleDate DESC;

--13
SELECT FirstName, LastName, DateDiff(Year,HireDate, GetDate()) As 'Years Working'
FROM tblSalesperson
ORDER BY FirstName ASC;

--14
SELECT BuyerID, FirstName, LastName, Birthday
FROM tblBuyer  
WHERE Month(Birthday) < 4
ORDER BY Birthday DESC;

--15
SELECT COUNT(Birthday) As ' Birthdays Before April Count'
FROM tblBuyer
WHERE Month(Birthday) < 4;

--16
SELECT SaleID, SaleDate, SalePrice, VIN, BuyerID, SalespersonID
FROM tblSale
WHERE Month(SaleDate) = 3;

--17
SELECT SaleID, SalePrice, VIN, BuyerID, SalespersonID, SaleDate, DateAdd(Day,30,SaleDate) As 'Payment Due Date'
FROM tblSale	
WHERE Month(SaleDate) = 3;

--18
SELECT FirstName, LastName, DateDiff(Year,HireDate, GetDate()) As'Years Working'
FROM tblSalesperson
WHERE DateDiff(Year, HireDate, GetDate()) > 4
ORDER BY DateDiff(Year,HireDate, GetDate()) DESC, FirstName ASC;

SELECT FirstName, LastName, DateDiff(Year,HireDate, GetDate()) As'Years Working'
FROM tblSalesperson
WHERE DateDiff(Year, HireDate, GetDate()) > 4
ORDER BY 'Years Working' DESC, FirstName ASC;

--19
SELECT VIN, Make + ' ' + Model As 'Vehicle', Mileage, PurchaseDate
 FROM tblCar
 WHERE PurchaseDate >= DateAdd(Month, -1, GetDate());

--20
SELECT AVG(DateDiff(Year, Birthday, GetDate())) As 'AvgAge'
FROM tblBuyer;
