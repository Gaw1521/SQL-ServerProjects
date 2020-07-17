


--1
SELECT SaleID, SalePrice, SaleDate
FROM tblSale; 

--2
SELECT LastName, HireDate
FROM tblSalesperson;

--3
SELECT FirstName As 'First', LastName 'Last', Email
FROM tblSalesperson;

--4
SELECT LastName 'Last Name', FirstName 'First Name'
FROM tblSalesperson
ORDER BY LastName DESC;

--5
SELECT DISTINCT Type
FROM tblcar;

--6
SELECT DISTINCT Year
FROM tblCar
ORDER BY year DESC;

--7
SELECT VIN, BuyerID 'Buyer', SalespersonID 'Seller', SaleDate, SalePrice
FROM tblSale
ORDER BY SalespersonID ASC, SaleDate ASC;

--8
SELECT Salary, LastName, FirstName, Email
FROM tblSalesperson
ORDER BY Salary DESC, LastName ASC;

--9
SELECT FirstName 'First', LastName 'Last'
FROM tblBuyer
WHERE LastName = 'Jones';

--10
SELECT SaleID, SaleDate, SalePrice, VIN, BuyerID, SalesPersonID 
FROM tblSale
WHERE SalePrice > 15000;

--11
SELECT Type, Make, Capacity, Color, VIN
FROM tblCar
Where Model = 'Ford'
ORDER BY Make ASC;

--12
SELECT VIN, Model, Make, Year, Mileage, Color, Type
FROM tblCar
WHERE Type = 'Car'
ORDER BY Year DESC, Mileage ASC;

--13
SELECT Model, Make, Year, Mileage, Color, Type 
From tblCar 
WHERE Type = 'Car'and Year > 2015
ORDER BY Mileage ASC;

--14
SELECT FirstName, LastName, PhoneNumber, Address, City, State, Zip
FROM tblBuyer 
Where City = 'Jackson' and State = 'AL'
ORDER BY FirstName ASC;

--15
SELECT VIN, Make, Model
FROM tblCar
Where Color = 'Green' or Color = 'Blue'
ORDER BY Model ASC;

--16
SELECT *
FROM tblCar 
WHERE Year BETWEEN '2010' and '2015'
ORDER BY Year DESC;

--17
SELECT DISTINCT Make, Model
FROM tblCar
WHERE Type = 'SUV';

--18
SELECT SaleID, SaleDate, SalePrice, SalespersonID
FROM tblSale 
WHERE SalespersonID IN(1,4)
ORDER BY SaleDate DESC;

--19
SELECT *
FROM tblBuyer
WHERE Birthday IS NULL;

--20
SELECT FirstName, LastName, Address, City, State, Zip
FROM tblBuyer
WHERE City IN ('Mobile', 'Daphne')
OrDER BY FirstName ASC, LastName ASC;

--21
SELECT Model, Make, VIN
FROM tblCar
WHERE Model NOT IN ('Chevrolet', 'GMC', 'Toyota')
ORDER BY Make ASC;

--22
SELECT FirstName, LastName, ISNULL(State,'NA') AS State
FROM tblBuyer;

--23
SELECT FirstName, LastName, ISNULL(Address, 'None') AS Address
FROM tblBuyer
WHERE Address IS NULL
ORDER BY FirstName DESC;

--24
SELECT DISTINCT LastName 'Last Name'
FROM tblBuyer
WHERE State IN ('AL')
ORDER BY LastName ASC;

--25
SELECT Model, Make, Color, Mileage, Year, ListingPrice, Type
FROM tblCar
WHERE ListingPrice < 15000 and Model NOT IN ('Toyota', 'GMC')
ORDER BY ListingPrice ASC;