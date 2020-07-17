USE CarSales
GO 
 
UPDATE tblSale 
SET VIN = 'LL9HR' 
WHERE SaleID = 2 

--1
SELECT SaleID, SaleDate, SalePrice, VIN, FirstName, LastName
FROM tblSale, tblBuyer
WHERE tblBuyer.BuyerID = tblSale.BuyerID;

--2
SELECT SaleDate, SalePrice, VIN, Email
FROM tblSale, tblSalesperson
WHERE tblSale.SalespersonID = tblSalesperson.SalespersonID AND SalePrice > 10000;


--3
SELECT Make, Model, [Year], Color, Mileage, ListingPrice, SalePrice
FROM tblCar, tblSale
WHERE tblCar.VIN = tblSale.VIN AND ListingPrice = SalePrice;


--4
SELECT FirstName + ' ' + LastName As 'Buyer Name', SaleDate, SalePrice, tblCar.VIN, Make, Model, [Year], Color
FROM tblBuyer INNER JOIN tblSale ON tblBuyer.BuyerID = tblSale.BuyerID INNER JOIN tblCar ON tblSale.VIN = tblCar.VIN
ORDER BY SaleDate ASC;

--5
SELECT FirstName, LastName, COUNT(SaleID) As 'SaleCount'
FROM tblSale INNER JOIN tblSalesperson  ON tblSale.SalespersonID = tblSalesperson.SalespersonID
GROUP BY FirstName, LastName
ORDER BY FirstName DESC;

--6
SELECT SUM(SalePrice) As 'Total Sale Amount', FirstName As 'First Name', LastName As 'Last Name'
FROM tblSale INNER JOIN tblSalesperson  ON tblSale.SalespersonID = tblSalesperson.SalespersonID
WHERE Year(HireDate) > 2015
GROUP BY FirstName, LastName
ORDER BY 'Total Sale Amount' DESC;

--7
SELECT COUNT(SaleID) As 'Number Sold', Model
FROM tblsale INNER JOIN tblCar ON tblSale.VIN = tblCar.VIN
GROUP BY Model
HAVING COUNT(SaleID) > 1;

--8
SELECT COUNT(SaleID) As 'Number Sold'
FROM tblsale INNER JOIN tblCar ON tblSale.VIN = tblCar.VIN
WHERE Color = 'White' OR Color = 'Black';

--9
SELECT FirstName, LastName, [Type], Model, Make, Color
FROM tblBuyer INNER JOIN tblSale ON tblBuyer.BuyerID = tblSale.BuyerID INNER JOIN tblCar ON tblSale.VIN = tblCar.VIN
WHERE FirstName LIKE '%A%'
ORDER BY FirstName ASC;

--10
SELECT tblBuyer.FirstName, tblBuyer.LastName, [Type], Model, Make, Color, tblSalesperson.FirstName, tblSalesperson.LastName
FROM tblBuyer INNER JOIN tblSale ON tblBuyer.BuyerID = tblSale.BuyerID INNER JOIN tblCar ON tblSale.VIN = tblCar.VIN INNER JOIN tblSalesperson on tblSale.SalespersonID = tblSalesperson.SalespersonID
WHERE City = 'Mobile' AND MONTH(SaleDate) = '03'
ORDER BY tblBuyer.FirstName ASC;





