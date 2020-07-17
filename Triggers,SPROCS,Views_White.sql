
---------------------------------------1------------------------------------------------
CREATE VIEW vwRenterEmail AS
SELECT DISTINCT Email	
FROM tblRenter;
GO
--SELECT * FROM vwRenterEmail



---------------------------------------2------------------------------------------------
CREATE PROCEDURE sp_GetProperties

AS --everything after this is run
BEGIN
	SELECT * FROM tblProperty
END

--EXEC sp_GetProperties

--SELECT * FROM tblProperty
---------------------------------------3------------------------------------------------

CREATE PROCEDURE sp_InsertProperty
(
@Street VARCHAR(100),
@City  VARCHAR(50),
@State CHAR(2),
@Zip CHAR(5),
@BedroomCount INT,
@BathroomCount INT,
@Type VARCHAR(30),
@DailyRate MONEY = NULL,
@ContactEmail VARCHAR(50)
)

AS --everything after this is run in SPROC
BEGIN

BEGIN TRY --start of try/catch block
		BEGIN TRANSACTION
		--Insert into Players

		INSERT INTO tblProperty(Street,City,State, Zip, BedroomCount, BathroomCount, 
					Type, DailyRate, ContactEmail)
		Values(@Street, @City ,@State, @Zip, @BedroomCount, @BathroomCount, @Type, 
				@DailyRate, @ContactEmail) 

		COMMIT TRANSACTION

		Print 'Property successfully inserted'
END TRY 

BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(50)
	SET @ErrorMessage = ERROR_MESSAGE() + 'Rolled back transaction for Property insertion' --prints out error
	ROLLBACK TRANSACTION
	RAISERROR (@ErrorMessage, 16, 1)
END CATCH --end of try/catch block
END
GO
/* Test Case
Insert that works and passes values for every parameter:

EXEC sp_InsertProperty '101 Sesame Street','New York', 'NY', '12345', 8, 5, 'House', 
						100, 'owner@gmail.com'


*/

--SELECT * From tblProperty

---------------------------------------4------------------------------------------------
CREATE PROCEDURE sp_UpdateProperty
(
@Street VARCHAR(100),
@City  VARCHAR(50),
@State CHAR(2),
@Zip CHAR(5),
@BedroomCount INT,
@BathroomCount INT,
@Type VARCHAR(30),
@DailyRate MONEY = NULL,
@ContactEmail VARCHAR(50),
@PropertyID INT
)

AS 
BEGIN

	--see if property exists with PropertyID
IF NOT EXISTS (SELECT * FROM tblProperty 
			WHERE PropertyID = @PropertyID)
	BEGIN
		RAISERROR('Property does not exist...', 16,1) --prints out error
		RETURN --exits SPROC
	END

BEGIN TRY --start of try/catch block
		BEGIN TRANSACTION
		--Update Property

		Update tblProperty
		SET Street = @Street, City= @City, State = @State, BedroomCount = @BedroomCount,
			BathroomCount = @BathroomCount, Type = @Type, DailyRate = @DailyRate, ContactEmail = @ContactEmail
		WHERE PropertyID = @PropertyID
		COMMIT TRANSACTION

		Print 'Property successfully updated'
END TRY 

BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(50)
	SET @ErrorMessage = ERROR_MESSAGE() + 'Rolled back transaction for Property update' --prints out error
	ROLLBACK TRANSACTION
	RAISERROR (@ErrorMessage, 16, 1)
END CATCH --end of try/catch block
END
GO

SELECT * FROM tblProperty

/* Test Case

EXEC sp_UpdateProperty '101 LeBron James Ave','Mobile','AL','36604', 2, 1, 'Condo', 75,
					'owner@gmail.com', 1
EXEC sp_GetProperties



EXEC sp_GetRenters

*/

---------------------------------------5------------------------------------------------
CREATE PROCEDURE sp_DeleteProperty
(
@PropertyID INT
)

