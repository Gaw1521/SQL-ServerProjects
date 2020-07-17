--SQL EXAM 

SELECT *
FROM tblBuyer

--1
SELECT COUNT(DISTINCT City) As 'City Count'
FROM tblBuyer
WHERE City IS NOT NULL;

--2
SELECT FirstName, LastName
FROM tblSalesperson
WHERE Email LIKE '%gmail%';

--3
SELECT AVG(PurchasePrice) As 'Average Purchase Price', MAX(PurchasePrice) As 'Highest Purchase Price',
		MIN(PurchasePrice) As 'Lowest Purchase Price'
FROM tblVehicle
WHERE Mileage BETWEEN 20000 AND 30000;

--4
SELECT ManufacturerName, ModelName, Capacity
FROM tblManufacturer INNER JOIN tblModel ON tblManufacturer.ManufacturerID = tblModel.ManufacturerID
WHERE TYPE = 'SUV' AND Capacity > 5
ORDER BY ManufacturerName ASC, ModelName DESC;


--5
SELECT DISTINCT FirstName + ' ' + LastName As 'Name', SUM(SalePrice) As 'TotalSpent'
FROM tblBuyer INNER JOIN tblSale ON tblBuyer.BuyerID = tblSale.BuyerID
WHERE City = 'Jackson' AND State = 'AL'
GROUP BY FirstName, LastName;


--6
SELECT tblModel.ModelName, tblVehicle.Year, COUNT(tblVehicle.VehicleID) As 'VehicleCount'
FROM tblModel INNER JOIN tblVehicle ON tblModel.ModelID = tblVehicle.ModelID
GROUP BY tblModel.ModelName, tblVehicle.Year
HAVING COUNT(VehicleID) > 1;


--7
SELECT tblVehicle.VehicleID, PurchaseDate, SaleDate, DateDiff(DAY, PurchaseDate, SaleDate) As 'Days at Dealership'
FROM tblVehicle INNER JOIN tblSale ON tblVehicle.VehicleID = tblSale.VehicleID
WHERE DateDiff(DAY, PurchaseDate, SaleDate) <= 10
ORDER BY SaleDate DESC;



--8
SELECT tblManufacturer.ManufacturerName, tblModel.ModelName, tblVehicle.Color, tblVehicle.Year
FROM tblManufacturer INNER JOIN tblModel ON tblManufacturer.ManufacturerID = tblModel.ManufacturerID
	INNER JOIN tblVehicle ON tblVehicle.ModelID = tblModel.ModelID
WHERE Color = 'Red' OR Color = 'White' OR Color = 'Blue'
GROUP BY tblManufacturer.ManufacturerName, tblModel.ModelName, tblVehicle.Color, tblVehicle.Year
HAVING ManufacturerName IN('Chevrolet','GMC','Jeep','Ford')
ORDER BY Year DESC;


--9
SELECT FirstName, LastName, ModelName, Type As 'Model Type'
FROM tblBuyer INNER JOIN tblSale ON tblBuyer.BuyerID = tblSale.BuyerID INNER JOIN tblVehicle ON tblVehicle.VehicleID = tblSale.VehicleID 
	INNER JOIN tblModel ON tblModel.ModelID = tblVehicle.ModelID INNER JOIN tblManufacturer ON tblManufacturer.ManufacturerID = tblModel.ManufacturerID
WHERE ManufacturerName = 'Chevrolet'
ORDER BY ModelName DESC;

--10
SELECT FirstName, LastName, PhoneNumber
FROM tblBuyer
WHERE MONTH(Birthday) < 4 AND DateDiff(Year, Birthday, GetDate()) < 30;



--BONUS
SELECT COUNT(BuyerID) As 'Buyer Count'
FROM tblBuyer
WHERE MONTH(Birthday) >= 4 AND DAY(Birthday) > 16