AS --everything after this is run
BEGIN

	--see if property exists with PropertyID
IF NOT EXISTS (SELECT * FROM tblProperty WHERE PropertyID = @PropertyID)
	BEGIN
		RAISERROR('Property does not exist...', 16,1) --prints out error
		RETURN --exits SPROC
	END
	--see if property has any rentals
	IF EXISTS (SELECT * FROM tblRental WHERE PropertyID = @PropertyID)
	BEGIN
		RAISERROR('Property has existing rentals. Must delete associated rentals first...', 16,1) --prints out error
		RETURN --exits SPROC
	END

BEGIN TRY --start of try/catch block
		BEGIN TRANSACTION
		--Delete from Property

		DELETE FROM tblProperty WHERE PropertyID = @PropertyID

		COMMIT TRANSACTION

		Print 'Property successfully deleted'
END TRY 

BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(50)
	SET @ErrorMessage = ERROR_MESSAGE() + 'Rolled back transaction for Property deletion'
	ROLLBACK TRANSACTION
	RAISERROR (@ErrorMessage, 16, 1)
END CATCH --end of try/catch block
END
GO

--EXEC sp_DeleteProperty 5
--EXEC sp_GetRenters

SELECT * FROM tblProperty
SELECT * FROM tblRental

---------------------------------------6------------------------------------------------
CREATE TABLE tblPropertyAudit
(
PropertyAuditID INT IDENTITY (1,1),
Street VARCHAR(100),
City VARCHAR(50),
State CHAR(2),
Zip CHAR(5),
BedroomCount INT,
BathroomCount INT,
Type VARCHAR(30),
DailyRate MONEY,
ContactEmail VARCHAR(50),
DateCreated DATE,
PropertyID INT
)
GO


---------------------------------------7------------------------------------------------
CREATE TRIGGER tblPropertyDeleteTrigger ON tblProperty
FOR DELETE
AS 
BEGIN
DECLARE 
	@Street VARCHAR(100),
	@City  VARCHAR(50),
	@State CHAR(2),
	@Zip CHAR(5),
	@BedroomCount INT,
	@BathroomCount INT,
	@Type VARCHAR(30),
	@DailyRate MONEY = NULL,
	@ContactEmail VARCHAR(50),
	@PropertyID INT

SELECT	@Street = del.Street FROM DELETED del
SELECT	@City  = del.City FROM DELETED del
SELECT	@State = del.State FROM DELETED del
SELECT	@Zip = del.Zip FROM DELETED del
SELECT	@BedroomCount = del.BedroomCount FROM DELETED del
SELECT	@BathroomCount = del.BathroomCount FROM DELETED del
SELECT	@Type = del.Type FROM DELETED del
SELECT	@DailyRate = del.DailyRate FROM DELETED del
SELECT	@ContactEmail = del.ContactEmail FROM DELETED del
SELECT @PropertyID = del.PropertyID FROM DELETED del

BEGIN TRY
	BEGIN TRANSACTION
		Insert Into tblPropertyAudit (Street, City, State, Zip, BedroomCount, BathroomCount, Type, DailyRate, ContactEmail, PropertyID, DateCreated)
		Values(@Street, @City, @State, @Zip, @BedroomCount, @BathroomCount, @Type, @DailyRate, @ContactEmail, @PropertyID, GETDATE())
	COMMIT TRANSACTION

		Print 'PropertysAudit Delete successfully inserted'
END TRY 

BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(50)
	SET @ErrorMessage = ERROR_MESSAGE() + 'Rolled back transaction for Property Delete Trigger' --prints out error
	ROLLBACK TRANSACTION
	RAISERROR (@ErrorMessage, 16, 1)
END CATCH --end of try/catch block
END
GO

/*
EXEC sp_DeleteProperty 6

SELECT * FROM tblProperty
SELECT * FROM tblPropertyAudit
*/

SELECT * From tblProperty