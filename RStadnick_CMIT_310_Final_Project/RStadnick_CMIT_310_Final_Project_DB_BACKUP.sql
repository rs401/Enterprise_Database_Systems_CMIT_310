USE [master]
GO
/****** Object:  Database [ChamplainCharityLLC]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE DATABASE [ChamplainCharityLLC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChamplainCharityLLC', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ChamplainCharityLLC.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChamplainCharityLLC_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ChamplainCharityLLC_log.ldf' , SIZE = 3200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChamplainCharityLLC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChamplainCharityLLC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChamplainCharityLLC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET RECOVERY FULL 
GO
ALTER DATABASE [ChamplainCharityLLC] SET  MULTI_USER 
GO
ALTER DATABASE [ChamplainCharityLLC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChamplainCharityLLC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChamplainCharityLLC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ChamplainCharityLLC]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Foodshelf]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Foodshelf]
GO
/****** Object:  Schema [Inventory]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Inventory]
GO
/****** Object:  Schema [Maintenance]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Maintenance]
GO
/****** Object:  Schema [Message]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Message]
GO
/****** Object:  Schema [Person]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Signature]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Signature]
GO
/****** Object:  Schema [SSN]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [SSN]
GO
/****** Object:  Schema [Volunteer]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE SCHEMA [Volunteer]
GO
/****** Object:  Rule [dbo].[NoYesMaybe]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE RULE [dbo].[NoYesMaybe] 
AS
@choice IN (0, 1, 2);

GO
/****** Object:  Rule [dbo].[YesNo]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE RULE [dbo].[YesNo] 
AS
@list in (0,1)

GO
/****** Object:  Rule [dbo].[YesNoMaybe]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE RULE [dbo].[YesNoMaybe] 
AS
@list in (0,1,2)

GO
/****** Object:  Rule [Foodshelf].[GroceriesOrBreadProduce]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE RULE [Foodshelf].[GroceriesOrBreadProduce] 
AS
@list in (0,1)

GO
/****** Object:  XmlSchemaCollection [Person].[AdditionalContactInfoSchemaCollection]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE XML SCHEMA COLLECTION [Person].[AdditionalContactInfoSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"><xsd:element name="AdditionalContactInfo"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord"><xsd:element name="ContactRecord"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" /></xsd:choice><xsd:attribute name="date" type="xsd:date" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" elementFormDefault="qualified"><xsd:element name="eMail" type="t:eMailType" /><xsd:element name="facsimileTelephoneNumber" type="t:phoneNumberType" /><xsd:element name="homePostalAddress" type="t:addressType" /><xsd:element name="internationaliSDNNumber" type="t:phoneNumberType" /><xsd:element name="mobile" type="t:phoneNumberType" /><xsd:element name="pager" type="t:phoneNumberType" /><xsd:element name="physicalDeliveryOfficeName" type="t:addressType" /><xsd:element name="registeredAddress" type="t:addressType" /><xsd:element name="telephoneNumber" type="t:phoneNumberType" /><xsd:element name="telexNumber" type="t:phoneNumberType" /><xsd:complexType name="addressType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Street" type="xsd:string" maxOccurs="2" /><xsd:element name="City" type="xsd:string" /><xsd:element name="StateProvince" type="xsd:string" /><xsd:element name="PostalCode" type="xsd:string" minOccurs="0" /><xsd:element name="CountryRegion" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="eMailType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="eMailAddress" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="phoneNumberType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="number"><xsd:simpleType><xsd:restriction base="xsd:string"><xsd:pattern value="[0-9\(\)\-]*" /></xsd:restriction></xsd:simpleType></xsd:element><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="specialInstructionsType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  UserDefinedDataType [dbo].[Flag]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[Flag] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[Name] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[NameStyle] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Notes]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[Notes] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NoYes]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[NoYes] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NoYesMaybe]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[NoYesMaybe] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Phone]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[Phone] FROM [nvarchar](25) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[x]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[x] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [Foodshelf].[GroceryOrBreadProduce]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [Foodshelf].[GroceryOrBreadProduce] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [Person].[SSN]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [Person].[SSN] FROM [nvarchar](9) NOT NULL
GO
/****** Object:  UserDefinedTableType [dbo].[BatchProcessPersonID]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[BatchProcessPersonID] AS TABLE(
	[RowID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[ActionToTake] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LUTableChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[LUTableChanges] AS TABLE(
	[TableRows] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Oldvalue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LUTableChangesa]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE TYPE [dbo].[LUTableChangesa] AS TABLE(
	[TableRows] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Oldvalue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL
)
GO
/****** Object:  StoredProcedure [dbo].[GetChildDepartments]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetChildDepartments](@DepartmentID int)
AS
BEGIN
    WITH ParentDepartment AS 
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription 
        FROM Volunteer.VolunteerDepartment
        WHERE DepartmentID = @DepartmentID
    ),
    ChildDepartment AS
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription
        FROM Volunteer.VolunteerDepartment
    )

    SELECT D1.DepartmentDescription AS "Parent Department", D2.DepartmentDescription AS "Child Department"
    FROM ParentDepartment AS D1
    INNER JOIN ChildDepartment AS D2
    ON D1.DepartmentID = D2.ParentDepartmentID

END
GO
/****** Object:  StoredProcedure [dbo].[GetPersonAddressByType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select max(DateOfBirth) AS MaxDOB, min(DateOfBirth) AS MinDOB, 
--avg(cast(DateOfBirth as int)) AS AvgDOB from Person.Person

----------------------------------------------------
-- Temp table to show rtrim and ltrim
--Create the temp table
--CREATE TABLE #trimExample (COL1 VARCHAR(10));
--GO
----Populate the table
--INSERT INTO #trimExample (COL1)
--VALUES ('a  '),('b  '),('  c'),('  d  ');

----Select the values using the functions
--SELECT COL1, '*' + RTRIM(COL1) + '*' AS "RTRIM",
--    '*' + LTRIM(COL1) + '*' AS "LTRIM"
--FROM #trimExample;

----Clean up
--DROP TABLE #trimExample;
----------------------------------------------------

--SELECT LastName,LEFT(LastName,5) AS "LEFT",
--    RIGHT(LastName,4) AS "RIGHT"
--FROM Person.Person

-- Create MyAction function
--CREATE FUNCTION [dbo].[MyActionToTake] (@Source NVarchar(8))
--RETURNS int AS
--BEGIN
--    DECLARE @Result int, @Temp NVarchar(8);
--    SET @Result = 0;
--    SET @Temp = '';

--    -- Remove any spaces
--    SELECT @Temp = RTRIM(LTRIM(@Source));

--    IF @Temp = 'DEMOTE'
--        SET @Result = 1;
--    ELSE IF @Temp = 'DELETE'
--        SET @Result = 1;
--    ELSE IF @Temp = 'NEWHOUSEHOLD'
--        SET @Result = 1;
--    ELSE
--        SET @Result = 0;

--    RETURN @Result
--END-- End function

--DECLARE @result int = 0;
--EXEC @result = MyActionToTake @Source = 'DELETE';

--SELECT @result AS RESULT

--EXEC sp_databases
--EXEC sp_columns @table_name = [Person]

CREATE PROCEDURE [dbo].[GetPersonAddressByType] (@PersonID int, @AddressType int, @Address NVarchar(200) output)
AS
BEGIN
    SELECT @Address = AddressLine1 + ' ' + City + ' ' + State FROM Person.Address
    WHERE PersonID = @PersonID AND AddressTypeID = @AddressType
END


GO
/****** Object:  StoredProcedure [dbo].[pDeleteAddress]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Delete data from Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. Make sure that delete haplpens based on AddressID PersonId as extra
	precaution
Revisions:
**************************************************************************************************/

create PROCEDURE [dbo].[pDeleteAddress](
	@AddressID int,
	@PersonID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressID int,
	@TempPersonID int
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;
		



		BEGIN TRY
		  BEGIN TRANSACTION;
			
		/****************************************************************************/	
		  
		SELECT @TempAddressID = @AddressID
			FROM Person.Address
				WHERE
					AddressID = @AddressID AND PersonID = @PersonID
		
		IF @TempAddressID = 0 OR @TempAddressID IS NULL
			BEGIN
				SELECT @ErrorStatus='-7015 PersonID/AddressID combo doesnt exist in Address';
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);
	
			END			
					
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-7000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  DELETE FROM Person.Address WHERE AddressID = @AddressID and PersonID = @PersonID;
				
				
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -7001' +' Delete Failed';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pDeleteAddressType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Deletes from LUAddressType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteAddressType](
	@AddressTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@AddressTypeID = 0) OR (@AddressTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 AddressTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempAddressTypeID =@AddressTypeID
				  FROM person.LUAddressType
					 WHERE  AddressTypeID= @AddressTypeID
			
								 
				IF ((@TempAddressTypeID=0) OR (@TempAddressTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 AddressTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUAddressType
					 WHERE AddressTypeID = @AddressTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail AddressType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteCity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUCity
Description: Deletes from LUCity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteCity](
	@CityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@CityID = 0) OR (@CityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60055 CityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempCityID =@CityID
				  FROM person.LUCity
					 WHERE  CityID= @CityID
			
								 
				IF ((@TempCityID=0) OR (@TempCityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60058 CityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUCity
					 WHERE CityID = @CityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60053 DELETE Fail City';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteClient]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pDeleteClient](
	@PersonID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
		@TempPersonID int	
		SET @TempPersonID =0;	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@PersonID = 0) or (@PersonID) = NULL --Must have a person id to know the person
				BEGIN
					SELECT @ErrorStatus =  '-60055 PersonID cannot be 0 or null';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Check to see if the person exists
			SELECT @TempPersonID = PersonID
				FROM person.person
					WHERE PersonID = @PersonID
					
	     		If (@TempPersonID = NULL) OR (@TempPersonID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 PersonID Doesnt Exist in Person table.'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Person.Person
				SET IsDeleted = 1
				WHERE
					PersonID = @PersonID;
					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Delete Failed on Person ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteContactType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUContactType
Description: Deletes from LUContactType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteContactType](
	@ContactTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempContactTypeID int
	
	SET @TempContactTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ContactTypeID = 0) OR (@ContactTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60025 ContactTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempContactTypeID =ContactTypeID
				  FROM person.LUContactType
					 WHERE  ContactTypeID= @ContactTypeID
			
								 
				IF ((@TempContactTypeID=0) OR (@TempContactTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60028 ContactTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUContactType
					 WHERE ContactTypeID = @ContactTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60023 DELETE Fail ContactType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteDemographics]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Deletes from Demographics
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteDemographics](
	@DemographicsID int,
	@PersonID int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempDemographicsID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@DemographicsID = 0) OR (@DemographicsID IS NULL)) OR  ((@PersonID = 0) OR (@PersonID IS NULL))
				  BEGIN
					SELECT @ErrorStatus = '2005 DemographicsID/PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--Check to see that the IDs match.. paranoid? NO! Have had worse things happen....Data integrity can fail!
				--Could use count but that has some optimization and indexing problems....
				SELECT @TempPersonID = PersonID, @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID AND DemographicsID = @DemographicsID
			
								 
				IF ((@TempDemographicsID=0) OR (@TempDemographicsID IS  NULL))OR ((@TempPersonID =0) OR (@TempPersonID IS NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -2008 DemographicsID/PersonID combo does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.Demographics
					 WHERE DemographicsID = @DemographicsID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 DELETE Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteEducationCategory]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUEducationCategory
Description: Deletes from LUEducationCategory
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteEducationCategory](
	@EducationCategoryID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEducationCategoryID int

	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EducationCategoryID = 0) OR (@EducationCategoryID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 EducationCategoryID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationCategoryID = @TempEducationCategoryID
			
								 
				IF ((@TempEducationCategoryID=0) OR (@TempEducationCategoryID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60078 EducationCategoryID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUEducationCategory
					 WHERE EducationCategoryID = @EducationCategoryID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60073 DELETE Fail EducationCategory';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteEthnicity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUEthnicity
Description: Deletes from LUEthicity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteEthnicity](
	@EthnicityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EthnicityID = 0) OR (@EthnicityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 EthnicityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEthnicityID =EthnicityID  
				  FROM person.LUEthnicity
					 WHERE EthnicityID = @TempEthnicityID
			
								 
				IF ((@TempEthnicityID=0) OR (@TempEthnicityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 EthnicityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUEthnicity
					 WHERE EthnicityID = @EthnicityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail Ethnicity';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteFamilyMember]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member is deleted from a household. It assumes that if the 
person is the head of the old household, that another person has been promoted to head of that household already. It will also delete 
an entire household, if requested.

REV: 25 July 11. Commented out delete entire household per Carol Paul's request

THIS SP IS NOT BEING USED !!! MAY RETURN IN THE FUTURE!
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFamilyMember](
	@DeletePersonID int,--The person/Household,
	@HeadofHouseholdPersonID int, --Might be the same as @DeletePersonID if it is the head of household!
	--@NewHeadOfHouseholdPersonID int, --Only filled if the person to be deleted is currently the head of household
	--@IsHouseholdDelete bit,--This set to 1 will delete the entire household
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

--	DECLARE
--	@ErrNo INT,
--	@LogMsg NVarchar(50),
--	@journalSuccess BIT,
--	@JournalErrorStatus NVarchar(50)
	
	
--	SET @Success = 0;
--	SET @ErrorStatus ='';
--	SET @ErrNo =0;	
--	SET @LogMsg ='Deleted from household. IsHouseholdDelete: '+ CONVERT(NVarchar(50),@ISHouseholdDelete)

	
	           
--BEGIN TRY
	-- BEGIN TRANSACTION;
	----Place a record in the Journal Table with the appropriate information before making the change. 
	----Update the Relationship table with the new household's client ID and the new relationship
	----Make update to demographics table for new family status. 
	
	--			 EXEC dbo.pInsertJournalClientFamilyChanges @DeletePersonID,
	--														@HeadofHouseholdPersonID,
	--														@NewHeadOfHouseholdPersonID,
	--														@LogMsg,
	--														'',--Notes Field blank for now
	--														@ModifiedBy,
	--														@JournalSuccess,--we don't care about the return values of this and error status for time being
	--														@JournalErrorStatus
															
					
						
	
		--IF @IsHouseholdDelete =1
		----cursors are evil so we will use a temp table. This assum that the family as a whole is to be deleted.
		--	BEGIN
		--		--We need to retrieve the entire family from the FamilyRelationships table. Using temp table because
		--		--cursors are not very efficient. Do this to isolate this family's records from the main tables to help avoid
		--		--problems with batch updates in main system
							
		--		 DECLARE
		--			@RowCount int,
		--			@NumberRecs int,
		--			@tmpPersonID int,
		--			@tmpClientPersonID int
					
		--			SET @tmpClientPersonID = @HeadOfHouseholdPersonID
					
					
		--			SET @RowCount =1
					
		--		 CREATE TABLE #tempfamily
		--			(RowID int identity(1,1), PersID int)
					
		--			INSERT #tempfamily
					
		--			SELECT PersonID
		--				FROM Person.FamilyRelationships 
		--				WHERE ClientPersonID=@HeadOfHouseholdPersonID
						
		--				SET @NumberRecs = @@ROWCOUNT --How many did we insert into #tempFamily
						
		--				WHILE @RowCount <=@NumberRecs
		--					BEGIN
		--						SELECT @tmpPersonID =PersID 
		--							FROM #tempfamily
		--							WHERE RowID =@Rowcount
							
		--					UPDATE Person.Person
		--						SET IsDeleted =1
		--						WHERE PersonID =@TmpPersonID
								
		--						SELECT @ErrNo =@@ERROR 
								
		--						 SET @RowCount = @RowCount + 1
								
		--					END --End While
					
					--IF @ErrNo<>0
					--	BEGIN
					--		SET @ErrorStatus ='Failed on Delete Family Member PersonID: ' + CONVERT(NVarchar(50),@TmpPersonID)
					--		RAISERROR(@ErrorStatus,16,0)
					
					--	END--IF@ErrNO
							
					
						
					--	--Finally, delete the client
					--	UPDATE person.Person
					--		SET IsDeleted =1
					--		WHERE PersonID =@HeadOfHouseholdPersonID
					--	SELECT @ErrNo =@@ERROR 
					
					--IF @ErrNo<>0
					--	BEGIN
					--		SET @ErrorStatus ='Failed on Delete PersonID: ' + CONVERT(NVarchar(50),@HeadOfHouseholdPersonID)
					--		RAISERROR(@ErrorStatus,16,0)
					
					--	END--@Errno
															
					
				--DROP TABLE #tempfamily
								
			--END
			
			----ELSE IF	 @IsHouseholdDelete =0
			--	BEGIN
			--		--Delete the client
			--		UPDATE Person.Person 
			--			SET IsDeleted =1
			--			WHERE PersonID =@HeadOfHouseholdPersonID
						
			--	SELECT @ErrNo =@@ERROR 
					
			--		IF @ErrNo<>0
			--			BEGIN
			--				SET @ErrorStatus ='Failed on Client Delete'
			--				RAISERROR(@ErrorStatus,16,0)
					
			--			END--@errNO=...
				--END--Else IF
					
				
						
	/******************************************************************************************************
	
	 
	
	--*******************************************************************************************************/
	--	COMMIT TRANSACTION;
	
	--	END TRY

	--	BEGIN CATCH
	--		  ROLLBACK TRANSACTION;
	--		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
	--			--We only care if the error was not raised by SSE
	--			IF @@ERROR <> 50000
	--				BEGIN
	--					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
	--				END
	--		  SET @Success =0;
	--		  SET @ErrorStatus=  @ErrorStatus + '-1001';
	--		  RAISERROR(@ErrorStatus, 15, 1);
		
			  
	--	END CATCH
		
















GO
/****** Object:  StoredProcedure [dbo].[pDeleteFamilyStatusType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Deletes from LUFamilyStatusType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFamilyStatusType](
	@FamilyStatusTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyStatusTypeID int
	
	SET @FamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 FamilyStatusTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @FamilyStatusTypeID =FamilySTatusTypeID  
				  FROM person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
			
								 
				IF ((@TempFamilyStatusTypeID=0) OR (@TempFamilyStatusTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 FamilySTatusTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuFamilyStatusType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [dbo].[pDeleteFoodTypeGiven]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: FoodTypeGiven
Description: Deletes from FoodTypeGiven. A person may have 1 to may records here. Deletes only one based
on input ID.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFoodTypeGiven](
	@PersonID int,
	@FoodTypeGivenID int, --This is the key. 
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFoodTypeGivenID int
	
	SET @TempFoodTypeGivenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FoodTypeGivenID = 0) OR (@FoodTypeGivenID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600005 FoodTypeGiven cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				  
				  IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6000006 PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--This just avoids deleting a FoodTypeGivenID if it is associated with a different PersonID
				SELECT @TempFoodTypeGivenID =  FoodTypeGivenID
				  FROM Foodshelf.FoodTypeGiven
					 WHERE  PersonID= @PersonID AND FoodTypeGivenID = @FoodTypeGivenID
			
								 
				IF ((@TempFoodTypeGivenID=0) OR (@TempFoodTypeGivenID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600008 FoodTypeGivenID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM Foodshelf.FoodTypeGiven
					 WHERE FoodTypeGivenID = @FoodTypeGivenID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteHouseholdTransferOptions]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 22 April 11
*Table Name: HouseholdTransferOptions
Description: Deletes from HouseholdTransferOptions. Since the fields are free format in this table,
we only take in the ID for deletion
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteHouseholdTransferOptions](
	@ActionToTakeID  int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID  =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ActionToTakeID = 0) OR (@ActionToTakeID  IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 ActionToTakeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempActionToTakeID =@ActionToTakeID 
				  FROM dbo.LUHouseholdTransferOptions
					 WHERE  HouseholdTransferActionID= @ActionToTakeID
			
								 
				IF ((@TempActionToTakeID=0) OR (@TempActionToTakeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 ActionToTakeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  dbo.LUHouseholdTransferOptions
					 WHERE HouseholdTransferActionID = @TempActionToTakeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail LUHouseholdTransferOptions';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pDeleteHousingStatus]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUHousingStatus
Description: Deletes from LUHousingStatus
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteHousingStatus](
	@HousingStatusID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@HousingStatusID = 0) OR (@HousingStatusID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 HousingStatusID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempHousingStatusID =HousingStatusID
				  FROM person.LUHousingStatus
					 WHERE  HousingStatusID= @HousingStatusID
			
								 
				IF ((@TempHousingStatusID=0) OR (@TempHousingStatusID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 HousingStatusID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUHousingStatus
					 WHERE HousingStatusID = @HousingStatusID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail HousingStatus';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteIncomeSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUIncomeSource
Description: Deletes from LUIncomeSource
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteIncomeSource](
	@IncomeSourceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60095 IncomeSourceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempIncomeSourceID = IncomeSourceID 
				  FROM person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID
			
								 
				IF ((@TempIncomeSourceID=0) OR (@TempIncomeSourceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60098 IncomeSourceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60093 DELETE Fail IncomeSource';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteInsuranceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUInsuranceType
Description: Deletes from LUInsuranceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteInsuranceType](
	@InsuranceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempInsuranceTypeID int
	
	SET @InsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 InsuranceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @InsuranceTypeID =InsuranceTypeID  
				  FROM person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID
			
								 
				IF ((@TempInsuranceTypeID=0) OR (@TempInsuranceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 InsuranceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuInsuranceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pDeleteLanguage]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LULanguage
Description: Deletes from LULanguage
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLanguage](
	@LanguageID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguageID = 0) OR (@LanguageID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 LanguageID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempLanguageID = LanguageID 
				  FROM person.LULanguage
					 WHERE LanguageID = @LanguageID
			
								 
				IF ((@TempLanguageID=0) OR (@TempLanguageID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60068 LanguageID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LULanguage
					 WHERE LanguageID = @LanguageID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteLanguagesSpoken]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LanguagesSpoken
Description: Deletes from LanguagesSpoken. A person may have 1 to may records here. Deletes only one based
on input ID.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLanguagesSpoken](
	@PersonID int,
	@LanguagesSpokenID int, --This is the key. do not confuse with LanguageID
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguagesSpokenID int
	
	SET @TempLanguagesSpokenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguagesSpokenID = 0) OR (@LanguagesSpokenID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '11005 LanguagesSpokenID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				  
				  IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '11006 PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--This just avoids deleting a LanguagesSpokenID if it is associated with a different PersonID
				SELECT @TempLanguagesSpokenID =  LanguagesSpokenID
				  FROM person.LanguagesSpoken
					 WHERE  PersonID= @PersonID AND LanguagesSpokenID = @LanguagesSpokenID
			
								 
				IF ((@TempLanguagesSpokenID=0) OR (@TempLanguagesSpokenID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -11008 LanguagesSpokenID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -11010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LanguagesSpoken
					 WHERE LanguagesSpokenID = @LanguagesSpokenID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-11013 DELETE Fail LanguagesSpoken';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteLUFamilyRelationship]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUFamilyRelationship
Description: Deletes from LUFamilyRelationship
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLUFamilyRelationship](
	@FamilyRelationshipID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyRelationshipID = 0) OR (@FamilyRelationshipID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempFamilyRelationshipID =FamilyRelationshipID
				  FROM person.LUFamilyRelationship
					 WHERE  FamilyRelationshipID= @FamilyRelationshipID
			
								 
				IF ((@TempFamilyRelationshipID=0) OR (@TempFamilyRelationshipID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60048 FamilyRelationshipID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUFamilyRelationship
					 WHERE FamilyRelationshipID = @FamilyRelationshipID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60043 DELETE Fail FamilyRelationship';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePersonType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPersonType
Description: Deletes from LUPersonType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePersonType](
	@PersonTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PersonTypeID = 0) OR (@PersonTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 PersonTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPersonTypeID =PersonTypeID  
				  FROM person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID
			
								 
				IF ((@TempPersonTypeID=0) OR (@TempPersonTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 PersonTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail PersonType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePhoneType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPhoneType
Description: Deletes from LUPhoneType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePhoneType](
	@PhoneTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600085 PhoneTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPhoneTypeID =PhoneTypeID  
				  FROM person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID
			
								 
				IF ((@TempPhoneTypeID=0) OR (@TempPhoneTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600088 PhoneTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600083 DELETE Fail PhoneType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePostalCode]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPostalCode
Description: Deletes from LUPostalCode
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePostalCode](
	@PostalCodeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPostalCodeID int
	
	SET @TempPostalCodeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PostalCodeID = 0) OR (@PostalCodeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6075 PostalCodeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPostalCodeID =PostalCodeID
				  FROM person.LUPostalCode
					 WHERE  PostalCodeID= @PostalCodeID
			
								 
				IF ((@TempPostalCodeID=0) OR (@TempPostalCodeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6078 PostalCodeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPostalCode
					 WHERE PostalCodeID = @PostalCodeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6073 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteProgramServiceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Deletes from LUProgramServiceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteProgramServiceType](
	@ProgramServiceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6055 ProgramServiceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramServiceTypeID =ProgramServiceTypeID
				  FROM person.LUProgramServiceType
					 WHERE  ProgramServiceTypeID= @ProgramServiceTypeID
			
								 
				IF ((@TempProgramServiceTypeID=0) OR (@TempProgramServiceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6058 ProgramServiceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUProgramServiceType
					 WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6053 DELETE Fail ProgramServiceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteProgramType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Deletes from LUProgramType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteProgramType](
	@ProgramTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6045 ProgramTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramTypeID =ProgramTypeID
				  FROM person.LUProgramType
					 WHERE  ProgramTypeID= @ProgramTypeID
			
								 
				IF ((@TempProgramTypeID=0) OR (@TempProgramTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6048 ProgramTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUProgramType
					 WHERE ProgramTypeID = @ProgramTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6043 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteRace]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LURace
Description: Deletes from LURace
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteRace](
	@RaceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@RaceID = 0) OR (@RaceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6025 RaceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempRaceID =RaceID
				  FROM person.LURace
					 WHERE  RaceID= @RaceID
			
								 
				IF ((@TempRaceID=0) OR (@TempRaceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6028 RaceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LURace
					 WHERE RaceID = @RaceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6023 DELETE Fail Race';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteState]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Deletes from LUState
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteState](
	@StateID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@StateID = 0) OR (@StateID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6035 StateID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempStateID =StateID
				  FROM person.LUState
					 WHERE  StateID= @StateID
			
								 
				IF ((@TempStateID=0) OR (@TempStateID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6038 StateID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUState
					 WHERE StateID = @StateID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6033 DELETE Fail State';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerContactInformation record
-- =============================================

CREATE PROCEDURE [dbo].[pDeleteVolunteerContactInformation]
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerPersonID = 0 OR @VolunteerPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @VolunteerPersonID)
                BEGIN --IF @VolPersonID exists
                    RAISERROR('VolunteerPersonID does not exist.',16,1);
                END --IF @VolPersonID

            DELETE FROM Volunteer.VolunteerContactInformation
            WHERE VolunteerPersonID = @VolunteerPersonID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerEmergencyContact]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerEmergencyContact record
-- =============================================

CREATE PROCEDURE [dbo].[pDeleteVolunteerEmergencyContact]
	-- Add the parameters for the stored procedure here
	@VolunteerEmergencyContactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerEmergencyContactID = 0 OR @VolunteerEmergencyContactID IS NULL
			    BEGIN  --IF @@VolunteerEmergencyContactID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @@VolunteerEmergencyContactID = 0 OR

            -- Check if VolunteerEmergencyContact exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerEmergencyContact WHERE VolunteerEmergencyContactID = @VolunteerEmergencyContactID)
                BEGIN --IF @VolunteerEmergencyContactID exists
                    RAISERROR('VolunteerEmergencyContactID does not exist.',16,1);
                END --IF @VolunteerEmergencyContactID

            DELETE FROM Volunteer.VolunteerEmergencyContact
            WHERE VolunteerEmergencyContactID = @VolunteerEmergencyContactID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleDayTime]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerScheduleDayTime record
-- =============================================

CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleDayTime]
	-- Add the parameters for the stored procedure here
	@VolunteerScheduleDayTimeID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerScheduleDayTimeID = 0 OR @VolunteerScheduleDayTimeID IS NULL
			    BEGIN  --IF @VolunteerScheduleDayTimeID = 0 OR 
				    RAISERROR('VolunteerScheduleDayTimeID cannot be null or 0',16,1);
			    END	--IF @VolunteerScheduleDayTimeID = 0 OR

            -- Check if @VolunteerScheduleDayTimeID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleDayTime WHERE VolunteerScheduleDayTimeID = @VolunteerScheduleDayTimeID)
                BEGIN --IF @VolunteerScheduleDayTimeID exists
                    RAISERROR('VolunteerScheduleDayTimeID does not exist.',16,1);
                END --IF @VolunteerScheduleDayTimeID

            DELETE FROM Volunteer.VolunteerScheduleDayTime
            WHERE VolunteerScheduleDayTimeID = @VolunteerScheduleDayTimeID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleMonth]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerScheduleMonth record
-- =============================================

CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleMonth]
	-- Add the parameters for the stored procedure here
	@VolunteerScheduleMonthID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerScheduleMonthID = 0 OR @VolunteerScheduleMonthID IS NULL
			    BEGIN  --IF @VolunteerScheduleMonthID = 0 OR 
				    RAISERROR('VolunteerScheduleMonthID cannot be null or 0',16,1);
			    END	--IF @VolunteerScheduleMonthID = 0 OR

            -- Check if @VolunteerScheduleMonthID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleMonth WHERE VolunteerScheduleMonthID = @VolunteerScheduleMonthID)
                BEGIN --IF @VolunteerScheduleMonthID exists
                    RAISERROR('VolunteerScheduleMonthID does not exist.',16,1);
                END --IF @VolunteerScheduleMonthID

            DELETE FROM Volunteer.VolunteerScheduleMonth
            WHERE VolunteerScheduleMonthID = @VolunteerScheduleMonthID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleWeek]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerScheduleWeek record
-- =============================================

CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleWeek]
	-- Add the parameters for the stored procedure here
	@VolunteerScheduleWeekID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerScheduleWeekID = 0 OR @VolunteerScheduleWeekID IS NULL
			    BEGIN  --IF @VolunteerScheduleWeekID = 0 OR 
				    RAISERROR('VolunteerScheduleWeekID cannot be null or 0',16,1);
			    END	--IF @VolunteerScheduleWeekID = 0 OR

            -- Check if @VolunteerScheduleWeekID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleWeek WHERE VolunteerScheduleWeekID = @VolunteerScheduleWeekID)
                BEGIN --IF @VolunteerScheduleWeekID exists
                    RAISERROR('VolunteerScheduleWeekID does not exist.',16,1);
                END --IF @VolunteerScheduleWeekID

            DELETE FROM Volunteer.VolunteerScheduleWeek
            WHERE VolunteerScheduleWeekID = @VolunteerScheduleWeekID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pGetActiveVolunteerContactInfo]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-27
-- Description:	Get volunteer contact information for all active volunteers.
-- =============================================
CREATE PROCEDURE [dbo].[pGetActiveVolunteerContactInfo] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    WITH ActiveIDS AS 
    (
        SELECT V.VolunteerPersonID,
            C.ContactPersonID,
            C.OrganizationID,
			C.ContactFirstName,
			C.ContactLastName,
			C.ContactAddress1,
			C.ContactAddress2,
			C.ContactEmail,
			C.ContactHomePhone,
			C.ContactCellPhone,
			C.ContactWorkPhone,
			C.ContactPager,
			C.Volunteertypeid,
			C.IsActive,
			C.ModifiedBy,
			C.ModifiedDate FROM [dbo].FetchActiveVolunteers() AS V 
            CROSS APPLY [dbo].FetchVolunteerContactInfo(V.VolunteerPersonID) AS C
    )

	SELECT * FROM ActiveIDS


END

GO
/****** Object:  StoredProcedure [dbo].[pGetVolunteerNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick
-- Create date: 20-09-2020
-- Description:	Gather notes for a volunteer by name
-- =============================================
CREATE PROCEDURE [dbo].[pGetVolunteerNotes] 
	-- Add the parameters for the stored procedure here
	@ContactFirstName nvarchar(50), 
	@ContactLastName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH GetID (VolunteerPersonID)
        AS (SELECT VolunteerPersonID FROM Volunteer.VolunteerContactInformation 
        WHERE ContactFirstName = @ContactFirstName AND ContactLastName = @ContactLastName),
    GetNotes (Note)
        AS (SELECT Note FROM Volunteer.VolunteerNotes
        inner JOIN GetID AS G ON VolunteerNotes.VolunteerPersonID = G.VolunteerPersonID)

    SELECT  Note FROM GetNotes

END

GO
/****** Object:  StoredProcedure [dbo].[pInsertAddress]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
* Stored Procedure Template. Change XXX in name to the name of the table that will get the insert. This is to be used
*for single table inserts only. 
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Inserts data to Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. We can check to see if an address is a duplicate, but that will have
	limited use since we would have to count on a combination of free-format fields since it is possible to have more than
	one address in the same city, zipcode, state, county, etc.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertAddress](
	@PersonID int,
	@AddressLine1 Nvarchar(60),
	@AddressLine2 Nvarchar(60) = NULL,
	@City NVarchar(30),
	@County NVarchar(30),
	@State NVarchar(2),
	@PostalCode NVarchar(10) ,
	@AddressTypeID int,
	@ModifiedBy Name,
	@NewAddressID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressTypeID int,
	@TempPersonID int,
	@TempAddressID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;		



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--This is a bit different than some procedures because there is a lookup table associated with 
			--the address, so we need to be sure that the data matches an address type before continuing.
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressTypeID = (@AddressTypeID)
			
			If @TempAddressTypeID = 0
			BEGIN
				SET @ErrorStatus = ' -7002 Address Type does not existLUAddressType'; --Failed in lookup table
				RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
				
			END	
		/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-7000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  INSERT Person.Address(PersonID,AddressLine1,AddressLine2,City,County,Address.State,PostalCode,AddressTypeID,ModifiedDate, ModifiedBy)
					VALUES (@PersonID, @AddressLine1, @AddressLine2,@City,@County,@State,@PostalCode,@AddressTypeID,SYSDATETIME(),@ModifiedBy)
				
				set @NewAddressID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -7001' +' Insert Failed';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertAddressType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Inserts data to LUAddressType. This table matches the address with an address type
Revisions:
G.S. - 20 Oct 10. Fixed problem with error handler not firing on preliminary lookup.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertAddressType](
	@AddressType Nvarchar(10),
	@ModifiedBy Name,
	@NewAddressTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressType = Rtrim(Ltrim(@AddressType)) --Be a bit paranoid and trim the input for white spaces
			If @TempAddressTypeID <> 0 --Already Exists
				BEGIN
					SELECT @ErrorStatus = '-7015 AddressType Already Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16, 1);
	END
	 
			
			  INSERT Person.LUAddressType(AddressType,ModifiedDate, ModifiedBy)
					VALUES (@AddressType,SYSDATETIME(),@ModifiedBy)
				
				set @NewAddressTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END








GO
/****** Object:  StoredProcedure [dbo].[pInsertCertificationText]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************
*Author: Gary Savard
*Date: 03/29/2011
*Table Name: LuCertificationText
Description: Inserts data to LUCertificationText.
The text inserted into this table shall not be deleted because the text history must be assoicated with signature history. No
delete SP will be created for this table.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCertificationText](
	@CertificationText NVarchar(MAX),
	@GuidelinesText NVarchar(MAX),
	@ModifiedBy Name,
	@NewCertificationTextID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCertificationTextID int
	
	SET @TempCertificationTextID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
		
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			  INSERT Foodshelf.LUCertificationText(CertificationText,GuidelinesText, ModifiedDate,ModifiedBy)
					VALUES (@CertificationText,@GuidelinesText,SYSDATETIME(),@ModifiedBy)
				
				set @NewCertificationTextID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Insert Failed on LUCertificationText ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END













GO
/****** Object:  StoredProcedure [dbo].[pInsertCity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCity
Description: Inserts data to LUCity.
Ideally we would have information on the county as well as the state before we add the city. However, 
we cannot assume that we have a county, so we will have it to default to 0, if no value is entered.
Revisions:
GS 20 Oct fixed failure in error handler due to implicit conversion of @@Error, worked intermittantly 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCity](
	@CityName NVarchar(30),
	@CityAbbreviation Nvarchar(30) ='',
	@StateID int,
	@CountyID int = 0,--Default countyID to 0 just in case it comes in later. 
	@PostalCodeID int =0, --Will come later, just a place holder
	@ModifiedBy Name,
	@NewCityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
		
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF @StateID = 0 --Must have a state before we can have a city!
				BEGIN
					SELECT @ErrorStatus =  '-60055 StateID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/

			SELECT @TempCityID = CityID 
				FROM person.LUCity
					WHERE CityName = Rtrim(Ltrim(@CityName)) and StateID = @StateID
	     		If @TempCityID <>0 
					BEGIN
						SET @ErrorStatus = ' -60052 City exists in LUCity'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			  INSERT Person.LUCity(StateID,CountyID,PostalCodeID,CityName,CityAbbreviation, ModifiedDate,ModifiedBy)
					VALUES (@StateID,@CountyID,@PostalCodeID,@CityName,@CityAbbreviation,SYSDATETIME(),@ModifiedBy)
				
				set @NewCityID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Insert Failed on City ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertClientFamilyRecord]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new family member for a client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call
--15 March 11. Modified to remove address, phone, email and number in household for family members. The version with all of these parameters
--exists in a new stored procedure called pInsertFamilyRecordWithAddress, if ever needed. It is the same sp as this one before these edits.
--5 April remove @numberInHousehold, @HomeboundDelivery,@ISPrimaryLanguage,@LanguageId,@Title,@Suffix
--19 July 2011 Added LTRIM,RTRIM for @Firstname, @MiddleName, @LastName
-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientFamilyRecord] (
	@RecordSource NVarchar(8),
	@ClientPersonID int,
  	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@DateOfBirth DateTime,
	@RelationshipID int,
	@RelationshipDescription NVarchar(50)='',
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@FamilyStatusType NVarchar(50),
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@EducationCategoryID int =0, --Not required for Food shelf
	@CountryOfOrigin nVarchar(70)='', --Not required for food shelf
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@NewFamilyRelationshipID int output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewAddressID int,
	@NewPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@TempClientPersonID int,
	@DummyNumberInHousehold int, --just place holder with default of 0
	@DummyHomeboundDelivery int,
	@DummyIsPrimaryLanguage bit,
	@DummyLanguageID int,
	@DummyTitle NVarchar(8),
	@DummySuffix NVarchar(10)
		
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @DummyNumberInHousehold =0;
	SET @DummyHomeboundDelivery=2;--This is set to N/A
	SET @DummyIsPrimaryLanguage=0;
	SET @DummyLanguageID=0;
	SET @DummyTitle = NULL;
	SET @DummySuffix = NULL;
	SET @FirstName = LTRIM(rtrim(@firstname));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	--The family member must be associated with a ClientPersonID or we bail.
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
		IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN  --IF @ClientPersonID = 0 OR 
				SET @Success =0;
				SET @ErrorStatus = '-17500 ClientPersonID cannot be null or 0';
				RAISERROR(@ErrorStatus,16,1);
			
			END	--IF @ClientPersonID = 0 OR 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
		SELECT @TempClientPersonID = @ClientPersonID
			FROM Person.Person
				WHERE PersonID = @ClientPersonID
				
		IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL--the client must exist to have a family member!
			BEGIN --IF @TempClientPersonID = 0 OR
				SET @Success=0;
				SET @ErrorStatus = '-17501 ClientPersonID does not exist in person';
				RAISERROR (@ErrorStatus,16,1);
			END  --IF @TempClientPersonID = 0 OR
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN --IF @ValidSource =0
			SET @Success =0;
			SELECT @ErrorStatus = '-17100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END --IF @ValidSource =0
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++					
	
	BEGIN --Insert into Person and take the new personID for further use. Email address NULL and Email Contact 0 hard coded for family members	
		EXEC DBO.pInsertPerson @DummyTitle,@FirstName,@MiddleName,@LastName,@DummySuffix, @DateOfBirth,NULL,0,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;--Fix this in future!
		
		
		IF @Succ =0 -- Failure!
			BEGIN  --IF @Succ =0 -- Failure!
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-17200 Sub Pro pInsertPerson Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END --IF @Succ =0 -- Failure!
		SET @Success =1;
		SET @ErrorStatus='';	
	END --Insert into Person and take the new personID for further use.	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
  BEGIN --IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
			
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
	--Insert Demographics
		BEGIN --Insert Demographics. Number in household hard coded to 0 for family members
			EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@DummyNumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FamilyStatusType,@InsuranceType,@FoodStamps,@DummyHomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
				IF @Succ = 0
					BEGIN --IF @Succ = 0
						SET @Success =0;
						SELECT @ErrorStatus ='-13200 Sub proc Demographics returned fail' + @ErrorMsg;
						RAISERROR(@ErrorStatus,16,1);
						
					END --IF @Succ = 0
				END --Insert Demographics
			
			--Insert income source. This may take multiple entries in the future so we have not created an SP yet.	
			IF @IncomeSourceID <> 0
				BEGIN	
					INSERT INTO PERSON.Income (IncomeSourceID,PersonID,ModifiedBy,ModifiedDate) Values (@IncomeSourceID,@NewPersonID,@ModifiedBy,SYSDATETIME())
					
				END	
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = 'Fail on Insert Income';
					RAISERROR (@ErrorSTatus,16,1) with log;
				END	
		
			--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
			--A value for HouseholdMemberPersonID so we hard code it to 0.
				IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
					BEGIN --IF LTRIM(RTRIM(@notes))<>''
						EXEC DBO.pInsertHouseholdNotes @ClientPersonID, @NewPersonID,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
						IF @Succ =0
							BEGIN --IF @Succ =0
								SET @Success =0
								SET @ErrorStatus = '-17001 Insert Failed Notes' + @ErrorMsg;
								RAISERROR(@ErrorStatus,16,1);
							END --IF @Succ =0
					
					END --IF LTRIM(RTRIM(@notes))<>''
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pInsertFamilyRelationship @NewPersonIDout, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy, @NewFamilyRelationshipID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN --IF @Succ =0
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	--IF @Succ =0
					
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN --IF @@TRANCOUNT > 0 
		 SET @Success =1;
		 SET @ErrorStatus ='';
			COMMIT TRANSACTION;
		END --IF @@TRANCOUNT > 0 
END --IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	
















GO
/****** Object:  StoredProcedure [dbo].[pInsertClientFamilyRecordWithAddress]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new family member for a client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call

-- 16 March 11. This stored procedure has been renamed from pInsertClientFamilyRecord to pInsertClientFamilyRecordWithAddress
--Champlain Charity does not want to collect addresses of family members other than the client. The new pInsertClientFamilyRecord does not collect that data. This 
--is kept in case future clients want to capture that data.


-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientFamilyRecordWithAddress] (
	@RecordSource NVarchar(8),
	@ClientPersonID int,
    @Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@DateOfBirth DateTime,
	@RelationshipID int,
	@RelationshipDescription NVarchar(50)='',
	@Address1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@Address2 NVarchar(60) = NULL,
	@City	NVarchar(30),
	@County NVarchar(30) = NULL,
	@State NVarchar(2),
	@PostalCode NVarchar(10),
	@AddressTypeID int =0,--From the Lookup based on user input. May not need if Foodshelf
	@EmailAddress Nvarchar(50) = NULL,--May not need for foodshelf
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --0 default, Food shelf again!
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@NumberInHousehold int,
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =0, --Not required for Food shelf
	@CountryOfOrigin nVarchar(70)='', --Not required for food shelf
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@NewFamilyRelationshipID int out,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewAddressID int,
	@NewPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@TempClientPersonID int
		
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @FirstName =LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	--The family member must be associated with a ClientPersonID or we bail.
	
		IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-17500 ClientPersonID cannot be null or 0';
				RAISERROR(@ErrorStatus,16,1);
			
			END	
			
		SELECT @TempClientPersonID = @ClientPersonID
			FROM Person.Person
				WHERE PersonID = @ClientPersonID
				
		IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL--the client must exist to have a family member!
			BEGIN
				SET @Success=0;
				SET @ErrorStatus = '-17501 ClientPersonID does not exist in person';
				RAISERROR (@ErrorStatus,16,1);
			END
			
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-17100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
				
	--Insert into Person and take the new personID for further use.	
	BEGIN
		EXEC DBO.pInsertPerson @Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;
		
		
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-17200 Sub Pro Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
		SET @Success =1;
		SET @ErrorStatus='';	
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	
	--The address should be the same as that of the client, but we will add it anyway because this person
	--may eventually become a client and we will already have an AddressID that we can use and modify the location.

		IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
		BEGIN
			IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@Address1)) ='') OR (LTRIM(RTRIM(@Address1)) IS NULL) )--This is a problem because address is required
				BEGIN
					SET @Succ =0;
					SET @ErrorStatus ='-17300 Address Required for Non foodshelf intake.';
					RAISERROR(@ErrorStatus,16,1);
				END
		IF ((LTRIM(RTRIM(@Address1)) <> '') AND (@Address1 IS NOT NULL)) OR @RecordSource = 'FOOD'
		 BEGIN	
			EXEC DBO.pInsertAddress @NEWPersonID, @Address1,@Address2, @City,@County,@State,@PostalCOde,@AddressTypeID,@ModifiedBy, @NewAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-17200 Sub proc call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
				
		END

	
	--Insert Phone Number
	--We allow phone number since they may have a cell.
	BEGIN
		IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
			BEGIN
						SET @Succ =0;
						SET @ErrorStatus ='-17400 Phone Number Required for Non foodshelf intake.';
						RAISERROR(@ErrorStatus,16,1);
			END
			
		IF (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
	END
	
	--Insert Demographics
	BEGIN
		EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus ='-13200 Sub proc Demographics returned fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
		
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
			BEGIN
				EXEC DBO.pInsertHouseholdNotes @ClientPersonID, @NewPersonID,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-17001 Insert Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END
			
			END
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pInsertFamilyRelationship @NewPersonIDout, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy, @NewFamilyRelationshipID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	
		
			
	

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
		 SET @Success =1;
		 SET @ErrorStatus ='';
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
		Set @ErrorStatus = @ErrorStatus + 'Failure in pInsertClientFamilyRecordWithAddress'
		ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	













GO
/****** Object:  StoredProcedure [dbo].[pInsertClientRecord]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--@RecordSource can be FOOD,WX,MICRO,TENANT,COMMACT,ADMIN. This will be used to only execute parts of the 
--SP relevant to the client intake data brought in. For example, Foodshelf requires that a record be 
--set for the type of food taken, but this is not required elsewhere so we only execute that SP If things come from 
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call

---14 March 11 Added functionality for Cell Phone, Mailing Address, FamilyStatus, InsuranceType
--19 April, Add @IsUpdateBreadGroceries parameter to avoid inserting bread/produce, groceries if this is not required.
--3 May 11, fixed mail address blank records.
--11 July 11, Added LTrim,RTRIM @FIRSTNAME, @MiddleName, @LastName
-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientRecord] (
	@RecordSource NVarchar (8), --This allows for the sub sp's to be executed or skipped based on what data is to be saved
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@Gender NVarchar(2) ='',--May not need everywhere
	@DateOfBirth DateTime,
	@PhysicalAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@PhysicalAddress2 NVarchar(60) = NULL,
	@PhysicalCity	NVarchar(30),
	@PhysicalCounty NVarchar(30) = NULL,
	@PhysicalState NVarchar(2),
	@PhysicalPostalCode NVarchar(10),
	@PhysicalAddressTypeID int=0,--This is just addressTypeID, but this name is used to make distinctive in parameters list
	@MailAddress1 NVarchar(60) = NULL,
	@MailAddress2 NVarchar(60)= NULL,
	@MailCity NVarchar(30)=NULL,
	@MailCounty NVarchar(30)=NULL,
	@MailState NVarchar(2) =NULL,
	@MailPostalCode NVarchar(10)=NULL,
	@MailAddressTypeID int =0,--From the Lookup based on user input. May not need if Foodshelf
	@EmailAddress Nvarchar(50) = NULL,
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --Food shelf again!
	@PhoneNumber2 Phone ='',
	@PhoneExtension2 Nvarchar(8)='',
	@PhoneTypeID2 int =0,
	@FamilyStatusType Nvarchar(50), 
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType Nvarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =0, 
	@CountryOfOrigin nVarchar (70)='', 
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@NumberInHousehold int,
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@FoodReceivedDate DateTime,
	@IsUpdateBreadGroceries bit, --This is 1 if there is an update for the record and bread/produce, groceries.
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewPhysicalAddressID int,
	@NewMailAddressID int,
	@NewPhoneID int,
	@NewPhoneID2 int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@NewIncomeSourceID int
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewPhysicalAddressID =0;
	SET @NewMailAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewPhoneID2 =0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @NewIncomeSourceId =0;	
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
	
BEGIN		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-13100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1) with log;
			--Raise Error Here because the source is unknown.
		END
		
	--Insert into Person and take the new personID for further use.	
	BEGIN
		EXEC DBO.pInsertPerson @Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-13200 Sub Pro Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1) with log;
			END
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	

		IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
		BEGIN
			IF (@RecordSource <> 'FOOD') AND ((LTRIM(RTRIM(@PhysicalAddress1)) ='') OR (LTRIM(RTRIM(@PhysicalAddress1)) IS NULL)) --This is a problem because address is required
				BEGIN
					SET @Succ =0;
					SET @ErrorStatus ='-13300 Address Required for Non foodshelf intake.';
					RAISERROR(@ErrorStatus,16,1) with log;
				END
		
		IF (((LTRIM(RTRIM(@PhysicalAddress1)) <> '') AND (@PhysicalAddress1 IS NOT NULL))) OR @RecordSource = 'FOOD'
		 BEGIN	
			EXEC DBO.pInsertAddress @NewPersonID, @PhysicalAddress1,@PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCOde,@PhysicalAddressTypeID,@ModifiedBy, @NewPhysicalAddressID Output,@Succ Output, @ErrorMsg Output ;	
		
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc PhyAddr call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1) with log;
				END
					
		END
		
		IF (((LTRIM(RTRIM(@MailAddress1)) <> '') AND (@MailAddress1 IS NOT NULL))) /*OR @RecordSource = 'FOOD' Removed. Not necessary*/
		 BEGIN	
			EXEC DBO.pInsertAddress @NewPersonID, @MailAddress1,@MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCOde,@MailAddressTypeID,@ModifiedBy, @NewMailAddressID Output,@Succ Output, @ErrorMsg Output ;	
		
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc MailAddr call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1) with log;
				END
					
		END
		
		--We now need to check for a mailing address
		

	
	--Insert Phone Number
	BEGIN
		IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
			BEGIN
						SET @Succ =0;
						SET @ErrorStatus ='-13400 Phone Number Required for Non foodshelf intake.';
						RAISERROR(@ErrorStatus,16,1) with log;
			END
			
		IF (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Insert phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1) with log;
				END
	END
	
	--Insert Cell Phone. This is not a required field so we do not do the same checks as with regular phone.
	IF (LTRIM(RTRIM(@PhoneNumber2))<>'' AND @PhoneNumber2 IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Insert Phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1) with log;
				END
	
	--Insert Demographics
	BEGIN
	  
		EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FamilyStatusType,@InsuranceType,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus = '-2021 Insert Failed Demographics' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1) with log;
				
			END
		END
		
	--Insert Income Source. We are doing this directly but it could be put into a stored procedure. This may be modified for multiple entry later on but we assume 1 to 1 relationship a this point
	IF @IncomeSourceID <> 0
		BEGIN	
			INSERT INTO PERSON.Income (IncomeSourceID,PersonID,ModifiedBy,ModifiedDate) Values (@IncomeSourceID,@NewPersonID,@ModifiedBy,SYSDATETIME())
			
		END	
	IF @Succ =0
		BEGIN
			SET @Success =0;
			SET @ErrorStatus = 'Fail on Insert Income';
			RAISERROR (@ErrorSTatus,16,1) with log;
		END	
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
			BEGIN
				EXEC DBO.pInsertHouseholdNotes @NewPersonID, 0,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-14001 Insert Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1) with log;
				END
			
			END
		
	--IF source is foodshelf, we need to capture whether they were in for bread/produce or groceries 
	
	IF @RecordSource ='FOOD' and @IsUpdateBreadGroceries = 1
		BEGIN
			EXEC DBO.pInsertFoodTypeGiven @NewPersonID,@FoodReceivedDate,@FoodGiven,@ModifiedBy,@NewFoodTypeGivenID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT;
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-600021 Insert FoodType fail' + @ErrorMsg;
					RAISERROR (@ErrorStatus,16,1) with log;
				END	
	END
		

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
			SET @Success = 1;
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success = 0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1) with log;
		END
END CATCH

    -- Insert statements for procedure here
    END
    
	


















GO
/****** Object:  StoredProcedure [dbo].[pInsertContactType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUContactType
Description: Inserts data to LUContactType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertContactType](
	@Name Nvarchar(50) ,
	@ModifiedBy Name,
	@NewContactTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewContactID int
	
	SET @TempNewContactID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @TempNewContactID = ContactTypeID 
			  FROM person.LUContactType
			     WHERE Name = Rtrim(Ltrim(@Name)) 
	     			If @TempNewContactID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Contact Type already exists in LUContactType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUContactType(Name,ModifiedDate,ModifiedBy)
					VALUES (@Name,SYSDATETIME(),@ModifiedBy)
				
				set @NewContactTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUContactType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pInsertCountryOfOrigin]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCountryOfOrigin
Description: Inserts data to LUCountryOfOrigin.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCountryOfOrigin](
	@CountryAbbreviation Nvarchar(30) ='',
	@CountryName Nvarchar(50),
	@FIPSCode NVarchar(2)='',
	@ModifiedBy Name,
	@NewCountryID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewCountryID int
	
	SET @TempNewCountryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	 
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		    SELECT @TempNewCountryID = CountryID 
			  FROM person.LUCountryOfOrigin
				 WHERE CountryName = Rtrim(Ltrim(@CountryName)) 
	     			If @TempNewCountryID <>0 
						BEGIN
							SET @ErrorStatus = ' -60032 Country already exists in LUCountryOfOrigin'; 
								RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
							
						END	
 
/****************************************************************************/	          

						IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = @@ERROR + '-60030';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16,1);
						END
				  INSERT Person.LUCountryOfOrigin(CountryAbbreviation,CountryName,FIPSCode,ModifiedDate,ModifiedBy)
						VALUES (@CountryAbbreviation,@CountryName,@FIPSCode,SYSDATETIME(),@ModifiedBy)
					
					set @NewCountryID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60031 Insert Failed Rollback';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertCounty]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCounty
Description: Inserts data to LUCounty. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCounty](
	@CountyName NVarchar(20),
	@StateID int,
	@CityID int = 0,--Default cityID to 0 just in case it comes in later. 
	@ModifiedBy Name,
	@NewCountyID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCountyID int
	
	SET @TempCountyID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF @StateID = 0 --Must have a state before we can have a county!
				BEGIN
					SELECT @ErrorStatus = '-60065 StateID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/

				SELECT @TempCountyID = CountyID 
				  FROM person.LUCounty
					 WHERE CountyName = Rtrim(Ltrim(@CountyName)) and StateID = @StateID
	     				If @TempCountyID <>0 
							BEGIN
								SET @ErrorStatus = ' -60062 County exists in LUCounty'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  INSERT Person.LUCounty(StateID,CityID,CountyName, ModifiedDate,ModifiedBy)
					VALUES (@StateID,@CityID,@CountyName,SYSDATETIME(),@ModifiedBy)
				
				set @NewCountyID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60061 Insert Failed LUCounty ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertDemographics]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



















/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Inserts data to Demographics table
Revisions:1 Nov 10. Added housing status to demographics table and altered stored procedures accordingly.
14 December 10. Added Country of Origin. GS
14 March 11. Added FamilyStatusType and Insurance Type GS
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertDemographics](
	@PersonID int,
	@EducationCategoryID int,
	@HousingStatus NVarchar(50)=NULL,
	@NumberInHousehold int,
	@Gender NVarchar(2) ='',
	@Race Nvarchar(20) = NULL,
	@CountryOfOrigin NVarchar(70) =NULL,--This could have used an ID, but keeping it simple since end users will be doing own crystal reports.
	@Ethnicity Nvarchar(20) = Null,
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe=0 ,
	@FamilyStatusType Nvarchar(50),
	@InsuranceType Nvarchar(50),
	@FoodStamps NoYesMaybe =0,
	@HomeboundDelivery NoYesMaybe =0,
	@ModifiedBy Name,
	@NewDemographicsID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempDemographicsID int,
	@TempPersonId int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				SELECT @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID
					 
				IF @TEMPDemographicsID <> 0 --If not zero then already exists. 
				   BEGIN
					SELECT @ErrorStatus = '-2005 DemogID already exists for PersonID';
					SET @ErrorStatus =0;
					RAISERROR(@ErrorStatus,16,1);
				   END        

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(20),@@ERROR) + ' -1000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  INSERT Person.Demographics(PersonID,
											EducationCategoryID,
											HousingStatus,
											NumberInHousehold,
											Gender,
											Race,
											CountryOfOrigin,
											Ethnicity, 
											Disability,
											CSFP,
											Veteran, 
											HealthInsurance, 
											FamilyStatusType,
											InsuranceType,
											FoodStamps,
											HomeboundDelivery, 
											ModifiedDate, 
											ModifiedBy)
						VALUES				(@PersonID,
											@EducationCategoryID,
											@HousingStatus,
											@NumberInHousehold,
											@Gender, 
											@Race,
											@CountryOfOrigin,
											@Ethnicity,
											@Disability,
											@CSFP,
											@Veteran,
											@HealthInsurance,
											@FamilyStatusType,
											@InsuranceType,
											@FoodStamps,
											@HomeboundDelivery,SYSDATETIME(),@ModifiedBy)
					
					set @NewDemographicsID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = Convert (Nvarchar(20),@@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 Insert Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END




















GO
/****** Object:  StoredProcedure [dbo].[pInsertEducationCategory]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEducationCategory
Description: Inserts data to LUEducationCategory. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertEducationCategory](
	@EducationLevel NVarchar(50),
	@ModifiedBy Name,
	@NewEducationCategoryID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempEducationCategoryID int
	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationLevel = Rtrim(Ltrim(@EducationLevel))
	     				If @TempEducationCategoryID <>0 
							BEGIN
								SET @ErrorStatus = ' -60072 Education Catgory aready exists in LUEducationCategory'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

					IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16,1);
					END
			  INSERT Person.LUEducationCategory(EducationLevel, ModifiedDate,ModifiedBy)
					VALUES (@EducationLevel,SYSDATETIME(),@ModifiedBy)
				
				set @NewEducationCategoryID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60071 Insert Failed Education Category';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertEthnicity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEthnicity
Description: Inserts data to LUEthnicity. 
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertEthnicity](
	@EthnicityAbbreviation NVarchar(10),
	@EthnicityDescription NVarchar(50),
	@ModifiedBy Name,
	@NewEthnicityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
				SELECT @TempEthnicityID = EthnicityID 
				  FROM person.LUEthnicity
					 WHERE EthnicityAbbreviation = Rtrim(Ltrim(@EthnicityAbbreviation)) --Be a bit paranoid and trim the input for white spaces
				If @TempEthnicityID <>0 
					BEGIN
						SET @ErrorStatus = ' -60082 Ethnicity already exists'; --Failed in lookup table
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
						
					END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60080';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  INSERT Person.LUEthnicity(EthnicityAbbreviation,EthnicityDescription, ModifiedDate,ModifiedBy)
					VALUES (@EthnicityAbbreviation,@EthnicityDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewEthnicityID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			    --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60081 Insert Failed Ethnicity';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertFamilyRelationship]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FamilyRelationships
Description: Inserts data to FamilyRelationships. Do not confuse with the sp that inserts to the
family relationship LU table! This stored procedure is not called directly and its superior sps do the validation, so it is left out
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertFamilyRelationship](
	@PersonID int, 
	@ClientPersonID int ,
	@RelationshipID int,
	@RelationshipDescription nVarchar(50)='',
	@ModifiedBy Name, 
	@NewFamilyRelationshipID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/
--This stored procedure is not called directly and its superior sps do the validation, so it is left out
	
	BEGIN TRY
	  BEGIN TRANSACTION;
		
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
			BEGIN
		
			  INSERT Person.FamilyRelationships(PersonId,ClientPersonID,RelationshipID,RelationDescription,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@ClientPersonID,@RelationshipID,@RelationshipDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyRelationshipID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Insert Failed on FamilyRelationships';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pInsertFamilyStatusType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Inserts data to pInsertFamilyStatusType
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertFamilyStatusType](
	@FamilyStatusType Nvarchar(50) ,
	@ModifiedBy Name,
	@NewFamilyStatusTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewFamilyStatusTypeID int
	
	SET @TempNewFamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @NewFamilyStatusTypeID = FamilyStatusTypeID 
			  FROM person.LUFamilyStatusType
			     WHERE FamilyStatusType = Rtrim(Ltrim(@FamilyStatusType)) 
	     			If @TempNewFamilyStatusTypeID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Insurance Type already exists in LUFamilyStatusType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUFamilyStatusType(FamilyStatusType,ModifiedDate,ModifiedBy)
					VALUES (@FamilyStatusType,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyStatusTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUFamilyStatusType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertFoodshelfCertification]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery6.sql|0|0|C:\Users\gSavard.WIN-QGO8QRSVG73\AppData\Local\Temp\3\~vs5A24.sql












/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Foodshelf.Certification, Foodshelf.Signature
Description: Inserts Food Shelf Certifications
Revisions: 28 March 11. Added CertificationTextID as a parameter
1 April 2011 Added Paper Certification Logic
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertFoodshelfCertification](
	@PersonID int,
	@CertificationDate DateTime,
	@Signature NVarchar(MAX),
	@ModifiedBy Name,
	@CertificationTextID int =0,--Default to this because paper certification does not have an id
	@IsPaperCertification bit,
	@PaperCertificationDate DateTime,
	@NewFoodShelfCertificationID int Output,
	@NewSignatureID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonId int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
			
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
										 
					--IF @TempPersonID = 0 OR @TempPersonID IS NULL--Person Does Not Exist, Bail!
					--   BEGIN
					--	SET @Success = 0;
					--	SET @ErrorStatus ='-16005 PersonID cant be null/0';
					--	RAISERROR(@ErrorStatus,16,1);
					--   END        
				
				SELECT @TempPersonID = PersonID 
				  FROM person.Person
					 WHERE PersonID = @PersonID
					 
				IF @TempPersonID = 0 OR @TempPersonID IS NULL
					BEGIN
						SET @Success =0;
						SET @ErrorStatus ='-16008 PersonID does not exist in Person';
						RAISERROR (@ErrorStatus,16,1);
					END
					
				--IF @CertificationTextID =0 OR @CertificationTExtID IS NULL
					--BEGIN
					--	SET @Success =0;
					--	SET @ErrorStatus ='CertificationTextID is mandatory';
					--	RAISERROR (@ErrorStatus, 16, 1)
					--END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END
/*IF this is a paper certification then we will have a CertificationTextID of 0*/
				  INSERT Foodshelf.FoodShelfCertification (PersonID,CertificationTextID,LastCertificationDate,IsPaperCertification,PaperCertificationDate,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@CertificationTextID,@CertificationDate,@IsPaperCertification,@PaperCertificationDate,SYSDATETIME(),@ModifiedBy);
					
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16001 insert Failed FoodShelfCertification';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16, 1);
						END
					
					set @NewFoodshelfCertificationID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus ='';
			--We only call Foodshelf.Signature if this is an electronic certification
			If @IsPaperCertification =0
				Begin	
				 INSERT Foodshelf.Signature (PersonID,FoodShelfCertificationID,Signature,ModifiedDate, ModifiedBy) 
					VALUES (@PersonID,@NewFoodshelfCertificationID,@Signature,SYSDATETIME(),@ModifiedBy);
				END	
					
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16001 insert Failed Signature';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16, 1);
						END	
					SET @NewSignatureID = @@IDENTITY;
					SET @Success =1;
					SET @ErrorStatus ='';
					
				
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-16001 Insert Fail Certification ';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END













GO
/****** Object:  StoredProcedure [dbo].[pInsertFoodTypeGiven]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FoodTypeGiven
Description: Inserts data to FoodTypeGiven. This SP requires PersonID, to be valid on input
in order to capture the appropriate information. ReceivedDate should also be a valid date/time since we need to be able
to return up to 90 days history for each client in reports. This date is not tested since we have to assume
that the record may have been input on paper for some reason, so we cannot use system date to test validity.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertFoodTypeGiven](
	@PersonID int ,
	@ReceivedDate DateTime,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@ModifiedBy Name,
	@NewFoodTypeGivenID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int

	SET @TempPersonID =0;
			
	SET @Success = 0;
	SET @ErrorStatus ='';
/****************************************************************************/

	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --Make sure that we do not have bad data
		  IF (@PersonID = 0) OR (@PersonID IS NULL) 
			BEGIN
				SELECT @ErrorStatus = ' -600011 PersonID/ not valid';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		  
		  --We now have a valid range for each ID, but need to be sure that they exist in the database before trying the insert. We check the PersonProgramServicesUsed
		  --table since that ties the three IDs together. We have to assume that the record has already been insert to this table since this
		  --is a child of that table
			SELECT @TempPersonID = PersonID 
			  FROM person.Person
			     WHERE  PersonID=@PersonID   
	     			
	     			IF (@TempPersonID =0) OR (@TempPersonID IS NULL) 
				    	BEGIN
					     	SET @ErrorStatus = ' -600014 Person record does not exist in Person'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-600010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Foodshelf.FoodTypeGiven(PersonID,ReceivedDate,FoodGiven,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@ReceivedDate,@FoodGiven,SYSDATETIME(),@ModifiedBy)
				
				set @NewFoodTypeGivenID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-600011 Insert Failed on FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 16, 1);
		
		END CATCH
	END
END



GO
/****** Object:  StoredProcedure [dbo].[pInsertHouseholdNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














/*************************************************************************************************
*Author: Gary Savard
*Date: 2 NOV 10
*Table Name: FoodShelf.Household Notes
Description: Inserts data to FoodShelf.HouseHoldNotes table.This table is for the notes associated with the
food shelf intake screens. There are 3 ID fields, the HouseholdNotesID is the identity. ClientPersonID
is the PersonID of the individual on which the note was written. The HouseholdMemberPersonID is optional, and
If this person is not the client, but a household member, this value will be the Client's personID. We 
may not need this field, but it is added for potential future functionality
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertHouseholdNotes](
	@ClientPersonID int,
	@HouseholdMemberPersonID int,
	@Notes Nvarchar(MAX),
	@ModifiedBy Name,
	@NewHouseholdNotesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHouseholdNotesID int,
	@TempClientPersonID int,
	@TempHouseholdMemberPersonID int
	
	SET @TempHouseholdNotesID =0;
	SET @TempClientPersonID = 0;	
	SET @Success = 0;
	SET @ErrorStatus ='';
	



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--Validate both IDs coming in. Only the ClientPersonID is mandatory, so we check the HouseholdMemberPersonID only if it is not
			--0 or NULL
			SELECT @TempClientPersonID = PersonID 
			  FROM person.Person
				 WHERE PersonID = @ClientPersonID
			
			If @TempClientPersonID = 0 or @TempClientPersonID IS NULL
			BEGIN
				SET @ErrorStatus = ' -14032 ClientPersonID does not exist in Person'; --Failed in person table
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				
			END	
		
		--Since this is an optional field, we only check it if it has a value other than 0 or NULL	
		IF @HouseholdMemberPersonID <> 0 AND @HouseholdMemberPersonID IS NOT NULL	
		 BEGIN
			SELECT @TempHouseholdMemberPersonID = @HouseholdMemberPersonID
				FROM Person.Person
					WHERE PersonID = @HouseholdMemberPersonID
		
			IF @TempHouseholdMemberPersonID = 0 OR @TempHouseholdMemberPersonID IS NULL
				BEGIN
					SET @ErrorStatus =' -14016 HouseholdMemberPersonID does not exist, though not NULL/0';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
		 END			
				
		/****************************************************************************/	          

			
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-14000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  INSERT Foodshelf.HouseholdNotes (ClientPersonID, HouseholdMemberPersonID, Notes,ModifiedBy, ModifiedDate)
					Values(@ClientPersonID,@HouseholdMemberPersonID,@Notes,@ModifiedBy,SYSDATETIME());
				
				SET @NewHouseholdNotesID =@@IDENTITY;
				SET @success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -14001' +' Insert Failed HouseholdNotes';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END















GO
/****** Object:  StoredProcedure [dbo].[pInsertHouseholdTransferOptions]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 22 April 11
*Table Name: LUInsertHouseholdTransferOptions
Description: Inserts data to LUInsertHouseholdTransferOptions. This is a free format input so there is
a strong possibility that we will have duplicates, but those should be easily eliminated by the maintenance screens.
Revisions:

**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertHouseholdTransferOptions](
	@ActionToTake Nvarchar(50),
	@ActionToTakeDescription NVarchar(MAX),
	@ModifiedBy Name,
	@NewActionToTakeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempActionToTakeID = HouseholdTransferActionID 
			  FROM dbo.LUHouseholdTransferOptions
				 WHERE ActionToTake = Rtrim(Ltrim(@ActionToTake)) --Be a bit paranoid and trim the input for white spaces
			If @TempActionToTakeID <> 0 --Already Exists
				BEGIN
					SELECT @ErrorStatus = '-7015 Action Already Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16, 1);
	END
	 
			
			  INSERT dbo.LUHouseholdTransferOptions(ActionToTake,ActionToTakeDescription,ModifiedDate, ModifiedBy)
					VALUES (@ActionToTake,@ActionToTakeDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewActionToTakeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertHousingStatus]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUHousingStatus
Description: Inserts data to LUHousingStatus. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertHousingStatus](
	@HousingStatus NVarchar(20),
	@ModifiedBy Name,
	@NewHousingStatusID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

	 
	BEGIN TRY
		BEGIN TRANSACTION;
			/****************************************************************************/

			SELECT @NewHousingStatusID = HousingStatusID 
			  FROM person.LUHousingStatus
				 WHERE HousingStatus = Rtrim(Ltrim(@HousingStatus)) --Be a bit paranoid and trim the input for white spaces
			If @TempHousingStatusID <>0 
				BEGIN
					SET @ErrorStatus = ' -60092 already exists LUHousingStatus'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	

			/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
			
				BEGIN
		
		 			INSERT Person.LUHousingStatus(HousingStatus, ModifiedDate,ModifiedBy)
						VALUES (@HousingStatus,SYSDATETIME(),@ModifiedBy)
				
					set @NewHousingStatusID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus =0;
					COMMIT TRANSACTION;
				END
		
	
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + +'-60021 Insert Failed Housing Status';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
END









GO
/****** Object:  StoredProcedure [dbo].[pInsertIncomeSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Inserts data to LUIncomeSource table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertIncomeSource](
	@IncomeSourceAbbreviation NVarchar(10),
	@IncomeSourceDescription Nvarchar(50),
	@ModifiedBy Name,
	@NewIncomeSourceID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		

/****************************************************************************/
	
		
	BEGIN TRY
	  BEGIN TRANSACTION;
			--the address, so we need to be sure that the data matches an address type before continuing.
		SELECT @TempIncomeSourceID = IncomeSourceID 
		  FROM person.LUIncomeSource
			 WHERE IncomeSourceAbbreviation = Rtrim(Ltrim(@IncomeSourceAbbreviation)) --Be a bit paranoid and trim the input for white spaces
				
				If @TempIncomeSourceID <> 0
				BEGIN
					SET @ErrorStatus = ' -6092 Income Source exists in LUIncomeSource'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
/****************************************************************************/	          

					IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-6090';
						SET @Success = 0;
						RAISERROR (@ErrorStatus,16,1);
					END
	 
		
		
			  INSERT Person.LUIncomeSource(IncomeSourceAbbreviation,IncomeSourceDescription,ModifiedDate, ModifiedBy)
					VALUES (@IncomeSourceAbbreviation, @IncomeSourceDescription, SYSDATETIME(),@ModifiedBy)
				
				set @NewIncomeSourceID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
				--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			 SELECT @ErrorStatus =@ErrorStatus + ' -6091' +' Insert Failed LUIncomeSource';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertInsuranceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUInsuranceType
Description: Inserts data to pInsertInsuranceType
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertInsuranceType](
	@InsuranceType Nvarchar(50) ,
	@ModifiedBy Name,
	@NewInsuranceTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewInsuranceTypeID int
	
	SET @TempNewInsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @NewInsuranceTypeID = InsuranceTypeID 
			  FROM person.LUInsuranceType
			     WHERE InsuranceType = Rtrim(Ltrim(@InsuranceType)) 
	     			If @TempNewInsuranceTypeID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Insurance Type already exists in LUInsuranceType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUInsuranceType(InsuranceType,ModifiedDate,ModifiedBy)
					VALUES (@InsuranceType,SYSDATETIME(),@ModifiedBy)
				
				set @NewInsuranceTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUInsuranceType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertJournalClientFamilyChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/*************************************************************************************************
*Author: Gary Savard
*Date: 25 April 2011
*Table Name: JournalClientFamilyChanges
Description: Inserts data to journal requested changes to a family  member's household. A volunteer doing intake
may find that a household member potentially exists under a different client. The volunteer checks an appropriate box
for investigation, changes. The request is stored here along with the previous and new client's ID, if appropriate since
there may be reason to delete one of the persons involved.

13 July 11 - Temporarily removed check for @PreviousClientID
**************************************************************************************************/



CREATE PROCEDURE [dbo].[pInsertJournalClientFamilyChanges](
	@HouseholdMembersID int , 
	@PreviousClientsID int ,
	@NewClientsID int,
	@ActionTaken nVarchar(50),
	@Notes       nVarchar(MAX),
	@ModifiedBy Name, 
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	
			
--	SET @Success =0;
--	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	BEGIN TRY
	  BEGIN TRANSACTION;
		
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
			--Checking for some things that have to have a value
			IF @HouseholdMembersID =0 OR @HouseholdMembersID IS NULL
				BEGIN
					SELECT @ErrorStatus ='Household Member ID cannot be null or 0';
					SET @Success =0;
					RAISERROR (@Errorstatus,16,1);
				END
			--Do them individually instead of one big IF statement for clarity	
			--IF @PreviousClientsID = 0 or @PreviousClientsID IS NULL
			--	BEGIN
			--		SELECT @ErrorStatus ='PreviousClientsID cannot be null or 0';
			--		SET @Success =0;
			--		RAISERROR(@ErrorSTatus,16,1);
			--	END
-- This could be a delete request so we do not care if @NewClientsID is null or 0
--			

--Must have an action
			IF @ActionTaken IS NULL or @ActionTaken =''
				BEGIN
					SELECT @ErrorStatus ='Action taken must have a value';
					SET @Success =0;
					RAISERROR(@ErrorSTatus,16,1);
				END
				
				
			BEGIN
		
			  --Add the entry
					INSERT dbo.JournalClientFamilyChanges
								(
									HouseholdMembersID,
									PreviousClientsID,
									NewClientsID,
									ActionTaken,
									Notes,
									ModifiedBy,
									ModifiedDate
								)
						VALUES
								(
									@HouseholdMembersID,
									@PreviousClientsID,
									@NewClientsID,
									@ActionTaken,
									@Notes,
									@ModifiedBy,
									SYSDATETIME()
													
								)
								
				
				SET @success =1;
				SET @ErrorStatus ='';
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Insert Failed on JournalClientFamilyChanges';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END

















GO
/****** Object:  StoredProcedure [dbo].[pInsertJournalLookupTableChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












/*************************************************************************************************
*Author: Gary Savard
*Date: 25 April 2011
*Table Name: JournalLookupTableChanges
Description: Inserts data to journal requested changes to Lookup tables.. 
**************************************************************************************************/


CREATE PROCEDURE [dbo].[pInsertJournalLookupTableChanges](
	@LUChangeTable LUTableChanges READONLY,
	@ModifiedBy Name

	)
AS
SET NOCOUNT ON;

BEGIN
DECLARE
@ROWCOUNT int,
@LoopCount int

SET @ROWCOUNT=0;
SET @LoopCount =1;
			
	
	
/****************************************************************************/

	BEGIN TRY
	  BEGIN TRANSACTION;
		--How many records do we process
 		SELECT @ROWCOUNT = (SELECT COUNT(*) FROM @LUChangeTable)
				
			BEGIN
			
						--WHILE  @LoopCount<=@RowCount
						--	BEGIN
							
									
					--Add the entry
					INSERT INTO dbo.JournalLookupTableChanges
								(
									TableName,
									ActionTaken,
									OldValue,
									OldLUTableID,
									NewValue,
									ModifiedBy,
									ModifiedDate
								)
					SELECT t.TableName, t.ActionTaken, t.OldValue,t.OldLUTableID, t.NewValue,@ModifiedBy,SYSDATETIME() from @LUChangeTable as t
						--VALUES
						--		(
						--		    @TableName,
						--			@ActionTaken,
						--			@OldValue,
						--			@OldLUTableID,
						--			@NewValue,
						--			@ModifiedBy,
						--			SYSDATETIME()
						--		)
					--	SET @LoopCount =@LoopCount +1
					--END--End While @Rowcount
								
					
				
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			--Not doing error handling in this sp. Not needed other than rollback		
			
			
		END CATCH
		
	END


















GO
/****** Object:  StoredProcedure [dbo].[pInsertLanguage]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LULanguage
Description: Inserts data to LULangage. This table Contains the most common languages and dialects in the world.Dialects
are comma demlmited. Example: Chinese, Mandarin.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLanguage](
	@LanguageName Nvarchar(50),
	@ModifiedBy Name,
	@NewLanguageID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			--Since some languages are comma delimited by dialect, we will use Soundex to test if the language already exists
			--in the db
			SELECT @TempLanguageID = LanguageID 
			  FROM person.LULanguage
				 WHERE LanguageName = Soundex(Rtrim(Ltrim(@LanguageName))) --Be a bit paranoid and trim the input for white spaces


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				IF @TempLanguageID = 0 --If they don't exist in the database then
					BEGIN
					
						INSERT Person.LULanguage (LanguageName,ModifiedDate, ModifiedBy)
									VALUES (@LanguageName,SYSDATETIME(),@ModifiedBy)
								
								set @NewLanguageID =@@IDENTITY;
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
					END		
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'LULanguage-6061';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertLanguagesSpoken]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LanguagesSpoken
Description: Inserts data to LanguagesSpoken. An individual may speak more than one language so this is assumed to
be one to many. We need to check to ensure the languageID exists in the language lookup table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLanguagesSpoken](
	@LanguageID int,
	@PersonID int,
	@IsPrimaryLanguage bit,
	@ModifiedBy Name,
	@NewLanguagesSpokenID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int,
	@TempPersonID int,
	@TempLanguagesSpokenID int
	
	SET @TempLanguageID =0;
	SET @TempPersonId =0;
	SET @TempLanguagesSpokenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) OR ((@LanguageID =0) OR (@LanguageID IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11005 PersonID/LanguageID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				END
			
			SELECT @TempLanguageID = LanguageID 
			  FROM person.LULanguage
				 WHERE LanguageID = @LanguageID
			
			SELECT @TempPersonID = PersonID
				FROM Person.Person
					Where PersonID = @PersonID
					
			IF @TempLanguageID = 0 OR @TempLanguageID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-11008 LanguageID does not exist in LULanguage';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END		
			IF @TempPersonID = 0 OR @TempPersonID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-11008 PersonID does not exist in Person';
					SET @Success=0;
					RAISERROR(@ErrorStatus,16,1);
				END	

			--Final check to be sure this is not a duplicate
			
			SELECT @TempLanguagesSpokenID = LanguagesSpokenID 
				FROM Person.LanguagesSpoken
					WHERE LanguageID = @LanguageID AND PersonID =@PersonID
			
			IF @TempLanguagesSpokenID <> 0 
				--This already exists! Duplicate Row Error
				BEGIN
					SELECT @ErrorStatus = '-11009 Duplicate Row Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				--If they don't exist in the database then
				
					
						INSERT Person.LanguagesSpoken(LanguageID,PersonID,IsPrimaryLanguage,ModifiedDate, ModifiedBy)
									VALUES (@LanguageID,@PersonID,@IsPrimaryLanguage,SYSDATETIME(),@ModifiedBy)
								
								set @NewLanguagesSpokenID =@@IDENTITY;
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'Languages Spoken -11001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pInsertLUfamilyRelationships]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUFamilyRelationships
Description: Inserts data to LUFamilyRelationships.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLUfamilyRelationships](
	@RelationshipCode Nvarchar(30),
	@RelationshipDescription Nvarchar(50) ='',
	@ModifiedBy Name,
	@NewFamilyRelationshipID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	
	BEGIN TRY
	  BEGIN TRANSACTION;
		 SELECT @TempFamilyRelationshipID = FamilyRelationshipID 
			  FROM person.LUFamilyRelationship
				WHERE RelationshipCode = Rtrim(Ltrim(@RelationshipCode)) 
	     IF @TempFamilyRelationshipID <>0 
				BEGIN
					SET @ErrorStatus = ' -60042 Relationship exists in LUFamilyRelationship'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	IF @TempFamilyRelationshipID = 0 -- Don't really need this with the above raise error, but for clarity.If they don't exist in the database then
		BEGIN
		
			  INSERT Person.LUFamilyRelationship(RelationshipCode,RelationshipDescription,ModifiedDate,ModifiedBy)
					VALUES (@RelationshipCode,@RelationshipDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyRelationshipID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-60041 Insert Failed on LUFamilyRelationship';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertPerson]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Lookup Table Stored Procedure Template. Change XXX in name to the name of the table that will get the insert. This is to be used
*for single table inserts only. 
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Person
Description: Iserts data to Person table
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertPerson](
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = Null,
	@LastName Name,
	@Suffix NVarchar(10) = Null,
	@DateOfBirth DateTime,
	@EmailAddress Nvarchar(50) = Null,
	@EmailContactPreference NoYes =0,
	@ModifiedBy Name,
	@NewPersonID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int;
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	
	 SELECT @TempPersonID = PersonID 
	  FROM person.Person
	     WHERE Firstname = @FirstName AND LastName = @LastName AND
	           DateOfBirth =@DateOfBirth
		IF @TempPersonID <>0
			BEGIN
				SELECT @ErrorStatus =  'Person Already Exists -1017';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-1000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		 
			
			  INSERT Person.Person(Title,FirstName,MiddleName,LastName, Suffix,DateOfBirth, EmailAddress, EmailContactPreference, ModifiedDate, ModifiedBy, IsDeleted)
					VALUES (@Title, @FirstName, @MiddleName,@LastName,@Suffix,@DateOfBirth,@EmailAddress,@EmailContactPreference,SYSDATETIME(),@ModifiedBy, 0)
				
				set @NewPersonID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPersonType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUPersonType
Description: Inserts data to LUPersonType. 
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPersonType](
	@PersonType NVarchar(20),
	@ModifiedBy Name,
	@NewPersonTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Does it already exist? If so, don't insert it.
	SELECT @TempPersonTypeID = PersonTypeID  
	  FROM person.LUPersonType
	     WHERE PersonType = Rtrim(Ltrim(@PersonType)) 

/****************************************************************************/	          
		IF @TempPersonTypeID <> 0
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600007 PersonType already exists';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
		 
		
	
		BEGIN
		
			  INSERT Person.LUPersonType(PersonType,ModifiedDate,ModifiedBy)
					VALUES (@PersonType,SYSDATETIME(),@ModifiedBy)
				
				set @NewPersonTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600001 Insert Failed Person Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertPhone]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Phone
Description: Inserts data to phone table. The row is tied to the person.personid. This Stored proc/table does not directly
access the LUPhoneType table. The type is selected by the user from a dropdown and we just store the ID from the dropdown behind the scenes  
 for simplicity
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPhone](
	@PersonID int,
	@PhoneNumber Phone,
	@PhoneExtension NVarchar(8),
	@PhoneType int,
	@ModifiedBy Name,
	@PhoneID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneID int,
	@TempPersonID int
	
	SET @TempPhoneID =0;
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
    BEGIN TRY
		  BEGIN TRANSACTION;
			IF @PersonID = 0 OR @PersonID IS NULL -- This has to be valid or we bail out!
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = '8008: PersonID must be valid';
						
					RAISERROR(@ErrorStatus,16,1);
				END
				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-8030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

	 	
			  INSERT Person.Phone(PersonID,PhoneNumber,PhoneExtension, PhoneType,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@PhoneNumber,@PhoneExtension, @PhoneType,SYSDATETIME(),@ModifiedBy)
				
				set @PhoneID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				
		  COMMIT TRANSACTION;
			
	END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
				
	  	    SELECT @ErrorStatus= @ErrorStatus + '8001';
		    RAISERROR(@ErrorStatus, 16, 1);
		    SET @Success =0;
			 
			
		END CATCH

		














GO
/****** Object:  StoredProcedure [dbo].[pInsertPhoneType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPhoneType
Description: Inserts Phone Type to the LUPhoneType table.The data in this table could easily become
poor if the user does not take care when inserting phone types. A mis-spelling can cause unintential duplicate
records.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPhoneType](
	@PhoneType int,
	@ModifiedBy Name,
	@NewPhoneTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


		 
BEGIN TRY
  BEGIN TRANSACTION;	
  /****************************************************************************/
	--Check to be sure that the Phone Type doesn't already exist.
	SELECT @TempPhoneTypeID = PhoneTypeID
	  FROM person.LUPhoneType
		 WHERE PhoneType = ltrim(rtrim(@PhoneType))	 
	
	IF @TempPhoneTypeID <> 0
	BEGIN
	SET @ErrorStatus = '-6082' + ' PhoneType exists in LUPhoneType' ; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
       

	IF @@Error <> 0 
		BEGIN
			SET @ErrorStatus = '-6080';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
		END
	   	
	  	  INSERT Person.LUPhoneType(PhoneType,ModifiedDate, ModifiedBy)
				VALUES (@PhoneType, SYSDATETIME(),@ModifiedBy)
				
			set @NewPhoneTypeID =@@IDENTITY;
			set @success =1;
			set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			 
			  SET @ErrorStatus= @Errorstatus + ' -6081' +'Insert Failed on Phone Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  ROLLBACK TRANSACTION;
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPostalCode]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: Address
Description: Inserts Postal Code to the Postal Code table.This requires that the CityID be passed in as a
paramter. It is unlikely that a new city will be build, requiring a new postal code, but it is very likely
that a new postal code will be needed in a city.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPostalCode](
	@CityID int,
	@PostalCode Nvarchar(10),
	@ModifiedBy Name,
	@NewPostalCodeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


		
BEGIN TRY
	BEGIN TRANSACTION;	 
	/****************************************************************************/
	--Check to be sure that the city does exist in the city table before we go on.
	SELECT @TempCityID = CityID
	  FROM person.LUCity
		 WHERE CityID = @CityID
	
	IF @TempCityID = 0
		BEGIN
			SET @ErrorStatus = '-6072' + ' CityID doesnt exist LUCity, cant insert PostalCode' ; --Failed in lookup table
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
			
		END	
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = '-6070';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
		  INSERT Person.LUPostalCode(CityID,PostalCode,ModifiedDate, ModifiedBy)
					VALUES (@CityID, @PostalCode, SYSDATETIME(),@ModifiedBy)
				
				set @NewPostalCodeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus='-6071' +'Insert Failed on PostalCode';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPrograms]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Programs
Description: Inserts data to Programs table. This table creates the one to many relationship between a person and programs. Each person
may use 0 or more programs. If they are not using a program, we will not do an insert to this table.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertPrograms](
	@PersonID int,
	@ProgramID int,
	@ModifiedBy Name,
	@NewProgramsID int output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @TempProgramID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
			
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
			IF (((@PersonID = 0)OR (@PersonID IS NULL)) OR ((@ProgramID =0) OR (@ProgramID IS NULL)))
				BEGIN
					SELECT @ErrorStatus =' -9005 PersonID/ProgramID Cant be 0/NULL';
					SET @Success =0;
					RAISERROR (@ErrorStatus,16,1);
				END
			
			
			--Are these valid ids? 
				SELECT @TempPersonID = PersonID 
				  FROM person.Person
					 WHERE PersonID = @PersonID
					 
				SELECT @TempProgramID = @ProgramID
				  FROM Person.LUProgramType
					  WHERE ProgramTypeID = @ProgramID
					 
				IF @TempPersonID = 0 OR @TempPersonID IS NULL--Cant have these! 
				   BEGIN
					SELECT @ErrorStatus = '-9005 PersonID doesnt exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				   END        
				   
				 IF @TempProgramID = 0 OR @TempProgramID IS NULL 
					BEGIN
						SELECT @ErrorStatus = '-9006 ProgramID doesnt exist';
						SET @Success =0;
						RAISERROR (@ErrorStatus,16,1);
					END  

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -1000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  INSERT Person.Programs(PersonID,ProgramID,ModifiedDate, ModifiedBy)
						VALUES (@PersonID, @ProgramID, SYSDATETIME(),@ModifiedBy)
					
					SET @NewProgramsID = @@IDENTITY;
					SET @success =1;
					SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-9011 Insert Fail Programs';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramServicesUsed]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: ProgramServicesUsed
Description: Inserts data to child of Services.The IDs (PersonID,ProgramID,ProgramServiceID) must all be correct to do an insert.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramServicesUsed](
	@ProgramServiceID int,
	@PersonID int,
	@ProgramID int,
	@ModifiedBy Name,
	@NewProgramServiceUsedID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramServiceID int,
	@TempPersonID int,
	@TempProgramID int
	
	SET @TempProgramServiceID =0;
	SET @TempPersonID =0;
	SET @TempProgramID=0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
         
BEGIN TRY
	  BEGIN TRANSACTION;
	  --All have to be valid
	  IF (@PersonID = 0 OR @PersonID IS NULL) OR (@ProgramID =0 OR @ProgramID IS NULL) OR (@ProgramServiceID = 0 OR @ProgramServiceID IS NULL)
		BEGIN
			SELECT @ErrorStatus ='-10005 PersonId,ProgramID,ProgramServiceID cant be 0/NULL';
			SET @Success =0;
			RAISERROR(@ErrorStatus,16,1);
		END	
			
	--Now check to see that each ID exists in the appropriate table
	
		SELECT @TempPersonID = PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
				
		SELECT @TempProgramID = ProgramTypeID
			FROM Person.LUProgramType
				WHERE ProgramTypeID = @ProgramID
				
		SELECT @TempProgramServiceID = ProgramServiceTypeID
			FROM Person.LUProgramServiceType
				WHERE ProgramServiceTypeID = @ProgramServiceID 
				
	 IF (@TempPersonID = 0 OR @TempPersonID IS NULL) OR (@TempProgramID =0 OR @TempProgramID IS NULL) OR (@TempProgramServiceID = 0 OR @TempProgramServiceID IS NULL)
		BEGIN
			SELECT @ErrorStatus ='-10008 PersonId,ProgramID or ProgramServiceID does not exist';
			SET @Success =0;
			RAISERROR(@ErrorStatus,16,1);
		END	
				
				
					
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	  BEGIN
			  INSERT Person.ProgramServicesUsed(PersonID,ProgramID,ProgramServiceID,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@ProgramID,@ProgramServiceID,SYSDATETIME(),@ModifiedBy)
				
				set @NewProgramServiceUsedID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@@ERROR +@ErrorStatus+ '-10001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramServiceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Inserts data to LUProgramServiceType. This table matches the Program with the service being
used by the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramServiceType](
	@ServiceCode Nvarchar(20),
	@ServiceDescription NVarchar(50),
	@ModifiedBy Name,
	@NewProgramTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/
	
	SELECT @TempProgramServiceTypeID = ProgramServiceTypeID 
	  FROM person.LUProgramServiceType
	     WHERE ServiceCode = Rtrim(Ltrim(@ServiceCode)) --Be a bit paranoid and trim the input for white spaces
	 

/****************************************************************************/	          
BEGIN TRY
	  BEGIN TRANSACTION;
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	IF @TempProgramServiceTypeID = 0 --If they don't exist in the database then
	  BEGIN
		
			  INSERT Person.LUProgramServiceType(ServiceCode,ServiceDescription,ModifiedDate, ModifiedBy)
					VALUES (@ServiceCode,@ServiceDescription,SYSDATETIME(),@ModifiedBy)
				
				set @TempProgramServiceTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@@ERROR +@ErrorStatus+ '-6051';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END










GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Inserts data to LUProgramType. This table matches the Program with the user.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramType](
	@ProgramName Nvarchar(20),
	@ProgramDescription NVarchar(50),
	@ModifiedBy Name,
	@NewProgramTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the address, so we need to be sure that the data matches a program type before continuing.
	SELECT @TempProgramTypeID = ProgramTypeID 
	  FROM person.LUProgramType
	     WHERE ProgramName = Rtrim(Ltrim(@ProgramName)) --Be a bit paranoid and trim the input for white spaces
 

/****************************************************************************/	          
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + ' -6040';
			SET @Success = 0;
		END
		 
		
	IF @TempProgramTypeID = 0 --If they don't exist in the database then
	  BEGIN
		
			  INSERT Person.LUProgramType(ProgramName,ProgramDescription,ModifiedDate, ModifiedBy)
					VALUES (@ProgramName,@ProgramDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewProgramTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
	  END
		
		END TRY

		BEGIN CATCH
		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
			--We only care if the error was not raised by SSE
			IF @@ERROR <> 50000
				BEGIN
					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
				END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus +' -6041 Insert Failed on Program Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertRace]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LURace
Description: Inserts data to LURace. This table matches the Race with a U.S Census race category
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertRace](
	@RaceAbbreviation NVarchar(10),
	@RaceDescription NVarchar(50),
	@ModifiedBy Name,
	@NewRaceID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	          
BEGIN TRY
	BEGIN TRANSACTION;
/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the race, so we need to be sure that the data matches a race type before continuing. Hopefully, the
	--abbreviations will be consistent so that we do not have duplicates. There is no sure way to code this.
	--White, Black(AA or Negro).American Indian or Alaskan native.,Asian Indian,Chinese,Filipino, Other Asian, Japanese,
	--Korean, Vietnamese, Native Hawaiian, Guanamanian or Chamorro, Samoan, Other pacific Islander.
	SELECT @TempRaceID = RaceID 
	  FROM person.LURace
	     WHERE RaceAbbreviation = Rtrim(Ltrim(@RaceAbbreviation)) --Be a bit paranoid and trim the input for white spaces


/****************************************************************************/	
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + '-6020';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
		END
		 
		
	IF @TempRaceID = 0 --If they don't exist in the database then
		BEGIN
		
			  INSERT Person.LURace(RaceAbbreviation,RaceDescription, ModifiedDate,ModifiedBy)
					VALUES (@RaceAbbreviation,@RaceDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewRaceID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6021 Insert Failed Race Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END










GO
/****** Object:  StoredProcedure [dbo].[pInsertSSN]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: SSN.SSN
Description: Inserts data to SSN. Only Certain federal programs require that SSN be captured, so we only want to
use this sparingly.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertSSN](
	@PersonID int,
	@SSN NVarchar(9),
	@ModifiedBy Name,
	@NewSSNID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@TempSSNID int
	
	SET @TempPersonId =0;
	SET @TempSSNID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  SELECT @SSN = ltrim(rtrim(@SSN)); --Get rid of spaces before we begin!
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				BEGIN	
					SELECT @ErrorStatus = '-12005 PersonID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
					
				END
			IF ((LEN(@SSN)<9) OR (@SSN IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11006 Invalid SSN';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				
				END
			
			
			SELECT @TempPersonID = PersonID
				FROM Person.Person
					Where PersonID = @PersonID
					
			
			IF @TempPersonID = 0 OR @TempPersonID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-12008 PersonID does not exist in Person';
					SET @Success=0;
					RAISERROR(@ErrorStatus,16,1);
				END	

			--Final check to be sure this is not a duplicate
			
			SELECT @TempSSNID = SSNID 
				FROM SSN.SSN
					WHERE PersonID = @PersonID AND SSN =@SSN
								
			IF @TempSSNID <> 0 
				--This already exists! Duplicate Row Error
				BEGIN
					SELECT @ErrorStatus = '-12009 Duplicate Row Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				--If they don't exist in the database then
				
					
						INSERT SSN.SSN (PersonID,SSN,ModifiedDate, ModifiedBy)
							VALUES (@PersonID,@SSN,SYSDATETIME(),@ModifiedBy)
								
								SET @NewSSNID =@@IDENTITY;
								SET @success =1;
								SET @ErrorStatus =0;
								
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'SSN -12001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pInsertState]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Inserts data to LUState. This table matches the State with a State ID for ties to County, City and Zip Code.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertState](
	@StateCode Nvarchar(2),
	@Name Nvarchar(50),
	@ModifiedBy Name,
	@NewStateID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	 BEGIN TRANSACTION;
	 /****************************************************************************/
	--This is a bit different than some procedures because we do not want duplicates in the table associated with 
	--the state, so we need to be sure that the data matches a state before continuing.
	SELECT @TempStateID = StateID 
	  FROM person.LUState
	     WHERE StateCode = Rtrim(Ltrim(@StateCode)) --Be a bit paranoid and trim the input for white spaces

/****************************************************************************/	          
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6030';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16, 1);
			END
		IF @TempStateID <>0
			BEGIN
				SELECT @ErrorStatus = 'State Already exists -6037'
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
			  INSERT Person.LUState(StateCode,Name,ModifiedDate, ModifiedBy)
					VALUES (@StateCode,@Name,SYSDATETIME(),@ModifiedBy)
				
				set @NewStateID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
	
			
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus + @@ERROR + '-6031 Insert Failed on State';--6030-6039 is for this table
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertUpdateFoodShelfCertification]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Foodshelf.FoodShelfCertification
Description: Inserts  OR updates data to Foodshelf.FoodShelfCertification. This procedure sets the last date of client
	certification using the passed in PersonID. If the PersonID already exists in the Table, then the 
	SP will update that row to the "LastCertificationDate", Else it will Insert a new row.
	This stored procedure should only be called if the person needs to certify or recertify.
Revisions:28 March 11. GS added CertificationTextID
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertUpdateFoodShelfCertification](
	@PersonID int,
	@LastCertificationDate Date,
	@CertificationTextID int,
	@ModifiedBy Name,
	@NewFoodShelfCertificationID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS

Set NoCount ON;


	DECLARE
	@TempFoodShelfCertificationID int;
	
	SET @TempFoodShelfCertificationID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
         


BEGIN TRY
/****************************************************************************/
	
	SELECT @TempFoodShelfCertificationID = FoodshelfCertificationID
	  FROM Foodshelf.FoodShelfCertification
	     WHERE Foodshelf.FoodShelfCertification.PersonID = @PersonID 

/****************************************************************************/	 
		
	IF @TempFoodShelfCertificationID = 0 --If they don't exist in the database then
	 
	   BEGIN
	  
	 	BEGIN TRANSACTION;
	 				IF @CertificationTextID = 0 or @CertificationTextID IS NULL
	 					BEGIN
	 						SET @Success = 0;
							SET @ErrorStatus ='-16005 CertificationTextID cannot be null/0';
							RAISERROR(@ErrorStatus,16,1);
	 					END
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6040';
							SET @Success = 0;
							RAISERROR (@Errorstatus, 16,1);
						END
			
				INSERT Foodshelf.FoodShelfCertification(PersonID,CertificationTextID,LastCertificationDate,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@CertificationTextID,@LastCertificationDate,SYSDATETIME(),@ModifiedBy)
				
				set @TempFoodShelfCertificationID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			
		  
		END
	ELSE --The person exists so Update to the new certification date and verbiage.	
		BEGIN	
				IF @CertificationTextID = 0 or @CertificationTextID IS NULL
	 					BEGIN
	 						SET @Success = 0;
							SET @ErrorStatus ='-16005 CertificationTextID cannot be null/0';
							RAISERROR(@ErrorStatus,16,1);
	 					END
			
				BEGIN TRANSACTION;
						
					UPDATE Foodshelf.FoodShelfCertification
						SET LastCertificationDate = @LastCertificationDate,
							CertificationTextID = @CertificationTextID
						WHERE PersonID = @PersonID AND FoodShelfCertificationID = @TempFoodShelfCertificationID
				COMMIT TRANSACTION;
		END
	END TRY
	

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus = @ErrorStatus + ' -8001 Insert Fail ProgramSvcType';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH

		
	
















GO
/****** Object:  StoredProcedure [dbo].[pInsertVolSchedDayTime]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-10
-- Description:	Inserts a record into Volunteer.VolunteerScheduleDayTime
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolSchedDayTime]
	-- Add the parameters for the stored procedure here
	@VolSchedWeekID int,
    @DayOfWeek int,
    @AvailBegTime time(7),
    @AvailEndTime time(7),
    @IsNoShow bit,
    @ActualHoursTotal numeric(18,0),
	@VolModifiedBy nvarchar(50),
    @NewDayTimeID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolSchedWeekID = 0 OR @VolSchedWeekID IS NULL
			    BEGIN  --IF @VolSchedWeekID = 0 OR 
				    RAISERROR('VolSchedWeekID cannot be null or 0',16,1);
			    END	--IF @VolSchedWeekID = 0 OR

            -- Check if VolSchedWeekID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleWeek WHERE VolunteerScheduleWeekID = @VolSchedWeekID)
                BEGIN --IF @VolSchedWeekID
                    RAISERROR('VolSchedWeekID does not exist',16,1);
                END --IF @VolSchedWeekID

            -- 
            -- Insert the values
            INSERT INTO Volunteer.VolunteerScheduleDayTime 
                (
                VolunteerScheduleWeekID,
                DayOfWeek,
                AvailableBeginTime,
                AvailableEndTime,
                IsNoShow,
                ActualHoursTotal,
                ModifiedBy
                )
            VALUES 
                (
                @VolSchedWeekID,
                @DayOfWeek,
                @AvailBegTime,
                @AvailEndTime,
                @IsNoShow,
                @ActualHoursTotal,
                @VolModifiedBy
                )
            -- Set the return
            SELECT @NewDayTimeID = SCOPE_IDENTITY()

        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolSchedMonth]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-10
-- Description:	Inserts a record into Volunteer.VolunteerScheduleMonth
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolSchedMonth] 
	-- Add the parameters for the stored procedure here
	@VolPersonID int,
    @Month int,
	@VolModifiedBy nvarchar(50),
    @NewMonthID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolPersonID = 0 OR @VolPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer is active
            IF NOT EXISTS (SELECT * FROM FetchActiveVolunteers() WHERE VolunteerPersonID = @VolPersonID)
                BEGIN --IF @VolPersonID NOT active
                    RAISERROR('VolPersonID is not active',16,1);
                END --IF @VolPersonID NOT active

            -- Insert the values
            INSERT INTO Volunteer.VolunteerScheduleMonth (VolunteerPersonID, Month, ModifiedBy)
            VALUES (@VolPersonID, @Month, @VolModifiedBy)
            -- Set the return
            SELECT @NewMonthID = SCOPE_IDENTITY()

        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolSchedWeek]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-10
-- Description:	Inserts a record into Volunteer.VolunteerScheduleWeek
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolSchedWeek] 
	-- Add the parameters for the stored procedure here
	@VolSchedMonthID int,
    @Week int,
	@VolModifiedBy nvarchar(50),
    @NewWeekID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolSchedMonthID = 0 OR @VolSchedMonthID IS NULL
			    BEGIN  --IF @VolSchedMonthID = 0 OR 
				    RAISERROR('VolSchedMonthID cannot be null or 0',16,1);
			    END	--IF @VolSchedMonthID = 0 OR

            -- Check if volunteer month id exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleMonth WHERE VolunteerScheduleMonthID = @VolSchedMonthID)
                BEGIN --IF @VolSchedMonthID NOT EXISTS
                    RAISERROR('VolSchedMonthID does is not Exist',16,1);
                END --IF @VolSchedMonthID NOT EXISTS

            -- Insert the values
            INSERT INTO Volunteer.VolunteerScheduleWeek (VolunteerScheduleMonthID, Week, ModifiedBy)
            VALUES (@VolSchedMonthID, @Week, @VolModifiedBy)
            -- Set the return
            SELECT @NewWeekID = SCOPE_IDENTITY()

        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
    @VolunteerPersonID int,
    @DepartmentID int=NULL,
	@ContactFirstName Name,
	@ContactLastName Name,
    @ContactDOB datetime,
	@ContactAddress1 NVarchar(50),
	@ContactAddress2 NVarchar(50)=NULL,
	@ContactHomePhone Phone,
	@ContactWorkPhone Phone,
	@ContactCellPhone Phone,
	@ContactPager Nvarchar(20),
	@ContactEmail NVarchar(50),
	@VolunteerTypeID int,
	@IsActive bit,
	@ModifiedBy Name,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 
@MyModifiedDate DATETIME = GETDATE(),
@ErrNo int =0,
@ErrMsg NVarchar(50)='',
@ContactPersonID int;

BEGIN TRY

	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	SET @ContactPersonID = @VolunteerPersonID
		INSERT INTO Volunteer.VolunteerContactInformation(
						VolunteerPersonID,
                        ContactPersonID,
                        DepartmentID,
						ContactFirstName,
						ContactLastName,
                        ContactDOB,
						ContactAddress1,
						ContactAddress2,
						ContactHomePhone,
						ContactCellPhone,
						ContactWorkPhone,
						ContactPager,
                        ContactEmail,
						Volunteertypeid,
						IsActive,
                        ModifiedDate,
						ModifiedBy
                        )
					VALUES(
                        @VolunteerPersonID,
                        @ContactPersonID,
                        @DepartmentID,
                        @ContactFirstName,
                        @ContactLastName,
                        @ContactDOB,
                        @ContactAddress1,
                        @ContactAddress2,
                        @ContactHomePhone,
                        @ContactWorkPhone,
                        @ContactCellPhone,
                        @ContactPager,
                        @ContactEmail,
                        @VolunteerTypeID,
                        @IsActive,
                        @MyModifiedDate,
                        @ModifiedBy
					 )
					 
		SELECT @ErrNo = @@ERROR
			
		IF @ErrNo <>0--<> Error!
			BEGIN
				RAISERROR(@ErrNo,16,0)
			END
		SET @Success =1;
			
		COMMIT TRANSACTION
			
		SELECT @VolunteerPersonID = @@IDENTITY
				

END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			 SET @Success =0;
			  
			 IF RTRIM(LTRIM(@ErrMsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertPersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END





GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerContactInformationOLD]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerContactInformationOLD] 
	-- Add the parameters for the stored procedure here
	@ContactFirstName Name,
	@ContactLastName Name,
	@ContactAddres1 NVarchar(50),
	@ContactAddress2 NVarchar(50)=NULL,
	@ContactHomePhone Phone,
	@ContactWorkPhone Phone,
	@ContactCellPhone Phone,
	@ContactPager Nvarchar(20),
	@ContactEmail NVarchar(50),
	@VolunteerTypeID int,
	@IsActive bit,
	@ModifiedBy Name,
	@VolunteerPersonID int Output,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   	
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		INSERT  Volunteer.ContactInformation(
						VolunteerPersonID,
						ContactFirstName,
						ContactLastName,
						ContactAddress1,
						ContactAddress2,
						ContactEmail,
						ContactHomePhone,
						ContactCellPhone,
						ContactWorkPhone,
						ContactPager,
						Volunteertypeid,
						IsActive,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @ContactFirstName,
					 @ContactLastName,
					 @ContactAddres1,
					 @ContactAddress2,
					 @ContactEmail,
					 @ContactHomePhone,
					 @ContactCellPhone,
					 @ContactWorkPhone,
					 @ContactPager,
					 @VolunteerTypeID,
					 @IsActive,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertPersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END


GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerDepartment]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick
-- Create date: 2020-09-19
-- Description:	Insert Department into Volunteer.VolunteerDepartment
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerDepartment] 
	-- Add the parameters for the stored procedure here
	@DepartmentID int,
    @ParentDepartmentID int,
    @DepartmentDescription nvarchar(100),
    @DeptTableID int OUTPUT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION

        INSERT INTO Volunteer.VolunteerDepartment(
        DepartmentID,
        ParentDepartmentID,
        DepartmentDescription
        )
        VALUES(
        @DepartmentID,
        @ParentDepartmentID,
        @DepartmentDescription
        )

    COMMIT TRANSACTION
    SELECT @DeptTableID = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerEmergencyContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer emergency contact information
-- =============================================
create PROCEDURE [dbo].[pInsertVolunteerEmergencyContactInformation] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@ContactInformation NVARCHAR(MAX),
	@ModifiedBy Name,
	@EmergencyContactInformationID int Output,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END
	
		INSERT  Volunteer.VolunteerEmergencyContact(
						VolunteerPersonID,
						ContactInformation,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @ContactInformation,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertVolEmergencyContactInfo Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerJobs]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-03
-- Description:	Inserts a volunteer job
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerJobs]
	-- Add the parameters for the stored procedure here
	@PersonID INT,
	@JobDescription NVARCHAR(50),
    @ModifiedByName NVARCHAR(50),
    @Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @MyModifiedDate DATETIME = GETDATE(),
        @ErrorMessage NVARCHAR(MAX), 
        @ErrorSeverity INT, 
        @ErrorState INT;

    SET @Success = 0;

    BEGIN TRY
        BEGIN TRANSACTION

            --Check the id exists and isn't null/0
            IF @PersonID = 0 OR @PersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('PersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @PersonID)
                BEGIN --IF @PersonID NOT EXISTS
                    RAISERROR('PersonID does not exists',16,1);
                END --IF @PersonID NOT EXISTS

            -- Seems everything is in order.
            INSERT INTO Volunteer.VolunteerJobs (VolunteerPersonID,Job,ModifiedDate,ModifiedBy)
                VALUES (@PersonID,@JobDescription,@MyModifiedDate,@ModifiedByName)

            SET @Success = 1;
        COMMIT TRANSACTION
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        ROLLBACK TRANSACTION

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

    
END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer Notes
-- =============================================
-- =============================================
-- Modified By:	Richard Stadnick
-- Create date: 03/10/2020
-- Description:	Removed bad parameter, added check to verify VolPeronID exists
-- =============================================
create PROCEDURE [dbo].[pInsertVolunteerNotes] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@Notes NVARCHAR(MAX),
	@ModifiedBy Name,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END

        IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @VolunteerPersonID)
        BEGIN
            SELECT @ErrNo =999999
            SELECT @ErrMsg='That VolunteerPersonID does not exists'
            RAISERROR(@ErrNo,16,1);
        END
	
		INSERT  Volunteer.VolunteerNotes(
						VolunteerPersonID,
						Note,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @Notes,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			 SET @Success =0;
			  
			 IF RTRIM(LTRIM(@ErrMsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertVolNotes Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END


GO
/****** Object:  StoredProcedure [dbo].[pUpdateAddress]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Updates data to Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. We can check to see if an address is a duplicate, but that will have
	limited use since we would have to count on a combination of free-format fields since it is possible to have more than
	one address in the same city, zipcode, state, county, etc.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateAddress](
	@PersonID int =0,--Having a default may seem strange for a mandatory field but it is here only to deal with NULL, if one should occur. 
	@AddressID int =0,--Having a default may seem strange for a mandatory field but it is here only to deal with NULL, if one should occur.
	@AddressLine1 Nvarchar(60),
	@AddressLine2 Nvarchar(60) = NULL,
	@City NVarchar(30),
	@County NVarchar(30),
	@State NVarchar(2),
	@PostalCode NVarchar(10) ,
	@AddressTypeID int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressTypeID int,
	@TempPersonID int,
	@TempAddressID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;		
/*The personID and AddressID must be non-zero because they are needed to update the row. If either is zero, we
exit the update*/
BEGIN TRY
	BEGIN TRANSACTION;
	IF ((@PersonID = 0) OR (@PersonID IS NULL)) OR ((@AddressID =0) OR (@AddressID IS NULL))
		BEGIN
			SET @ErrorStatus = ' -7014. PersonID, AddressID cannot be zero or null for update';
			RAISERROR(@ErrorStatus, 16,1);
		END



/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the address, so we need to be sure that the data matches an address type before continuing.
	SELECT @TempAddressTypeID = AddressTypeID 
	  FROM person.LUAddressType
		 WHERE AddressTypeID = @AddressTypeID --Be a bit paranoid and trim the input for white spaces
	
	If @TempAddressTypeID = 0
	BEGIN
		SET @ErrorStatus = ' -7002 Address Type does not exist in LUAddressType, Cannot Update'; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
	

/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = @@ERROR + '-7000 pUpdateAddress';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
	
			  Update Person.Address
					SET PersonID = @PersonID,
						AddressLine1 = @AddressLine1,
						AddressLine2 =@AddressLine2,
						City = @City,
						State = @State,
						PostalCode = @PostalCode,
						AddressTypeID = @AddressTypeID,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE
						PersonID= @PersonID AND AddressID = @AddressID;
								
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 SELECT @ErrorStatus =@ErrorStatus + ' -7012' +' Update Failed on Address';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateAddressType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Update data to LUAddressType. This table matches the address with an address type
Revisions:
G.S. - 20 Oct 10. Fixed problem with error handler not firing on preliminary lookup.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateAddressType](
	@AddressTypeID int,
	@AddressType Nvarchar(10),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressTypeID = @AddressTypeID 
				 
			If @TempAddressTypeID = 0 --Cant Update if it doesnt exist
				BEGIN
					SELECT @ErrorStatus = '-6015 Address Type Does Not Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16, 1);
				END
	 
			
			 UPDATE Person.LUAddressType
				SET AddressType = @AddressType,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE 
					AddressTypeID =@AddressTypeID;
					
			
				
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Update Failed Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdateCertificationText]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 3/29/2011
*Table Name: LUertificationText
Description: Update data to LUCertificationText.
This updates the LUCertificationText table. The updates should only be done to correct errors and only by an 
ageny designated representative.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCertificationText](
	@CertificationTextID int,
	@CertificationText NVarchar(MAX),
	@GuidelinesText NVarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCertificationTextID int
	
	SET @TempCertificationTextID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@CertificationTextID =0) --Must have a non zero value!
				BEGIN
					SELECT @ErrorStatus =  '-60055 CertificationTextID cannot be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Double check to see that we can find it in the LUCertificationText table before changing things
			SELECT @CertificationTextID = CertificationTextID 
				FROM Foodhself.LUCertificationText
					WHERE CertificationTextID = @CertificationTextID
					
	     		If (@TempCertificationTextID = NULL) OR (@TempCertificationTextID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 CertificationTextID Doesnot Exist in LUCertificationText'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Foodshelf.LUCertificationText
				SET CertificationText = @CertificationText,
					GuidelinesText = @GuidelinesText,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					CertificationTextID = @CertificationTextID 					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Update Failed on CertificationText ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateCity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCity
Description: Update data to LUCity.
The CityID and StateID must not be 0 when passed in. Both are needed to make the tie.
Ideally we would have information on the county as well as the state before we add the city. However, 
we cannot assume that we have a county, so we will have it to default to 0, if no value is entered.
Revisions:
GS 20 Oct fixed failure in error handler due to implicit conversion of @@Error, worked intermittantly 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCity](
	@CityID int,
	@CityName NVarchar(30),
	@CityAbbreviation Nvarchar(30) ='',
	@StateID int,
	@CountyID int = 0,--Default countyID to 0 just in case it comes in later. 
	@PostalCodeID int =0,--Might be Zero..
	@ModifiedBy Name,
	@NewCityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@CityID =0) or (@StateID) = 0 --Must have a state AND city to update!
				BEGIN
					SELECT @ErrorStatus =  '-60055 StateID/CityID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Double check to see that we can find it in the LUCity table before changing things
			SELECT @TempCityID = CityID 
				FROM person.LUCity
					WHERE CityID = @CityID and StateID = @StateID
					
	     		If (@TempCityID = NULL) OR (@TempCityID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 City Doesnt Exist in LUCity'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Person.LUCity
				SET CountyID = @CountyID,
					PostalCodeID = @PostalCodeID,
					CityName = @CityName,
					CityAbbreviation= @CityAbbreviation,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					STATEID = @StateID and CITYID = @CityID--Could just use City ID
					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Update Failed on City ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateClientFamilyRecord]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to update a  family member for a client
-- in the system. It calls several other stored procedures to do updates into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity. A note can either be a new note or an update to an exising one. If it is a new note, then
--the IsNewNoteflag must be passed in with 1 as value.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call
--          13 Dec 10- Added Gender to Update Demographics call
--			1 April 11 - Removed some fields based on Champlain Charity requirements. Added some fields.
--          5 April remove @numberInHousehold, @HomeboundDelivery,@ISPrimaryLanguage,@LanguageId,@Title,@Suffix,@AddressId,@PhoneID 
--			11 July 11, Added RTRIM, LTRIM to client's name
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateClientFamilyRecord] (
	@RecordSource NVarchar(8),
	@FamilyRelationshipID int,--This is how we know whicy person is being updated, we do not want dupes in the system. A person should be in the familyRelationship table 0to1 times
	@PersonID int, --This is the family member that we will be updating
	@ClientPersonID int,--This is the client to whom the family member belongs
    @DemographicsID int,
    @NotesID int =0,
   	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@DateOfBirth DateTime,
	@RelationshipID int,
	@RelationshipDescription NVarchar(50)='',
	@FamilyStatusType NVarchar(50),
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@EducationCategoryID int =0, --Not required for Food shelf
	@CountryOfOrigin nVarchar(70)='', --Not required for food shelf
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@IncomeSourceID int =0,
	@IsNewNote bit=0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewHouseholdNotesID int Output,--This is only used if there is a new note sent in with the record.
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@TempPersonID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewClientNotesID int,
	@TempClientPersonID int,
	@TempFamilyRelationshipID int,
	@TempIncomeSourceCount int,
	@TempIncomeSourceID int,
	
	@DummyNumberInHousehold int, --just place holder with default of 0
	@DummyHomeboundDelivery int,
	@DummyIsPrimaryLanguage bit,
	@DummyLanguageID int,
	@DummyTitle NVarchar(8),
	@DummySuffix NVarchar(10),
	@DummyEmailAddress NVarchar(50),
	@DummyEmailContactPreference bit,
	@DummyAddress1 NVarchar (60),
	@DummyAddress2 NVarchar (60),
	@DummyCity NVarchar (30),
	@DummyState NVarchar(2),
	@DummyPostalCode NVarchar(10),
	@DummyAddressTypeID int,
	@DummyPhoneNumber Phone,
	@DummyPhoneExtension Nvarchar(8),
	@DummyPhoneTypeID int
	
	
			
	
	SET @ValidSource =0;
	SET @TempPersonID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @TempFamilyRelationshipID =0;
	SET @TempIncomeSourceCount =0;
	SET @TempIncomeSourceID =0;
	
	
	SET @DummyNumberInHousehold =0;
	SET @DummyHomeboundDelivery=2;--This is set to N/A
	SET @DummyIsPrimaryLanguage=0;
	SET @DummyLanguageID=0;
	SET @DummyTitle = NULL;
	SET @DummySuffix = NULL;
	SET @DummyEmailAddress =NULL;
	SET @DummyEmailContactPreference =0;
	SET @DummyAddress1 =NULL;
	SET @DummyAddress2 =NULL;
	SET @DummyCity = NULL;
	SET @DummyState =NULL;
	SET @DummyPostalCode =NULL;
	SET @DummyAddressTypeID =0;
	SET @DummyPhoneNumber =NULL;
	SET @DummyPhoneExtension =NULL;
	SET @DummyPhoneTypeID =0;
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-18100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
	
	
	
	--The family member must be associated with a ClientPersonID or we bail.
	
		IF @FamilyRelationshipID =0 OR @FamilyRelationshipID IS NULL--Can't update if this is not valid!
			BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-185002 FamilyRelationshipID cant be 0/NULL';
				RAISERROR (@ErrorStatus,16,1);
			END
		
		SELECT @TempFamilyRelationshipID = FamilyRelationshipID	
			FROM Person.FamilyRelationships
				WHERE FamilyRelationshipID = @FamilyRelationshipID
				
		IF @TempFamilyRelationshipID = 0 OR @TempFamilyRelationshipID IS NULL
			BEGIN
				SET @Success =0
				SET @ErrorStatus ='-185003 Record not found FamilyRelationships';
				RAISERROR (@ErrorStatus,16,1);
				
			END
		IF @PersonID =0 or @PersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-185004 PersonID cant be 0/NULL';
				RAISERROR(@ErrorStatus,16,1);
			END
			
		SELECT @TempPersonID = @PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
		
		IF @TempPersonID = 0 OR @TempPersonID IS NULL
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-185005 Person Doesnt exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			END
	
			IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-18500 Client does not exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			
			END	
			
			SELECT	@TempClientPersonID = PersonID
				FROM Person.Person
					WHERE PersonID = @PersonID
					
			IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-185005 Person Doesnt exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			END
					
					
	
				
	--Update Person.	
	BEGIN
		EXEC DBO.pUpdatePerson @PersonID,@DummyTitle,@FirstName,@MiddleName,@LastName,@DummySuffix,@DateOfBirth,@DummyEmailAddress,@DummyEmailContactPreference,@ModifiedBy,@Succ OUTPUT,@ErrorMsg OUTPUT;
				
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-18200 Sub Pro UpdatePerson Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
		SET @Success =1;
		SET @ErrorStatus='';	
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information. We will consider a NULL or 0 ID in AddressID to mean that this is a Foodshelf
	
	
	--The address should be the same as that of the client, but we will add it anyway because this person
	--may eventually become a client and we will already have an AddressID that we can use and modify the location.

		
		BEGIN
			--Commented out because this needs some thought as we go into alpha testing
			--IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@Address1)) ='') OR (LTRIM(RTRIM(@Address1)) IS NULL) )--This is a problem because address is required
			--	BEGIN
			--		SET @Succ =0;
			--		SET @ErrorStatus ='-18300 Address Required for Non foodshelf intake.';
			--		RAISERROR(@ErrorStatus,16,1);
			--	END
		--The family member is at the same address as the client so we do not put them in the address table. Query them from the family relationship
		--IF ((@AddressID <>0) AND (@AddressID IS NOT NULL))
		-- BEGIN	
		--	EXEC DBO.pUpdateAddress @PersonID,@AddressID,@DummyAddress1,@DummyAddress2,@DummyCity,@DummyCounty,@DummyState,@DummyPostalCode,@DummyAddressTypeID,@ModifiedBy, @Succ Output, @ErrorMsg Output ;	
			
		--	IF @Succ =0 --Failed, Rollback!
		--		BEGIN
		--			SET @Success =0;
		--			SELECT @ErrorStatus = '-18200 Sub proc Update Address returned error' + @ErrorMsg;
		--			RAISERROR (@ErrorSTatus, 16,1);
		--		END
				
		--END

	--This has been removed because Champlain Charity does not collect family member phone numbers
	--Insert Phone Number
	--We allow phone number since they may have a cell.
	--BEGIN
	--	--May need in future
	--	--IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
	--	--	BEGIN
	--	--				SET @Succ =0;
	--	--				SET @ErrorStatus ='-17400 Phone Number Required for Non foodshelf intake.';
	--	--				RAISERROR(@ErrorStatus,16,1);
	--	--	END
			
	--	IF (@PhoneID<>0) AND (@PhoneID IS NOT NULL)
	--		BEGIN
	--			EXEC DBO.pUPdatePhone @PhoneID,@PersonID,@PhoneNumber,@PhoneExtension,@PhoneTypeID,@ModifiedBy, @Succ output, @ErrorMsg output ;
	--		END
			
	--		IF @Succ =0
	--			BEGIN
	--				SET @Success =0;
	--				SELECT @ErrorStatus = '-18200 Sub proc Update Phone returned fail' + @ErrorMsg;
	--				RAISERROR(@ErrorStatus, 16,1);
	--			END
	--END
	
	--Insert Demographics
	BEGIN
		EXEC dbo.pUpdateDemographics @DemographicsID,@PersonID,@EducationCategoryID ,@HousingStatus,@DummyNumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@InsuranceType,@FamilyStatusType,@FoodStamps,@DummyHomeboundDelivery,@ModifiedBy,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus ='-18200 Sub proc Update Demographics returned fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
		
		--Income source may could possibly be ID 0 which would not be updated since that indicates no selection. This will require a sp at some point
		--because there may be >1 income source. For now, we have a 1 to 1 relationship between person and income source. Yup, using a table scan for the
		--aggregate, but this will be chaning with future sp
		IF EXISTS(SELECT * from Person.Income WHERE PersonID=@PersonID) AND (@IncomeSourceID>0)--Assuming that a good IncomeSourceID is passed in.
			BEGIN
				Update Person.Income 
						SET IncomeSourceID = @IncomeSourceID,
							ModifiedBy = @ModifiedBy,
							ModifiedDate = SYSDATETIME()
						WHERE PersonID = @PersonID;
				IF @@ERROR >0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-18200 Sub proc insert income returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END	
			END--End IF
			
		ELSE
			BEGIN
				IF (@IncomeSourceID >0)--Only insert if there is a valid IncomeSourceId coming in --only works if we have 1 to 1 relationship and that is all we have for now
				BEGIN
					INSERT INTO PERSON.Income (IncomeSourceID, PersonID, ModifiedBy, ModifiedDate) VALUES (@IncomeSourceID,@PersonID,@ModifiedBy,SYSDATETIME());
				END
				
			IF @@ERROR >0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-18200 Sub proc insert income returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END	
			END--End else
			
		
		
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		
		IF (@IsNewNote =1) AND LTRIM(RTRIM(@Notes)) <> ''
		BEGIN
			EXEC DBO.pInsertHouseholdNotes @ClientPersonID,@PersonID, @Notes,@ModifiedBy,@NewHouseholdNotesID,@Succ OUTPUT,@ErrorMsg OUTPUT;
			 IF @Succ =0
			 BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-18001 New Note Insert Failed';
				RAISERROR(@ErrorStatus,16,1);
			 END
			 SET @Success =1;
			 SET @ErrorStatus ='';
		
		END
		
		IF (@IsNewNote = 0) AND (@NotesID)<>0 AND @NotesID IS NOT NULL
			BEGIN
				EXEC DBO.pUpdateHouseholdNotes @NotesID,@ClientPersonID,@PersonID,@Notes,@ModifiedBy,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-18200 Update Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END
			
			END
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pUpdateFamilyRelationship @FamilyRelationshipID,@PersonID, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy,  @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	
		
			
	

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
			SET @Success =1;
			SET @ErrorStatus='';
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	















GO
/****** Object:  StoredProcedure [dbo].[pUpdateClientRecord]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to Update a new client
-- into the system. It calls several other stored procedures to do Updates into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--When updating we have to make some assumptions for food shelf.IF the client is in and their address has changed,
--we have to assume that the input FoodTypeGiven is for the current visit, so we do not update that. Instead, we insert a new
--row for the current visit.
--@RecordSource can be FOOD,WX,MICRO,TENANT,COMMACT,ADMIN. This will be used to only execute parts of the 
--SP relevant to the client intake data brought in. For example, Foodshelf requires that a record be 
--set for the type of food taken, but this is not required elsewhere so we only execute that SP If things come from 
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 
--4 April 2011. Added multiple addresses, FamilyStatusType, Insurance Type,Changed AddressTypeID to int
--19 April 2011 - Addes @IsUpdateBreadGroceries. If this is 1 then that SP is executed.
--19 July 2011- Added RTRIM, LTRIM to client name.
CREATE PROCEDURE [dbo].[pUpdateClientRecord] (
	@PersonID int,
	@HouseHoldPersonID int =0,--This will be null or zero on input if this is a client and not a family member
	@PhysicalAddressID int,
	@MailAddressID int,
	@DemographicsID int,
	@PhoneID1 int,
	@PhoneID2 int,	
	@RecordSource NVarchar (8), --This allows for the sub sp's to be executed or skipped based on what data is to be saved
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@Gender NVarchar(2) = NULL,
	@DateOfBirth DateTime,
	@PhysicalAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@PhysicalAddress2 NVarchar(60) = NULL,
	@PhysicalCity	NVarchar(30),
	@PhysicalCounty NVarchar(30) = NULL,
	@PhysicalState NVarchar(2),
	@PhysicalPostalCode NVarchar(10),
	@PhysicalAddressTypeID  int,--From the Lookup based on user input. May not need if Foodshelf
	@MailAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@MailAddress2 NVarchar(60) = NULL,
	@MailCity	NVarchar(30),
	@MailCounty NVarchar(30) = NULL,
	@MailState NVarchar(2),
	@MailPostalCode NVarchar(10),
	@MailAddressTypeID  int,
	@EmailAddress Nvarchar(50) = NULL,
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --Food shelf again!
	@PhoneNumber2 Phone ='',
	@PhoneExtension2 Nvarchar(8) ='',
	@PhoneTypeID2	 int =0,
	@FamilyStatusType NVarchar(50),
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =0, 
	@CountryOfOrigin nVarchar(70)='', 
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@NumberInHousehold int,
	@IncomeSourceID int =0,
	@HouseholdNotesID int=0, --Necessary if this is an existing note. Default to 0 if new note to avoid NULLs
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@IsNewNote bit,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@FoodReceivedDate DateTime,
	@IsUpdateBreadGroceries int,--Only if the client came in for these items
	@ModifiedBy Name,
	@NewPhysicalAddressID int Output,
	@NewMailAddressID int Output,
	@NewPhoneID int Output,
	@NewPhoneID2 int Output,
	@NewHouseholdNotesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@CheckPersonID int,
	@CheckAddressID int,
	@CheckPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@CheckDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int -- We don't do anything with this. Just receives SP output for now.
	
	SET @ValidSource =0;
	SET @CheckPersonID =0;
	SET @CheckAddressID =0;
	SET @CheckPhoneID = 0;
	SET @CheckDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @Succ =0;	
	SET @Success =1;
	SET @ErrorMsg ='';
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
	
BEGIN		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-13100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
		
	--Check to see if the person is in the DB. IF not, we are going to bail!
	BEGIN
		SELECT @CheckPersonID = PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
		IF @CheckPersonID = 0 OR @CheckPersonID IS NULL -- Not Good! Bail out!
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-1005 PersonId cant be 0/Null';
				RAISERROR(@ErrorStatus,16,1);
			END
					
		EXEC DBO.pUpdatePerson @PersonID,@Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@Succ Output, @ErrorMsg Output;
		
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-13200 Sub Pro update person Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	

		--The record we are updating may have been originally from FoodShelf so we may not have an address. If the AddressID is 0
		--and the @address1 is not blank, we will insert an address. If We have an AddressID that is > 0, we will continue with 
		--an update and not an insert.
		IF  (@PhysicalAddressID = 0 OR @PhysicalAddressID IS NULL) AND ((LTRIM(RTRIM(@PhysicalAddress1)) <> '') AND (@PhysicalAddress1 IS NOT NULL))
		 BEGIN	
			EXEC DBO.pInsertAddress @PersonID, @PhysicalAddress1,@PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCode,@PhysicalAddressTypeID,@ModifiedBy, @NewPhysicalAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Insert PhysAddress returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			
		END
			
	   ELSE IF @PhysicalAddressID >0 --Slam the record in if it exists.
	          BEGIN
					SELECT @CheckAddressID = AddressID
						FROM Person.Address
							WHERE
								AddressID = @PhysicalAddressID
								
					IF @CheckAddressID = 0 OR @CheckAddressID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-7014 Invalid PhysicalAddressID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END			
								
								
				EXEC DBO.pUpdateAddress @PersonId, @PhysicalAddressID, @PhysicalAddress1, @PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCode,@PhysicalAddressTypeID,@ModifiedBy,@Succ output,@ErrorMsg output;
			
				IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Update PhysAddress returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			END
	--One more time through this logic for mailing address
		IF  (@MailAddressID = 0 OR @MailAddressID IS NULL) AND ((LTRIM(RTRIM(@MailAddress1)) <> '') AND (@MailAddress1 IS NOT NULL))
		 BEGIN	
			EXEC DBO.pInsertAddress @PersonID, @MailAddress1,@MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCode,@MailAddressTypeID,@ModifiedBy, @NewMailAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Insert Address returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			
		END
			
	   ELSE IF @MailAddressID >0 --Slam the record in if it exists.
	          BEGIN
					SELECT @CheckAddressID = AddressID
						FROM Person.Address
							WHERE
								AddressID = @MailAddressID
								
					IF @CheckAddressID = 0 OR @CheckAddressID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-7014 Invalid MailAddressID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END			
								
								
				EXEC DBO.pUpdateAddress @PersonId, @MailAddressID, @MailAddress1, @MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCode,@MailAddressTypeID,@ModifiedBy,@Succ output,@ErrorMsg output;
			
				IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Update Address returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			END

	--Insert or update Phone Number same rules as for Address
		IF @PhoneID1 = 0 OR @PhoneID1 IS NULL AND (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @PersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			
			  IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc InsertPhone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
				
			
			END
		ELSE IF @PhoneID1 >0
		  BEGIN
			SELECT @CheckPhoneID = PhoneID	
				From Person.Phone
					WHERE 
						PhoneID = @PhoneID1
			 IF @CheckPhoneID = 0 OR @CheckPhoneID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-8008 Invalid PhoneID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END
						
			BEGIN
				EXEC DBO.pUpdatePhone @PhoneID1,@PersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@Succ output, @ErrorMsg output;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc updatephone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 END
	--One more time for second phone
	SET @CheckPhoneID =0;--Reset to use again
	IF @PhoneID2 = 0 OR @PhoneID2 IS NULL AND (LTRIM(RTRIM(@PhoneNumber2))<>'' AND @PhoneNumber2 IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @PersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@NewPhoneID2 output, @Succ output, @ErrorMsg output ;
			
			  IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc InsertPhone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
						
			END
		ELSE IF @PhoneID2 >0
		  BEGIN
			SELECT @CheckPhoneID = PhoneID	
				From Person.Phone
					WHERE 
						PhoneID = @PhoneID2
			 IF @CheckPhoneID = 0 OR @CheckPhoneID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-8008 Invalid PhoneID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END
						
			BEGIN
				EXEC DBO.pUpdatePhone @PhoneID2,@PersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@Succ output, @ErrorMsg output;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc updatephone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 END	 

	
	--Update Demographics... Everyone needs demographics in the basic record, so no problems here with inserts.
	BEGIN
		SELECT @CheckDemographicsID = DemographicsID	
			FROM Person.Demographics
				WHERE
					DemographicsID = @DemographicsID
				IF @DemographicsID = 0 OR @DemographicsID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-2021 Invalid DemographicsID update failed';
						RAISERROR(@ErrorStatus,16,1);
				 END
		EXEC dbo.pUpdateDemographics @DemographicsID, @PersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@InsuranceType,@FamilyStatusType,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus = '-2021 sub proc Update Demographics fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
	--Check Income Source, If we find that this source  is any value, including zero we update. This will have to be modified in the future
	--to cope with multiple values on input. Question, If someone has multiple income sources on one visit and then selects only 1 on the next, does that mean that the others are gone?
		IF @IncomeSourceID <>0
			BEGIN
				UPDATE Person.Income SET 
						IncomeSourceID = @IncomeSourceID, 
						ModifiedBy = @ModifiedBy,
						ModifiedDate = SYSDATETIME()
						WHERE PersonID = @PersonID
								
			END 	
		
	--This is where we check household notes input to see if it is a new note or an update to an existing one.
		IF @HouseholdNotesID = 0 AND @IsNewNote =0 AND LTRIM(RTRIM(@Notes)) <>''--We have a problem! No such thing as an old note with 0 ID! Bail out!
			BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-14008 HouseoldNoteID cant be 0 for update';
				RAISERROR(@ErrorStatus,16,1); 
			END
			
	
		IF (@IsNewNote =0 AND @HouseholdNotesID <> 0)--Update! We will assume that even a blank note is an update. Don't want to second guess the user!
			BEGIN
				EXEC dbo.pUpdateHouseholdNotes @HouseholdNotesID,@PersonID,@HouseHoldPersonID, @Notes,@ModifiedBy,@Success,@ErrorStatus;
					IF @Success =0
						BEGIN
							SET @Success =0; --redundant :)
							SET @ErrorStatus = @ErrorStatus + ' -1350 Update Client Record Failed';
							RAISERROR (@ErrorStatus,16,1);
						END 
			END
		ELSE IF LTRIM(RTRIM(@Notes)) <> '' -- Insert New Record
			BEGIN
				EXEC dbo.pInsertHouseholdNotes @PersonID,@HouseHoldPersonID,@Notes,@ModifiedBy,@NewHouseholdNotesID,@Success,@ErrorStatus;
					IF @Success =0
						BEGIN
							SET @Success =0;--Redundant
							SET @ErrorStatus = @ErrorStatus + ' -14001 Insert HouseholdNotes Failed';
							RAISERROR(@ErrorStatus,16,1);
						END
			END
			
		
		
	--This is the same as the pInsertClientRecord procedure
	--IF source is foodshelf, we need to capture whether they were in for bread/produce or groceries 
	
	IF @RecordSource ='FOOD' AND @IsUpdateBreadGroceries =1 --This is not just an update, but a foodshelf update so we make this call.
		BEGIN
			EXEC DBO.pInsertFoodTypeGiven @PersonID,@FoodReceivedDate,@FoodGiven,@ModifiedBy,@NewFoodTypeGivenID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT;
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-600021 Insert FoodType fail' + @ErrorMsg;
					RAISERROR (@ErrorStatus,16,1);
				END	
	END
		

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
		SET @Success =1;
		SET @ErrorStatus='';
	
			COMMIT TRANSACTION;
		END

END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

    
   END
    
	










GO
/****** Object:  StoredProcedure [dbo].[pUpdateContactType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUContactType
Description: Update data to LUContactType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateContactType](
	@ContactTypeID int,
	@Name Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewContactID int
	
	SET @TempNewContactID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@ContactTypeID = 0) OR (@ContactTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 Contact Type already exists in LUContactType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewContactID = ContactTypeID 
			  FROM person.LUContactType
			     WHERE ContactTypeID = @ContactTypeID
			      
	     	IF @TempNewContactID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 Contact Type doesnt exist in LUContactType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUContactType
			     SET  Name = @Name,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE ContactTypeID = @ContactTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUContactType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateCountryOfOrigin]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCountryOfOrigin
Description: Updates data to LUCountryOfOrigin.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCountryOfOrigin](
	@CountryID int,
	@CountryAbbreviation Nvarchar(30) ='',
	@CountryName Nvarchar(50),
	@FIPSCode NVarchar(2)='',
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewCountryID int
	
	SET @TempNewCountryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	 
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		   IF (@CountryID = 0) OR (@CountryID IS NULL)
			 BEGIN
				SET @ErrorStatus = ' -60035 CountryID Cant be 0/NULL'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			 END
		  
		    SELECT @TempNewCountryID = CountryID 
			  FROM person.LUCountryOfOrigin
				 WHERE CountryID = @CountryID
				 
	     	IF @TempNewCountryID =0 
				BEGIN
					SET @ErrorStatus = ' -60038 Country doesnt exists in LUCountryOfOrigin'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
							
				END	
 
/****************************************************************************/	          

					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = @@ERROR + '-60030';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16,1);
						END
						
				 UPDATE Person.LUCountryOfOrigin
					SET CountryAbbreviation = @CountryAbbreviation,
						CountryName = @CountryName,
						FIPSCode = @FIPSCode,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE CountryID = @CountryID
					
					
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60031 Update Failed Rollback';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		END













GO
/****** Object:  StoredProcedure [dbo].[pUpdateCounty]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCounty
Description: UPdates data to LUCounty. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCounty](
	@CountyID int,
	@CountyName NVarchar(20),
	@StateID int,
	@CityID int = 0,--Default cityID to 0 just in case it comes in later. 
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCountyID int
	
	SET @TempCountyID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --The county must be tied to a state so we need to have non 0's and non-nulls in both. If one
		  --is found and not the other, it is an orphaned record. This error could be made more granular
		  --in the future, if we are concerned with orphaned records.
		  IF ((@CountyID = 0) or (@CountyID  IS NULL)) OR ((@StateID = 0) OR (@StateID IS NULL)) 
			
				BEGIN
					SELECT @ErrorStatus = '-60065 StateID/CountyID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
				--Check to see if the number passed in is really in the table
				SELECT @TempCountyID = CountyID 
				  FROM person.LUCounty
					 WHERE CountyID = @CountyID and StateID = @StateID
	     				If (@TempCountyID =0) OR (@TempCountyID IS NULL) 
							BEGIN
								SET @ErrorStatus = ' -60068 County Does not exist LUCounty'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  UPDATE Person.LUCounty
				  SET CityID = @CityID,
					  CountyName = @CountyName, 
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
					
				
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY
	

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60061 Update Failed LUCounty ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
	END
		
	













GO
/****** Object:  StoredProcedure [dbo].[pUpdateDemographics]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Updates data to Demographics table
Revisions: 1 Nov 10. Modified to include housing status as nvarchar(50)
			1 April 11. Added @InsuranceType and @FamilyStatusType
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateDemographics](
	@DemographicsID int,
	@PersonID int,
	@EducationCategoryID int,
	@HousingStatus NVarchar(50) = NULL,
	@NumberInHousehold int,
	@Gender NVarchar(2) = NULL,
	@Race Nvarchar(20) = NULL,
	@CountryOfOrigin NVarchar(70) =NULL,
	@Ethnicity Nvarchar(20) = Null,
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FamilyStatusType Nvarchar(50),
	@FoodStamps NoYesMaybe =0,
	@HomeboundDelivery NoYesMaybe =0,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempDemographicsID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@DemographicsID = 0) OR (@DemographicsID IS NULL)) OR  ((@PersonID = 0) OR (@PersonID IS NULL))
				  BEGIN
					SELECT @ErrorStatus = '2005 DemographicsID/PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--Check to see that the IDs match.. paranoid? NO! Have had worse things happen....Data integrity can fail!
				--Could use count but that has some optimization and indexing problems....
				SELECT @TempPersonID = PersonID, @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID AND DemographicsID = @DemographicsID
			
								 
				IF ((@TempDemographicsID=0) OR (@TempDemographicsID IS NULL)) OR ((@TempPersonID =0) OR (@TempPersonID IS NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -2008 DemographicsID/PersonID combo does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  UPDATE Person.Demographics
					 SET EducationCategoryID = @EducationCategoryID,
						 NumberInHousehold = @NumberInHousehold,
						 Gender = @Gender,
						 Race = @Race,
						 CountryOfOrigin = @CountryOfOrigin,
						 HousingStatus = @HousingStatus,
						 Ethnicity = @Ethnicity,
						 Disability = @Disability,
						 CSFP = @CSFP,
						 Veteran = @Veteran,
						 HealthInsurance = @HealthInsurance,
						 FamilyStatusType = @FamilyStatusType,
						 InsuranceType = @InsuranceType,
						 FoodStamps = @FoodStamps,
						 HomeboundDelivery = @HomeboundDelivery,
						 ModifiedDate = SYSDATETIME(),
						 ModifiedBy = @ModifiedBy
					 WHERE DemographicsID = @DemographicsID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 Update Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END

















GO
/****** Object:  StoredProcedure [dbo].[pUpdateEthnicity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEthnicity
Description: Update data to LUEthnicity. 
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateEthnicity](
	@EthnicityID int,
	@EthnicityAbbreviation NVarchar(10),
	@EthnicityDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@EthnicityID = 0) OR (@EthnicityID IS NULL)
				BEGIN
					SET @ErrorStatus = ' -60065 EthnicityID Cant be 0/NULL'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				END 
				
				SELECT @TempEthnicityID = EthnicityID 
				  FROM person.LUEthnicity
					 WHERE EthnicityID =@EthnicityID 
					 
				If @TempEthnicityID =0 --Double check to see if ID exists in db.
					BEGIN
						SET @ErrorStatus = ' -60082 Ethnicity already exists'; --Failed in lookup table
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
						
					END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60080';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			 UPDATE Person.LUEthnicity
				SET EthnicityAbbreviation = @EthnicityAbbreviation,
					EthnicityDescription = @EthnicityDescription,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE
					EthnicityID= @EthnicityID
					
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			    --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60081 Update Failed Ethnicity';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateFamilyRelationship]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FamilyRelationships
Description: Updates data to FamilyRelationships. Do not confuse with the sp that inserts to the
family relationship LU table! This stored procedure is not called directly and its superior sps do the validation, so it is left out
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFamilyRelationship](
	@FamilyRelationshipID int,
	@PersonID int, 
	@ClientPersonID int ,
	@RelationshipID int,
	@RelationshipDescription nVarchar(50)='',
	@ModifiedBy Name, 
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/
--This stored procedure is not called directly and its superior sps do the validation, so it is left out
	
	BEGIN TRY
	  BEGIN TRANSACTION;
		
		IF @FamilyRelationshipID = 0 OR @FamilyRelationshipID IS NULL
		  BEGIN
			SELECT @ErrorStatus =  '-17501 FamilyRelationshipID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
		  END
 
		IF @PersonID =0 OR @PersonID IS NULL
	      BEGIN
			SELECT @ErrorStatus =  '-17503 PersonID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
	      END
	      
	     IF @ClientPersonID =0 OR @ClientPersonID IS NULL 
		   BEGIN
			SELECT @ErrorStatus =  '-17500 PersonID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
	       END
		
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-17540 Update Failed';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
			BEGIN
		
				UPDATE Person.FamilyRelationships
					SET RelationshipID = @RelationshipID,
						RelationDescription =@RelationshipDescription,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE FamilyRelationshipID = @FamilyRelationshipID;
					
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-17540 Update Failed';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
				
				SET @Success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Update Failed on FamilyRelationships';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pUpdateFamilyStatusType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 15 March 11
*Table Name: LUFamilySTatusType
Description: Update data to LUFamilySTatusType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFamilyStatusType](
	@FamilyStatusTypeID int,
	@FamilySTatusType Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewFamilyStatusTypeID int
	
	SET @TempNewFamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 FamilyStatusType already exists in LUFamilyStatusType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewFamilyStatusTypeID = FamilyStatusTypeID 
			  FROM person.LUFamilyStatusType
			     WHERE FamilyStatusTypeID = FamilyStatusTypeID
			      
	     	IF @TempNewFamilyStatusTypeID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 FamilyStatusType doesnt exist in LUFamilyStatusType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUFamilyStatusType
			     SET FamilyStatusType = @FamilyStatusType,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUFamilyStatusType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateFoodTypeGiven]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FoodTypeGiven
Description: Update data to FoodTypeGiven. This SP requires PersonID, to be valid on input
in order to capture the appropriate information. ReceivedDate should also be a valid date/time since we need to be able
to return up to 90 days history for each client in reports. This date is not tested since we have to assume
that the record may have been input on paper for some reason, so we cannot use system date to test validity.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFoodTypeGiven](
	@FoodTypeGivenID int,
	@PersonID int ,
	@ReceivedDate DateTime,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@ModifiedBy Name,
	@NewFoodTypeGivenID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFoodTypeGivenID int

	
	SET @TempFoodTypeGivenID =0;
			
	SET @Success = 0;
	SET @ErrorStatus ='';
/****************************************************************************/

	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --Make sure that we do not have bad data
		  IF ((@FoodTypeGivenID=0) OR (@FoodTypeGivenID IS NULL)) OR((@PersonID = 0) OR (@PersonID IS NULL))
			BEGIN
				SELECT @ErrorStatus = ' -600011 @FoodTypeGivenID/PersonID/ProgramID/ServiceId not valid';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		  
		  --We now have a valid range for each ID, but need to be sure that they exist in the database before trying the Update. 
			SELECT @TempFoodTypeGivenID =  FoodTypeGivenID
			  FROM Foodshelf.FoodTypeGiven
			     WHERE  FoodTypeGivenID = @FoodTypeGivenID AND PersonID = @PersonID 
	     		  --The above could use just @FoodTypeGiven in the WHERE clause, but this is just more validation.	
	     			IF @TempFoodTypeGivenID =0 
				    	BEGIN
					     	SET @ErrorStatus = ' -600008 Record does not exist'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-600010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			UPDATE Foodshelf.FoodTypeGiven
			   SET PersonID = @PersonID,
				   ReceivedDate = @ReceivedDate,
				   FoodGiven = @FoodGiven,
				   ModifiedDate = SYSDATETIME(),
				   ModifiedBy = @ModifiedBy
				WHERE FoodTypeGivenID = @FoodTypeGivenID
				   
					
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-600011 Insert Failed on FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 16, 1);
		
		END CATCH
	END
END



GO
/****** Object:  StoredProcedure [dbo].[pUpdateHouseholdNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













/*************************************************************************************************
*Author: Gary Savard
*Date: 2 NOV 10
*Table Name: FoodShelf.Household Notes
Description: Updates data to FoodShelf.HouseHoldNotes table.This table is for the notes associated with the
food shelf intake screens. There are 3 ID fields, the HouseholdNotesID is the identity. ClientPersonID
is the PersonID of the individual on which the note was written. The HouseholdMemberPersonID is optional, and
If this person is not the client, but a household member, this value will be the Client's personID. We 
may not need this field, but it is added for potential future functionality
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateHouseholdNotes](
	@HouseholdNotesID int,
	@ClientPersonID int,
	@HouseholdMemberPersonID int,
	@Notes Nvarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHouseholdNotesID int,
	@TempClientPersonID int,
	@TempHouseholdMemberPersonID int
	
	SET @TempHouseholdNotesID =0;
	SET @TempClientPersonID = 0;	
	SET @Success = 0;
	SET @ErrorStatus ='';
	



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--Validate  IDs coming in. Only the HouseholdNotesID and ClientPersonID are mandatory, 
			
			SELECT @TempHouseholdNotesID = @HouseholdNotesID
				FROM Foodshelf.HouseholdNotes	
					WHERE HouseholdNotesID = @HouseholdNotesID
			
			IF @TempHouseholdNotesID = 0 OR @TempHouseholdNotesID IS NULL
				BEGIN
					SET @ErrorStatus ='-14008 Record does not exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				END		
			
			SELECT @TempClientPersonID = PersonID 
			  FROM person.Person
				 WHERE PersonID = @ClientPersonID
			
			If @TempClientPersonID = 0 or @TempClientPersonID IS NULL
			BEGIN
				SET @ErrorStatus = ' -14008 ClientPersonID does not exist in Person'; --Failed in person table
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				
			END	
		
		--Since this is an optional field, we only check it if it has a value other than 0 or NULL	
		IF @HouseholdMemberPersonID <> 0 AND @HouseholdMemberPersonID IS NOT NULL	
		 BEGIN
			SELECT @TempHouseholdMemberPersonID = @HouseholdMemberPersonID
				FROM Person.Person
					WHERE PersonID = @HouseholdMemberPersonID
		
			IF @TempHouseholdMemberPersonID = 0 OR @TempHouseholdMemberPersonID IS NULL
				BEGIN
					SET @ErrorStatus =' -14016 HouseholdMemberPersonID does not exist, though not NULL/0';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END			
		END
		/****************************************************************************/	          

			
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-14000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  UPDATE Foodshelf.HouseholdNotes 
				 SET ClientPersonID = @ClientPersonID, 
					 HouseholdMemberPersonID = @HouseholdMemberPersonID, 
					 Notes = @Notes,
					 ModifiedBy = @ModifiedBy, 
					 ModifiedDate = SYSDATETIME()
				 WHERE HouseholdNotesID = @HouseholdNotesID  --Don't bother with other Ids here since this is the identity for the row.
				
				
				SET @success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -14000' +' Update Failed HouseholdNotes';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END














GO
/****** Object:  StoredProcedure [dbo].[pUpdateHousingStatus]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUHousingStatus
Description: Updates data to LUHousingStatus. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateHousingStatus](
	@HousingStatusID int,
	@HousingStatus NVarchar(20),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

	 
	BEGIN TRY
		BEGIN TRANSACTION;
			/****************************************************************************/

			SELECT @TempHousingStatusID = HousingStatusID 
			  FROM person.LUHousingStatus
				 WHERE HousingStatusID = @HousingStatusID
				 
			If (@TempHousingStatusID =0) OR (@TempHousingStatusID IS NULL) 
				BEGIN
					SET @ErrorStatus = ' -60098 Does not exist in LUHousingStatus'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	

			/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
			
				BEGIN
		
		 			UPDATE Person.LUHousingStatus
		 				SET HousingStatus = @HousingStatus,
		 					ModifiedDate = SYSDATETIME(),
		 					ModifiedBy = @ModifiedBy
						WHERE
							HousingStatusID = @HousingStatusID
				
					
					set @success =1;
					set @ErrorStatus =0;
					COMMIT TRANSACTION;
				END
		
	
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + +'-60021 Insert Failed Housing Status';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateIncomeSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Update data to LUIncomeSource table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateIncomeSource](
	@IncomeSourceID int,
	@IncomeSourceAbbreviation NVarchar(10),
	@IncomeSourceDescription Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		


	
	BEGIN TRY
			BEGIN TRANSACTION;
			/****************************************************************************/
	
		--the address, so we need to be sure that the data matches an address type before continuing.
	SELECT @TempIncomeSourceID = IncomeSourceID 
	  FROM person.LUIncomeSource
		 WHERE IncomeSourceID = @IncomeSourceID 
			
				IF (@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)
				  BEGIN
				    SET @ErrorStatus = ' -6095 Income Source exists in LUIncomeSource'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				END
			
				IF @TempIncomeSourceID = 0
				   BEGIN
					 SET @ErrorStatus = ' -6098 Income Source  doesnt exist LUIncomeSource'; --Failed in lookup table
					 RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	 
/****************************************************************************/	          

				IF @@Error <> 0 
				   BEGIN
						SELECT @ErrorStatus = @@ERROR + '-6090';
						SET @Success = 0;
						RAISERROR (@ErrorStatus,16,1);
				    END
	 
		
		
			  UPDATE Person.LUIncomeSource
				 SET IncomeSourceAbbreviation = @IncomeSourceAbbreviation,
				     IncomeSourceDescription = @IncomeSourceDescription,
				     ModifiedDate = SYSDATETIME(), 
				     ModifiedBy = @ModifiedBy
					
				
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
				--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			 SELECT @ErrorStatus =@ErrorStatus + ' -6091' +' Update Failed LUIncomeSource';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateInsuranceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 15 March 11
*Table Name: LUInsuranceType
Description: Update data to LUInsuranceType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateInsuranceType](
	@InsuranceTypeID int,
	@InsuranceType Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewInsuranceTypeID int
	
	SET @TempNewInsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 Insurance Type already exists in LUInsuranceType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewInsuranceTypeID = InsuranceTypeID 
			  FROM person.LUInsuranceType
			     WHERE InsuranceTypeID = @InsuranceTypeID
			      
	     	IF @TempNewInsuranceTypeID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 Insurance Type doesnt exist in LUInsuranceType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUInsuranceType
			     SET  InsuranceType = @InsuranceType,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE InsuranceTypeID = @InsuranceTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUInsuranceType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateLanguage]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LULanguage
Description: Updates data to LULangage. This table Contains the most common languages and dialects in the world.Dialects
are comma demlmited. Example: Chinese, Mandarin.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateLanguage](
	@LanguageID int,
	@LanguageName Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			--Double check to see that we do have a correct languageID before trying to update
			SELECT @TempLanguageID = LanguageID 
				FROM person.LULanguage
				WHERE LanguageID = @LanguageID

		  /****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 IF (@TempLanguageID = 0) or (@TempLanguageID IS NULL)
				BEGIN
					SELECT @ErrorStatus = '-6068 Language does not exist in db';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				
				IF @TempLanguageID <> 0 --Don't really need this, but... it exists in the database then
					BEGIN
					
						UPDATE Person.LULanguage
							SET LanguageName = @LanguageName,
								ModifiedDate = SYSDATETIME(),
								ModifiedBy = @ModifiedBy
							WHERE
								LanguageID = @LanguageID
								
							
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
					END		
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'LULanguage-6061';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateLUFamilyRelationships]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUFamilyRelationships
Description: Updates data to LUFamilyRelationships.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateLUFamilyRelationships](
	@FamilyRelationshipID int, 
	@RelationshipCode Nvarchar(30),
	@RelationshipDescription Nvarchar(50) ='',
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	
	BEGIN TRY
		 BEGIN TRANSACTION;
			IF (@FamilyRelationshipID =0) OR (@FamilyRelationshipID IS NULL)
				BEGIN
					SELECT @ErrorStatus = ' -60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16,1);
				END 
		 
		 
			SELECT @TempFamilyRelationshipID = FamilyRelationshipID 
			   FROM person.LUFamilyRelationship
			   WHERE FamilyRelationshipID = @FamilyRelationshipID 
			   
	     	If @TempFamilyRelationshipID =0 
				BEGIN
					SET @ErrorStatus = ' -60048 RelationshipID doesnt exist  LUFamilyRelationship'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
		BEGIN
		
			  UPDATE Person.LUFamilyRelationship
				  SET RelationshipCode = @RelationshipCode,
					  RelationshipDescription = @RelationshipDescription,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				   WHERE FamilyRelationshipID = @FamilyRelationshipID
					
				
			
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-60041 Update Failed LUFamilyRelationship';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdatePerson]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Person
Description: Update data to Person table
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdatePerson](
	@PersonID int,
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = Null,
	@LastName Name,
	@Suffix NVarchar(10) = Null,
	@DateOfBirth DateTime,
	@EmailAddress Nvarchar(50) = Null,
	@EmailContactPreference NoYes =0,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int

	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		


	           
BEGIN TRY
	 BEGIN TRANSACTION;
	 
		IF ((@PersonID = 0) OR (@PersonID IS NULL))
			BEGIN
				SELECT @ErrorStatus = 'Person ID cant be 0 or NULL -1005';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
		BEGIN
			SELECT @TempPersonID = PersonID from Person.Person
				WHERE
					PersonID = @PersonID
			IF @TempPersonID =0 OR @TempPersonID IS NULL
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-1008 Person does not exist';
					RAISERROR(@ErrorStatus,16,1);
				END
		END	
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-1000';
				SET @Success = 0;
			END
		 
			
			 UPDATE Person.Person
				SET Title = @Title,
				    FirstName = @FirstName,
					MiddleName = @MiddleName,
					LastName = @LastName,
					Suffix = @Suffix,
					DateOfBirth = @DateOfBirth, 
					EmailAddress = @EmailAddress,
					EmailContactPreference = @EmailContactPreference,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE PersonID = @PersonID
					
				
				
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + 'Update Person Failed -1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END








GO
/****** Object:  StoredProcedure [dbo].[pUpdatePersonType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUPersonType
Description: Updates data to LUPersonType. 
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePersonType](
	@PersonTypeID int,
	@PersonType NVarchar(20),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Does it already exist? If not, then do not try to update!
	SELECT @TempPersonTypeID = PersonTypeID  
	  FROM person.LUPersonType
	     WHERE PersonTypeID = @PersonType

/****************************************************************************/	          
		IF (@TempPersonTypeID = 0) OR (@TempPersonTypeID IS NULL)
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600008 PersonType does not exists';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
		 
		
	
		BEGIN
		
			  UPDATE Person.LUPersonType
				 SET PersonType = @PersonType,
					 ModifiedDate = SYSDATETIME(),
					 ModifiedBy = @ModifiedBy
				 WHERE PersonTypeID = @PersonTypeID
					
				
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600001 Update Failed Person Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdatePhone]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Phone
Description: Update data to phone table. The row is tied to the person.personid. This Stored proc/table does not directly
access the LUPhoneType table. The type is selected by the user from a dropdown and we just store the ID from the dropdown behind the scenes  
 for simplicity
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePhone](
	@PhoneID int,
	@PersonID int,
	@PhoneNumber Phone,
	@PhoneExtension NVarchar(8),
	@PhoneType int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneID int,
	@TempPersonID int
	
	SET @TempPhoneID =0;
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';


    BEGIN TRY
		  BEGIN TRANSACTION;
			IF ((@PersonID = 0) OR (@PersonID IS NULL) OR (@PhoneID = 0) OR (@PhoneID IS NULL)) -- This has to be valid or we bail out!
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = '-8005: PersonID/PhoneID must be valid';
						
					RAISERROR(@ErrorStatus,16,1);
				END
				
			BEGIN
				SELECT @TempPersonID = PersonID, @TempPhoneID = @PhoneID
					FROM Person.Phone
						WHERE
							PersonID =@PersonID AND @PhoneID = @PhoneID
							
				IF ((@TempPersonID = 0) OR (@TempPersonID IS NULL)) OR ((@TempPhoneID = 0) OR (@TempPhoneID IS NULL))	
					BEGIN
						SET @ErrorStatus ='-8008 PersonID or PhoneID not valid';
						SET @Success =0;
						RAISERROR (@ErrorStatus, 16, 1);
					END		
			
				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-8030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END
			END
	 	
			 UPDATE Person.Phone
				SET PersonID = @PersonID,
					PhoneNumber = @PhoneNumber,
					PhoneExtension = @PhoneExtension,
					PhoneType = @PhoneType,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE PhoneID = @PhoneID
			 
					
				SET @success =1;
				SET @ErrorStatus =0;
				
		  COMMIT TRANSACTION;
			
	END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
				
	  	    SELECT @ErrorStatus= @ErrorStatus + '8001 Update Failed';
		    RAISERROR(@ErrorStatus, 16, 1);
		    SET @Success =0;
			 
			
		END CATCH

		















GO
/****** Object:  StoredProcedure [dbo].[pUpdatePhoneType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPhoneType
Description: Updage Phone Type to the LUPhoneType table.The data in this table could easily become
poor if the user does not take care when inserting phone types. A mis-spelling can cause unintential duplicate
records.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePhoneType](
	@PhoneTypeID int,
	@PhoneType int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


	
		 
BEGIN TRY
  BEGIN TRANSACTION;	
	IF (@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)
		BEGIN
			SET @ErrorStatus = '-6085' + ' PhoneTypeID Cant be 0/NULL' ; 
			 RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		END
		
	SELECT @TempPhoneTypeID = PhoneTypeID
	  FROM person.LUPhoneType
		 WHERE PhoneTypeID = @PhoneTypeID
  	 
	
	IF @TempPhoneTypeID = 0
	BEGIN
	SET @ErrorStatus = '-6088' + ' PhoneType doesnt exists LUPhoneType' ; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
       

	IF @@Error <> 0 
		BEGIN
			SET @ErrorStatus = '-6080';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
		END
	   	
	  	 UPDATE Person.LUPhoneType
	  		SET PhoneType = @PhoneType,
	  			ModifiedDate= SYSDATETIME(), 
	  			ModifiedBy = @ModifiedBy
	  		WHERE PhoneTypeID = @PhoneTypeID
				
			set @success =1;
			set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			 
			  SET @ErrorStatus= @Errorstatus + ' -6081' +'Insert Failed on Phone Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  ROLLBACK TRANSACTION;
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdatepHouseholdTransferOptions]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 22 April 11
*Table Name: LUHouseholdTransferOptions
Description: Update data to LUHouseholdTransferOptions. 
Revisions:

**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdatepHouseholdTransferOptions](
	@ActionToTakeID int,
	@ActionToTake Nvarchar(50),
	@ActionToTakeDescription NVarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				
				
			SELECT @TempActionToTakeID = HouseholdTransferActionID 
			  FROM dbo.LUHouseholdTransferOptions
				 WHERE HouseholdTransferActionID = @ActionToTakeID 
				 
			If @TempActionToTakeID = 0 --Cant Update if it doesnt exist
				BEGIN
					SELECT @ErrorStatus = '-6015 Action Type Does Not Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16, 1);
				END
	 
			
			 UPDATE dbo.LUHouseholdTransferOptions
				SET ActionToTake = @ActionToTake,
					ActionToTakeDescription = @ActionToTakeDescription,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE 
					HouseholdTransferActionID =@ActionToTakeID;
					
			
				
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Update Failed Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END










GO
/****** Object:  StoredProcedure [dbo].[pUpdatePostalCode]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPostalCode
Description: Inserts Postal Code to the Postal Code table.This requires that the CityID be passed in as a
paramter. It is unlikely that a new city will be build, requiring a new postal code, but it is very likely
that a new postal code will be needed in a city.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePostalCode](
	@PostalCodeID int,
	@CityID int,
	@PostalCode Nvarchar(10),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int,
	@TempPostalCodeID int
	
	SET @TempPostalCodeID = 0;
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


	
		
BEGIN TRY
	BEGIN TRANSACTION;	 
	
	IF ((@TempPostalCodeID = 0)OR (@TempPostalCodeID IS NULL)) AND ((@TempCityID =0) OR (@TempCityID IS NULL)) 
		BEGIN
			SET @ErrorStatus = '-6075' + ' PostalCodeId/CityID cant be 0/NULL' ;
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		END
	
	/****************************************************************************/
	--Check to be sure that the city ID and PostalCode ID does exist in the city table before we go on. We could
	--just use postal code ,but adding CityID allows for updates to mistakes in city when entered.
		
	
	SELECT @TempCityID = CityID
	  FROM person.LUCity
		 WHERE CityID = @CityID
		
	SELECT @TempPostalCodeID = PostalCodeID
	  FROM Person.LUPostalCode
		WHERE PostalCodeID = @PostalCodeID
	
	If @TempCityID = 0 OR @TempPostalCodeID = 0
		BEGIN
			SET @ErrorStatus = '-6072' + ' CityID or PostalCodeID doesnt exist in LUtables, cant Update PostalCode' ; --Failed in lookup table
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
			
		END	
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = '-6070';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
		  UPDATE Person.LUPostalCode
			 SET CityID =@CityID,--Do this in case there was a mistake in original insert
				 PostalCode = @PostalCode,
				 ModifiedDate = SYSDATETIME(),
				 ModifiedBy = @ModifiedBy
			 WHERE PostalCodeID = @PostalCodeID
				
				
				set @success =1;
				set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus='-6071' +'Update Failed on PostalCode';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdateProgramServiceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUprogramServiceType
Description: Update data to LUProgramServiceType. This table matches the Program with the service being
used by the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateProgramServiceType](
	@ProgramServiceTypeID int,
	@ServiceCode Nvarchar(20),
	@ServiceDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
BEGIN        
  BEGIN TRY
	  BEGIN TRANSACTION;
		IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL))
			BEGIN
				SELECT @ErrorStatus = '-6055 ProgramServiceTypeID cant be 0 or NULL';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
		SELECT @TempProgramServiceTypeID = ProgramServiceTypeID
				FROM Person.LUProgramServiceType
				WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
				
		IF (@TempProgramServiceTypeID = 0) OR (@TempProgramServiceTypeID IS NULL) 
				BEGIN
					SELECT @ErrorStatus = '-6058 ProgramServiceTypeID cant be 0 or NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	
	  BEGIN
		
			  UPDATE Person.LUProgramServiceType
				 SET ServiceCode = @ServiceCode,
					 ServiceDescription = @ServiceDescription,
					 ModifiedDate = SYSDATETIME(),
					 ModifiedBy = @ModifiedBy
				 WHERE ProgramServiceTypeID = @ProgramServiceTypeID
				
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@ErrorStatus+ 'Update failed Rollback -6051';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateProgramType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Update data to LUProgramType. This table matches the Program with the user.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateProgramType](
	@ProgramTypeID int,
	@ProgramName Nvarchar(20),
	@ProgramDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
		IF(@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)
			BEGIN
				SELECT @ErrorStatus = '-6045 ProgramTypeID cant be 0/null';
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);
			END
		BEGIN	
		SELECT ProgramTypeID = @ProgramTypeID
			FROM Person.LUProgramType
			  WHERE ProgramTypeID = @ProgramTypeID
		
		    IF(@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)
				BEGIN
					SELECT @ErrorStatus = '-6048 ProgramType does not exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
		
		END	  	
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + ' -6040';
				SET @Success = 0;
			END
		 
		

	  BEGIN
		
			  UPDATE Person.LUProgramType
				 SET ProgramName = @ProgramName,
					 ProgramDescription = @ProgramDescription,
					 ModifiedDate = SYSDATETIME(), 
					 ModifiedBy = @ModifiedBy
				 WHERE
					ProgramTypeID = @ProgramTypeID
					
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
	 END	
	 
		
		END TRY

		BEGIN CATCH
		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
			--We only care if the error was not raised by SSE
			IF @@ERROR <> 50000
				BEGIN
					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
				END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus +' -6041 Update Failed on Program Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateRace]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LURace
Description: Update data to LURace. This table matches the Race with a U.S Census race category
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateRace](
	@RaceID int,
	@RaceAbbreviation NVarchar(10),
	@RaceDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	          
BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Check to see if the RaceID Exists in the DB. Validates the Race ID Input
	--White, Black(AA or Negro).American Indian or Alaskan native.,Asian Indian,Chinese,Filipino, Other Asian, Japanese,
	--Korean, Vietnamese, Native Hawaiian, Guanamanian or Chamorro, Samoan, Other pacific Islander.
	SELECT @TempRaceID = RaceID 
	  FROM person.LURace
	     WHERE RaceID = @RaceID --Be a bit paranoid and trim the input for white spaces


/****************************************************************************/
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + '-6020';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
			
		END
		IF (@TempRaceID = NULL) or (@TempRaceID =0) -- can't update if doesnt exist
			SELECT @ErrorStatus ='-6028 Does not exist in DB';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
			 
		 
		
	IF @TempRaceID <> 0 --If they exist in the database then
		BEGIN
		
			  UPDATE Person.LURace
			  SET RaceAbbreviation = @RaceAbbreviation,
				  RaceDescription = @RaceDescription,
				  ModifiedDate = SYSDATETIME(),
				  ModifiedBy =@ModifiedBy
			  WHERE
				  RaceID = @RaceID;
			  			
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6021 Update Failed Race Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateSSN]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: SSN.SSN
Description: Updates data to SSN. Only Certain federal programs require that SSN be captured, so we only want to
use this sparingly.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateSSN](
	@SSNID int,
	@PersonID int,
	@SSN NVarchar(9),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@TempSSNID int
	
	SET @TempPersonID =0;
	SET @TempSSNID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  SELECT @SSN = ltrim(rtrim(@SSN)); --Get rid of spaces before we begin!
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				BEGIN	
					SELECT @ErrorStatus = '-12005 PersonID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
					
				END
			IF ((LEN(@SSN)<9) OR (@SSN IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11006 Invalid SSN Null or <9 Characters';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				
				END
			
			IF (@SSNID = 0 OR @SSNID IS NULL)
				BEGIN
					SELECT @ErrorStatus ='-12006 SSNID Cant be 0/NULL';
					SET @Success =0;
					RAISERROR (@ErrorStatus,16,1);
				END
		

			--Final check to be sure this is not a duplicate
			
			SELECT @TempSSNID = SSNID 
				FROM SSN.SSN
					WHERE PersonID = @PersonID AND SSNID =@SSNID
								
			IF @TempSSNID = 0 
				--No Record, Cant update! 
				BEGIN
					SELECT @ErrorStatus = '-12008 Record Does not Exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -12001';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				
				
					
						UPDATE SSN.SSN 
						    SET PersonID = @PersonID,
								SSN = @SSN,
								ModifiedDate = SYSDATETIME(),
							    ModifiedBy = @ModifiedBy
								 
							WHERE SSNID = @SSNID
								
							
								SET @success =1;
								SET @ErrorStatus =0;
								
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'SSN -12001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateState]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Update data to LUState. This table matches the State with a State ID for ties to County, City and Zip Code.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateState](
	@StateID int,
	@StateCode Nvarchar(2),
	@Name Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	 BEGIN TRANSACTION;
	 /****************************************************************************/
--This could go after the test for @StateId =0 but will leave here
	SELECT @TempStateID = StateID 
	  FROM person.LUState
	     WHERE StateID = @StateID

/****************************************************************************/	          
		IF (@TempStateId = NULL) OR (@TempStateID = 0)
			BEGIN
				SELECT @ErrorStatus = 'State does not exist -6038';
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6030';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16, 1);
			END
		
			
		IF @StateID = 0
			BEGIN
				SELECT @ErrorStatus = '@StateID cant be 0 -6035';
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
			  UPDATE Person.LUState
				SET StateCode = @StateCode,
					Name = @Name,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					StateID = @StateID;
			 
							
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
	
			
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus + @@ERROR + '-6031 Update Failed on State';--6030-6039 is for this table
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateVolSchedDayTime]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates a record into Volunteer.VolunteerScheduleDayTime
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateVolSchedDayTime]
	-- Add the parameters for the stored procedure here
	@VolSchedWeekID int,
    @DayOfWeek int,
    @AvailBegTime time(7),
    @AvailEndTime time(7),
    @IsNoShow bit,
    @ActualHoursTotal numeric(18,0),
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolSchedWeekID = 0 OR @VolSchedWeekID IS NULL
			    BEGIN  --IF @VolSchedWeekID = 0 OR 
				    RAISERROR('VolSchedWeekID cannot be null or 0',16,1);
			    END	--IF @VolSchedWeekID = 0 OR

            -- Check if VolSchedWeekID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleWeek WHERE VolunteerScheduleWeekID = @VolSchedWeekID)
                BEGIN --IF @VolSchedWeekID
                    RAISERROR('VolSchedWeekID does not exist',16,1);
                END --IF @VolSchedWeekID

            -- 
            -- Update the values
            Update Volunteer.VolunteerScheduleDayTime 
            SET DayOfWeek=@DayOfWeek,
                AvailableBeginTime=@AvailBegTime,
                AvailableEndTime=@AvailEndTime,
                IsNoShow=@IsNoShow,
                ActualHoursTotal=@ActualHoursTotal,
                ModifiedBy=@VolModifiedBy

            WHERE VolunteerScheduleWeekID=@VolSchedWeekID

        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pUpdateVolSchedMonth]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates a record into Volunteer.VolunteerScheduleMonth
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateVolSchedMonth] 
	-- Add the parameters for the stored procedure here
	@VolPersonID int,
    @Month int,
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolPersonID = 0 OR @VolPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer is active
            IF NOT EXISTS (SELECT * FROM FetchActiveVolunteers() WHERE VolunteerPersonID = @VolPersonID)
                BEGIN --IF @VolPersonID NOT active
                    RAISERROR('VolPersonID is not active',16,1);
                END --IF @VolPersonID NOT active

            -- Update the values
            UPDATE Volunteer.VolunteerScheduleMonth 
            SET Month=@Month,
                ModifiedBy=@VolModifiedBy
            WHERE VolunteerPersonID=@VolPersonID

        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pUpdateVolSchedWeek]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates a record into Volunteer.VolunteerScheduleWeek
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateVolSchedWeek] 
	-- Add the parameters for the stored procedure here
	@VolSchedMonthID int,
    @Week int,
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolSchedMonthID = 0 OR @VolSchedMonthID IS NULL
			    BEGIN  --IF @VolSchedMonthID = 0 OR 
				    RAISERROR('VolSchedMonthID cannot be null or 0',16,1);
			    END	--IF @VolSchedMonthID = 0 OR

            -- Check if volunteer month id exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleMonth WHERE VolunteerScheduleMonthID = @VolSchedMonthID)
                BEGIN --IF @VolSchedMonthID NOT EXISTS
                    RAISERROR('VolSchedMonthID does is not Exist',16,1);
                END --IF @VolSchedMonthID NOT EXISTS

            -- Insert the values
            UPDATE Volunteer.VolunteerScheduleWeek
            SET Week=@Week,
                ModifiedBy=@VolModifiedBy
            WHERE VolunteerScheduleMonthID=@VolSchedMonthID


        COMMIT TRANSACTION
    END TRY


    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pUpdateVolunteerContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
    @VolunteerPersonID int,
    @DepartmentID int=NULL,
	@ContactFirstName Name,
	@ContactLastName Name,
    @ContactDOB datetime,
	@ContactAddress1 NVarchar(50),
	@ContactAddress2 NVarchar(50)=NULL,
	@ContactHomePhone Phone,
	@ContactWorkPhone Phone,
	@ContactCellPhone Phone,
	@ContactPager Nvarchar(20),
	@ContactEmail NVarchar(50),
	@VolunteerTypeID int,
	@IsActive bit,
	@ModifiedBy Name,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE 
    @MyModifiedDate DATETIME = GETDATE(),
    @ErrNo int =0,
    @ErrMsg NVarchar(50)='',
    @ContactPersonID int;

    BEGIN TRY

	    BEGIN TRANSACTION
	        SET @ContactPersonID = @VolunteerPersonID
		    UPDATE Volunteer.VolunteerContactInformation
            SET DepartmentID=@DepartmentID,
			    ContactFirstName=@ContactFirstName,
			    ContactLastName=@ContactLastName,
                ContactDOB=@ContactDOB,
			    ContactAddress1=@ContactAddress1,
			    ContactAddress2=@ContactAddress2,
			    ContactHomePhone=@ContactHomePhone,
			    ContactCellPhone=@ContactCellPhone,
			    ContactWorkPhone=@ContactWorkPhone,
			    ContactPager=@ContactPager,
                ContactEmail=@ContactEmail,
			    Volunteertypeid=@Volunteertypeid,
			    IsActive=@IsActive,
                ModifiedDate=@MyModifiedDate,
			    ModifiedBy=@ModifiedBy
            WHERE VolunteerPersonID = @VolunteerPersonID
					
					 
		    SELECT @ErrNo = @@ERROR
			
		    IF @ErrNo <>0--<> Error!
			    BEGIN
				    RAISERROR(@ErrNo,16,0)
			    END
		    SET @Success =1;
			
		COMMIT TRANSACTION
				
    END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
				
			 SET @Success =0;
			  
			 IF RTRIM(LTRIM(@ErrMsg)) =''
				 BEGIN
					SELECT @Error ='Failure in UpdatePersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END





GO
/****** Object:  StoredProcedure [dbo].[pUpdateVolunteerEmergencyContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates volunteer emergency contact information
-- =============================================
create PROCEDURE [dbo].[pUpdateVolunteerEmergencyContactInformation] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@ContactInformation NVARCHAR(MAX),
	@ModifiedBy Name,
	@EmergencyContactInformationID int Output,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END
	
		UPDATE Volunteer.VolunteerEmergencyContact
		SET ContactInformation=@ContactInformation,
			ModifiedBy=@ModifiedBy,
			ModifiedDate=SYSDATETIME()
		WHERE VolunteerPersonID=@VolunteerPersonID
					 
		SELECT @ErrNo = @@ERROR
			
		IF @ErrNo <>0--<> Error!
			BEGIN
				RAISERROR(@ErrNo,16,0)
			END
		SET @Success =1;
			
		COMMIT TRANSACTION

	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in UpdateVolEmergencyContactInfo Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END


GO
/****** Object:  StoredProcedure [dbo].[pVolunteerInsert]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-25
-- Description:	Get person information to be inserted into volunteerContactInformation table,
--         From table valued function FetchPersonInfo.
-- UPDATE: Added insert volunteer jobs and notes.
-- =============================================
CREATE PROCEDURE [dbo].[pVolunteerInsert] 
	-- Add the parameters for the stored procedure here
	@PersonID int,
    @DeptID int=NULL,
    @VolTypeID int,
    @IsVolActive bit,
    @VolNotes NVARCHAR(MAX),
    @VolJobDescription NVARCHAR(50),
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE 
            @VolunteerPersonID int,
            @ContactFirstName nvarchar(50)=null,
            @ContactLastName nvarchar(50)=null,
            @ContactDOB datetime=null,
            @ContactAddress1 nvarchar(max)=null,
            @ContactAddress2 nvarchar(max)=null,
            @ContactEmail nvarchar(50)=null,
            @ContactHomePhone nvarchar(25)=null,
            @ContactWorkPhone nvarchar(25)=null,
            @ContactCellPhone nvarchar(25)=null,
            @ContactPager nvarchar(20)=null,
            @DepartmentID int,
            @VolunteerTypeID int,
            @IsActive bit,
	        @ModifiedBy nvarchar(50),
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int,
            @Success int,
            @Succ int;

            --Check the id exists and isn't null/0
            IF @PersonID = 0 OR @PersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('PersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR 

            IF NOT EXISTS (SELECT * FROM Person.Person WHERE PersonID = @PersonID)
                BEGIN --IF @PersonID NOT EXISTS
                    RAISERROR('PersonID does not exists',16,1);
                END --IF @PersonID NOT EXISTS

            -- Check that the other parameters are not null
            IF @IsVolActive IS NULL
                BEGIN --IF VolIsActive null
                    RAISERROR('IsVolActive cannot be null',16,1);
                END --IF VolIsActive null

            IF @VolTypeID IS NULL
                BEGIN --IF VolTypeID null
                    RAISERROR('VolTypeID cannot be null',16,1);
                END --IF VolTypeID null

            IF @VolModifiedBy IS NULL
                BEGIN --IF @VolModifiedBy null
                    RAISERROR('VolModifiedBy cannot be null',16,1);
                END --IF @VolModifiedBy null

            -- SET the other needed parameters
            SET @DepartmentID = @DeptID
            SET @VolunteerTypeID = @VolTypeID
            SET @IsActive = @IsVolActive
            SET @ModifiedBy = @VolModifiedBy

            -- Fetch and assign values to variables from Fetch Function
            SELECT @VolunteerPersonID = VolunteerPersonID, 
            @ContactFirstName = ContactFirstName, 
            @ContactLastName = ContactLastName,
            @ContactDOB = CONVERT(DATETIME,ContactDOB,103),
            @ContactAddress1 = ContactAddress1,
            @ContactAddress2 = ContactAddress2,
            @ContactEmail = ContactEmail,
            @ContactHomePhone = ContactHomePhone,
            @ContactWorkPhone = ContactWorkPhone,
            @ContactCellPhone = ContactCellPhone,
            @ContactPager = ContactPager
            FROM [dbo].FetchPersonInfo(@PersonID)
            
            -- Check we got the info
            IF @@ROWCOUNT != 1
                BEGIN --IF @@ROWCOUNT != 1
                    RAISERROR('Could not fetch person info.',16,1);
                END --IF @@ROWCOUNT != 1

            -- I was having a problem with vol contact info already existing. So I'm going to check if it exists
            -- and if it does, I will skip this insert and move to job and notes, else insert it.
            IF NOT EXISTS(SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @PersonID)
            BEGIN
                -- Execute insertvolcontact sp call with the above parameters
                EXEC [dbo].pInsertVolunteerContactInformation 
                    @VolunteerPersonID,
                    @DepartmentID,
                    @ContactFirstName,
                    @ContactLastName,
                    @ContactDOB,
                    @ContactAddress1,
                    @ContactAddress2, 
                    @ContactHomePhone,
                    @ContactWorkPhone,
                    @ContactCellPhone,
                    @ContactPager,
                    @ContactEmail,
                    @VolunteerTypeID,
                    @IsActive,
                    @ModifiedBy,
                    @ErrorMessage output,
                    @ErrorSeverity output,
                    @Success output;

		        IF @Success <>1--<> Error!
			        BEGIN
				        RAISERROR('Could not insert volunteer contact information.',16,0)
			        END
            END

            SELECT * FROM FetchVolunteerContactInfo(@PersonID)

            -- Insert Notes
            EXEC [dbo].pInsertVolunteerNotes @VolunteerPersonID=@PersonID, @Notes=@VolNotes, @ModifiedBy=@VolModifiedBy, 
                @Error=@ErrorMessage out, @ErrorNo=@ErrorState out, @Success=@Success out
            IF @Success <> 1
            BEGIN
                RAISERROR('Could not insert volunteer notes.',16,0)
            END

            -- Insert Job
            EXEC [dbo].pInsertVolunteerJobs @PersonID=@VolunteerPersonID, @JobDescription=@VolJobDescription, @ModifiedByName=@VolModifiedBy, @Success=@Succ out
            IF @Succ <> 1
            BEGIN
                RAISERROR('Could not insert volunteer job.',16,0)
            END

        COMMIT TRANSACTION
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH  
    
END


GO
/****** Object:  StoredProcedure [dbo].[pVolunteerScheduleInsert]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pVolunteerScheduleInsert] 
	-- Add the parameters for the stored procedure here
	@VolPersonID INT, 
	@Month INT,
    @Week INT,
    @DayOfWeek INT,
	@AvailBegTime TIME(7),
	@AvailEndTime TIME(7),
	@IsNoShow BIT,
	@ActualHoursTotal NUMERIC(18,0),
    @VolModifiedBy NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @VolSchedMonthID int,
            @VolSchedWeekID int,
            @VolSchedDayTimeID int,
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolPersonID = 0 OR @VolPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer is active
            IF NOT EXISTS (SELECT * FROM FetchActiveVolunteers() WHERE VolunteerPersonID = @VolPersonID)
                BEGIN --IF @VolPersonID NOT active
                    RAISERROR('VolPersonID is not active',16,1);
                END --IF @VolPersonID NOT active

            -- Check if month with personid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleMonthID FROM Volunteer.VolunteerScheduleMonth WHERE @VolPersonID = VolunteerPersonID AND Month = @Month)
                BEGIN-- IF month record not exists, create it
                    EXEC pInsertVolSchedMonth @VolPersonID=@VolPersonID, @Month=@Month, @VolModifiedBy=@VolModifiedBy, @NewMonthID=@VolSchedMonthID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedMonthID = VolunteerScheduleMonthID FROM Volunteer.VolunteerScheduleMonth
                    WHERE @VolPersonID = VolunteerPersonID AND Month = @Month;
                END

            -- Check if week with monthid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleWeekID FROM Volunteer.VolunteerScheduleWeek WHERE @VolSchedMonthID = VolunteerScheduleMonthID AND Week = @Week)
                BEGIN-- IF week record not exists, create it
                    EXEC pInsertVolSchedWeek @VolSchedMonthID=@VolSchedMonthID, @Week=@Week, @VolModifiedBy=@VolModifiedBy, @NewWeekID=@VolSchedWeekID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedWeekID = VolunteerScheduleWeekID FROM Volunteer.VolunteerScheduleWeek
                    WHERE @VolSchedMonthID = VolunteerScheduleMonthID AND Week = @Week;
                END

            -- Check if DayTime day of week with weekid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleDayTimeID FROM Volunteer.VolunteerScheduleDayTime WHERE @VolSchedWeekID = VolunteerScheduleWeekID AND DayOfWeek = @DayOfWeek)
                BEGIN-- IF DayTime record not exists, create it
                    EXEC pInsertVolSchedDayTime @VolSchedWeekID=@VolSchedWeekID, @DayOfWeek=@DayOfWeek, @AvailBegTime=@AvailBegTime, @AvailEndTime=@AvailEndTime, @IsNoShow=@IsNoShow, @ActualHoursTotal=@ActualHoursTotal, @VolModifiedBy=@VolModifiedBy, @NewDayTimeID=@VolSchedDayTimeID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedDayTimeID = VolunteerScheduleDayTimeID FROM Volunteer.VolunteerScheduleDayTime
                    WHERE @VolSchedWeekID = VolunteerScheduleWeekID AND DayOfWeek = @DayOfWeek;
                END

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[pVolunteerScheduleUpdate]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates volunteer schedule information
-- =============================================
CREATE PROCEDURE [dbo].[pVolunteerScheduleUpdate] 
	-- Add the parameters for the stored procedure here
	@VolPersonID INT, 
	@Month INT,
    @Week INT,
    @DayOfWeek INT,
	@AvailBegTime TIME(7),
	@AvailEndTime TIME(7),
	@IsNoShow BIT,
	@ActualHoursTotal NUMERIC(18,0),
    @VolModifiedBy NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @VolSchedMonthID int,
            @VolSchedWeekID int,
            @VolSchedDayTimeID int,
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolPersonID = 0 OR @VolPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer is active
            IF NOT EXISTS (SELECT * FROM FetchActiveVolunteers() WHERE VolunteerPersonID = @VolPersonID)
                BEGIN --IF @VolPersonID NOT active
                    RAISERROR('VolPersonID is not active',16,1);
                END --IF @VolPersonID NOT active

            -- Check if month with personid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleMonthID FROM Volunteer.VolunteerScheduleMonth WHERE @VolPersonID = VolunteerPersonID AND Month = @Month)
                BEGIN-- IF month record not exists
                    RAISERROR('VolSchedMonth does not exist.',16,1);
                END
            ELSE
                BEGIN
                    EXEC pUpdateVolSchedMonth @VolPersonID=@VolPersonID, @Month=@Month, @VolModifiedBy=@VolModifiedBy;
                END

            -- Check if week with monthid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleWeekID FROM Volunteer.VolunteerScheduleWeek WHERE @VolSchedMonthID = VolunteerScheduleMonthID AND Week = @Week)
                BEGIN-- IF week record not exists
                    RAISERROR('VolSchedWeek does not exist.',16,1);
                END
            ELSE
                BEGIN
                    EXEC pUpdateVolSchedWeek @VolSchedMonthID=@VolSchedMonthID, @Week=@Week, @VolModifiedBy=@VolModifiedBy;
                END

            -- Check if DayTime day of week with weekid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleDayTimeID FROM Volunteer.VolunteerScheduleDayTime WHERE @VolSchedWeekID = VolunteerScheduleWeekID AND DayOfWeek = @DayOfWeek)
                BEGIN-- IF DayTime record not exists
                    RAISERROR('VolSchedDayTime record does not exist.',16,1);
                    
                END
            ELSE
                BEGIN
                    EXEC pUpdateVolSchedDayTime @VolSchedWeekID=@VolSchedWeekID, @DayOfWeek=@DayOfWeek, @AvailBegTime=@AvailBegTime, @AvailEndTime=@AvailEndTime, @IsNoShow=@IsNoShow, @ActualHoursTotal=@ActualHoursTotal, @VolModifiedBy=@VolModifiedBy;
                END

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[spInsertJournalClientFamilyChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Gary Savard
-- Create date: 6 JUNE 11
-- Description:	This sp inserts a row in the journaling table for recordkeeping of admin functions.
-- 
-- =============================================
CREATE PROCEDURE [dbo].[spInsertJournalClientFamilyChanges]
(
	@HouseholdMembersID int,
	@PreviousClientsID int,
	@NewClientsID int,
	@ActionTaken NVarchar(50),
	@Notes NVarchar(MAX),
	@ModifiedBy Name
			
)

AS
BEGIN
BEGIN TRANSACTION
--No Error handling used because we do not want to affect the main sp with problems here.
	
		INSERT dbo.JournalClientFamilyChanges 
				(HouseholdMembersID,
				PreviousClientsID,
				NewClientsID,
				ActionTaken,
				Notes,
				ModifiedBy,
				ModifiedDate)
		VALUES
				(@HouseholdMembersID,
				@PreviousClientsID,
				@NewClientsID,
				@ActionTaken,
				@Notes,
				@ModifiedBy,
				SYSDATETIME())
				
				
IF @@ROWCOUNT >0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
END




GO
/****** Object:  StoredProcedure [Maintenance].[CreateRoleScript]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Written By Bradley Morris
--In Query Analyzer be sure to go to
--Query -> Current Connection Options -> Advanced (Tab)
--and set Maximum characters per column
--to a high number, such as 10000, so
--that all the code will be displayed.

Create Procedure [Maintenance].[CreateRoleScript](@RoleName [SYSNAME])
As

--Written By Bradley Morris
--In Query Analyzer be sure to go to
--Query -> Current Connection Options -> Advanced (Tab)
--and set Maximum characters per column
--to a high number, such as 10000, so
--that all the code will be displayed.

DECLARE  @DatabaseRoleName [SYSNAME]
--SET @DatabaseRoleName = '{Database Role Name}'

--SET @DatabaseRoleName = 'role_name_goes_here'
SET @DatabaseRoleName =@RoleName

SET NoCount  ON

DECLARE  @errStatement      [VARCHAR](8000),
         @msgStatement      [VARCHAR](8000),
         @DatabaseRoleID    [SMALLINT],
         @IsApplicationRole [BIT],
         @ObjectID          [INT],
         @ObjectName        [SYSNAME]

SELECT @DatabaseRoleID = [uId],
       @IsApplicationRole = CAST([IsapProle] AS BIT)
FROM   [dbo].[sysUsers]
WHERE  [Name] = @DatabaseRoleName
       AND ([IssqlRole] = 1
             OR [IsapProle] = 1)
       AND [Name] NOT IN ('public',
                          'INFORMATION_SCHEMA',
                          'db_owner',
                          'db_accessadmin',
                          'db_securityadmin',
                          'db_ddladmin',
                          'db_backupoperator',
                          'db_datareader',
                          'db_datawriter',
                          'db_denydatareader',
                          'db_denydatawriter')

IF @DatabaseRoleID IS NULL
  BEGIN
    IF @DatabaseRoleName IN ('public',
                             'INFORMATION_SCHEMA',
                             'db_owner',
                             'db_accessadmin',
                             'db_securityadmin',
                             'db_ddladmin',
                             'db_backupoperator',
                             'db_datareader',
                             'db_datawriter',
                             'db_denydatareader',
                             'db_denydatawriter')
      SET @errStatement = 'Role ' + @DatabaseRoleName + ' is a fixed database role and cannot be scripted.'
    ELSE
      SET @errStatement = 'Role ' + @DatabaseRoleName + ' does not exist in ' + Db_name() + '.' + CHAR(13) + 'Please provide the name of a current role in ' + Db_name() + ' you wish to script.'
    RAISERROR (@errStatement,16,1)
  END
ELSE
  BEGIN
    SET @msgStatement = '--Security creation script for role ' + @DatabaseRoleName + CHAR(13) + '--Created At: ' + CONVERT(VARCHAR,Getdate(),112) + REPLACE(CONVERT(VARCHAR,Getdate(),108),':','') + CHAR(13) + '--Created By: ' + Suser_name() + CHAR(13) + '--Add Role To Database' + CHAR(13)
    IF @IsApplicationRole = 1
      SET @msgStatement = @msgStatement + 'EXEC sp_addapprole' + CHAR(13) + CHAR(9) + '@rolename = ''' + @DatabaseRoleName + '''' + CHAR(13) + CHAR(9) + '@password = ''{Please provide the password here}''' + CHAR(13)
    ELSE
      BEGIN
        SET @msgStatement = @msgStatement + 'EXEC sp_addrole' + CHAR(13) + CHAR(9) + '@rolename ''' + @DatabaseRoleName + '''' + CHAR(13)
        PRINT 'GO'
      END
    SET @msgStatement = @msgStatement + '--Set Object Specific Permissions For Role'
    PRINT @msgStatement
    DECLARE _sySobjects CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
    SELECT DISTINCT ([sySobjects].[Id]),
                    '[' + User_name([sySobjects].[uId]) + '].[' + [sySobjects].[Name] + ']'
    FROM   [dbo].[sysProtects]
           INNER JOIN [dbo].[sySobjects]
             ON [sysProtects].[Id] = [sySobjects].[Id]
    WHERE  [sysProtects].[uId] = @DatabaseRoleID
    OPEN _sySobjects
    FETCH NEXT FROM _sySobjects
    INTO @ObjectID,
         @ObjectName
    WHILE @@FETCH_STATUS = 0
      BEGIN
        SET @msgStatement = ''
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 193
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'SELECT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 195
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'INSERT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 197
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'UPDATE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 196
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'DELETE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 224
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'EXECUTE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 26
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'REFERENCES,'
        IF len(@msgStatement) > 0
          BEGIN
            IF RIGHT(@msgStatement,1) = ','
              SET @msgStatement = LEFT(@msgStatement,Len(@msgStatement) - 1)
            SET @msgStatement = 'GRANT' + CHAR(13) + CHAR(9) + @msgStatement + CHAR(13) + CHAR(9) + 'ON ' + @ObjectName + CHAR(13) + CHAR(9) + 'TO ' + @DatabaseRoleName
            PRINT @msgStatement
          END
        SET @msgStatement = ''
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 193
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'SELECT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 195
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'INSERT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 197
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'UPDATE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 196
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'DELETE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 224
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'EXECUTE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 26
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'REFERENCES,'
        IF len(@msgStatement) > 0
          BEGIN
            IF RIGHT(@msgStatement,1) = ','
              SET @msgStatement = LEFT(@msgStatement,Len(@msgStatement) - 1)
            SET @msgStatement = 'DENY' + CHAR(13) + CHAR(9) + @msgStatement + CHAR(13) + CHAR(9) + 'ON ' + @ObjectName + CHAR(13) + CHAR(9) + 'TO ' + @DatabaseRoleName
            PRINT @msgStatement
          END
        FETCH NEXT FROM _sySobjects
        INTO @ObjectID,
             @ObjectName
      END
    CLOSE _sySobjects
    DEALLOCATE _sySobjects
    PRINT 'GO'
  END

GO
/****** Object:  StoredProcedure [Maintenance].[pFamilyMemberStartsNewHousehold]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member starts a new household. This is really only removing 
them from their current household since the record type is the same for client and family members. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pFamilyMemberStartsNewHousehold](
	@ClientPersonID int, -- The old client that the person moving is associated with.
	@FamilyToClientPersonID int,--The person who is creating a  new household.
	@ModifiedBy name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int,
	@Notes NVarchar(100),
	@ErrNo int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;
	SET @ErrNo =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--We first check to be sure that the @FamilyToClientPersonID is in the db
	--Check to see that the old @ClientToPersonID is in the db
	 --if either fails, then bail!
	--Place a record in the Journal Table with the appropriate information before making the change. 
	--Remove the new client from the FamilyRelationship table
	--Make update to  Family relationships table table for new family status. This will probably be blank since we will 
	--want the family to be created on the new query.
	 

	

	 --We need them BOTH to be in the FamilyRelationship table in the same record, else the system does not know that they are related!
		IF EXISTS(SELECT * from person.FamilyRelationships where PersonID =@FamilyToClientPersonID AND ClientPersonID=@ClientPersonID)
			BEGIN
				--Create a string to pass into notes in journal
				SET @Notes = 'Create new household for Person = ' + @FamilyToClientPersonID + 'Previous Household''s Head = ' + @ClientPersonID + 'old household tie removed from FamilyRelationships table'
				
				 					--Time to remove the person. We need to only remove them from the FamilyRelationships table. They will have to Certify when they come in.
						
					DELETE FROM Person.FamilyRelationships WHERE PersonID = @FamilyToClientPersonID AND ClientPersonID = @ClientPersonID
					
					SELECT @ErrNo=@@ERROR
					
					IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Failed on Delete Family Member PersonID: ' + CONVERT(NVarchar(50),@FamilyToClientPersonID)
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
						
				--Make Journal Entry. We are ignoring potential errors from journal for the time being. 
				 EXEC pInsertJournalClientFamilyChanges @FamilyToClientPersonID,@ClientPersonID,0,'New Household Created','',@ModifiedBY,@Success OUTPUT,@ErrorStatus OUTPUT
				 
					
			
			END
		ELSE
			BEGIN
				SET @ErrorStatus ='Client/House member not matched FamRel tab : ' + CONVERT(NVarchar(50),@FamilyToClientPersonID) + ' ' + CONVERT(NVarchar(50),@ClientPersonID)
							RAISERROR(@ErrorStatus,16,0)
			
			END
	
	
	/******************************************************************************************************
	 
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [Maintenance].[pGrantViewDefinitionsforUDTs]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Maintenance].[pGrantViewDefinitionsforUDTs] 
	
AS
BEGIN

DECLARE

@UDTName NVarchar(30),
@SchemaID int,
@SchemaName NVarchar(30),
@Cnt int,
@NumRec int,
@ExecString NVarchar(200)



CREATE TABLE #TempTable (counts INT identity,name Varchar(50),SchemaID int)
INSERT INTO #TempTable  SELECT name,schema_id FROM sys.Types 
WHERE is_user_defined = 1

SELECT @NumRec = MAX(Counts) from #TempTable

SET @Cnt =1

While @Cnt <= @NumRec
	BEGIN
		SELECT @UDTName =name, @SchemaID =SCHEMAID from #TempTable where counts =@Cnt
	
		SELECT @SchemaName =name from sys.schemas where schema_id =@SchemaID
	
	SET @ExecString =	'GRANT VIEW DEFINITION ON TYPE::[' + @SchemaName + '].' + @UDTNAME + ' TO db_CrystalReports'
	
	EXEC (@ExecString)
	
	SET @Cnt = @Cnt +1
	
	END 
Drop Table #TempTable
	
END


GO
/****** Object:  StoredProcedure [Maintenance].[pHideAddressType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUAddressType
Description: Suppresses from LUAddressType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideAddressType](
	@AddressTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@AddressTypeID = 0) OR (@AddressTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 AddressTypeID cannot be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempAddressTypeID =@AddressTypeID
				  FROM person.LUAddressType
					 WHERE  AddressTypeID= @AddressTypeID
			
								 
				IF ((@TempAddressTypeID=0) OR (@TempAddressTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 AddressTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUAddressType
					 SET IsDeleted =1
					 WHERE AddressTypeID = @AddressTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail AddressType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideCity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date:21 July 2011
*Table Name: LUCity
Description: Hides row in LUCity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideCity](
	@CityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@CityID = 0) OR (@CityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60055 CityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempCityID =@CityID
				  FROM person.LUCity
					 WHERE  CityID= @CityID
			
								 
				IF ((@TempCityID=0) OR (@TempCityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60058 CityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

					UPDATE  Person.LUCity SET IsDeleted =1
					 WHERE CityID = @CityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60053 DELETE Fail City';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideContactType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUContactType
Description: Hides LUContactType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideContactType](
	@ContactTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempContactTypeID int
	
	SET @TempContactTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ContactTypeID = 0) OR (@ContactTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60025 ContactTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempContactTypeID =ContactTypeID
				  FROM person.LUContactType
					 WHERE  ContactTypeID= @ContactTypeID
			
								 
				IF ((@TempContactTypeID=0) OR (@TempContactTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60028 ContactTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUContactType
					 SET IsDeleted =1
					 WHERE ContactTypeID = @ContactTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60023 DELETE Fail ContactType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideEducationCategory]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUEducationCategory
Description: Hides LUEducationCategory
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideEducationCategory](
	@EducationCategoryID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEducationCategoryID int

	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EducationCategoryID = 0) OR (@EducationCategoryID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 EducationCategoryID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationCategoryID = @TempEducationCategoryID
			
								 
				IF ((@TempEducationCategoryID=0) OR (@TempEducationCategoryID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60078 EducationCategoryID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE   Person.LUEducationCategory
					 SET IsDeleted =1
					 WHERE EducationCategoryID = @EducationCategoryID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60073 DELETE Fail EducationCategory';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideEthnicity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUEthnicity
Description: Hides LUEthicity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideEthnicity](
	@EthnicityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EthnicityID = 0) OR (@EthnicityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 EthnicityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEthnicityID =EthnicityID  
				  FROM person.LUEthnicity
					 WHERE EthnicityID = @TempEthnicityID
			
								 
				IF ((@TempEthnicityID=0) OR (@TempEthnicityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 EthnicityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUEthnicity
					 SET IsDeleted =1
					 WHERE EthnicityID = @EthnicityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail Ethnicity';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideFamilyStatusType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Hides LUFamilyStatusType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideFamilyStatusType](
	@FamilyStatusTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyStatusTypeID int
	
	SET @FamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 FamilyStatusTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @FamilyStatusTypeID =FamilySTatusTypeID  
				  FROM person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
			
								 
				IF ((@TempFamilyStatusTypeID=0) OR (@TempFamilyStatusTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 FamilySTatusTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUFamilyStatusType
					 SET IsDeleted =1
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuFamilyStatusType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END















GO
/****** Object:  StoredProcedure [Maintenance].[pHideHouseholdTransferOptions]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: HouseholdTransferOptions
Description: Hides from HouseholdTransferOptions. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideHouseholdTransferOptions](
	@ActionToTakeID  int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID  =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ActionToTakeID = 0) OR (@ActionToTakeID  IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 ActionToTakeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempActionToTakeID =@ActionToTakeID 
				  FROM dbo.LUHouseholdTransferOptions
					 WHERE  HouseholdTransferActionID= @ActionToTakeID
			
								 
				IF ((@TempActionToTakeID=0) OR (@TempActionToTakeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 ActionToTakeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  dbo.LUHouseholdTransferOptions
					 SET IsDeleted =1	
					 WHERE HouseholdTransferActionID = @TempActionToTakeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail LUHouseholdTransferOptions';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHideHousingStatus]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July
*Table Name: LUHousingStatus
Description: Hides LUHousingStatus
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideHousingStatus](
	@HousingStatusID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@HousingStatusID = 0) OR (@HousingStatusID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 HousingStatusID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempHousingStatusID =HousingStatusID
				  FROM person.LUHousingStatus
					 WHERE  HousingStatusID= @HousingStatusID
			
								 
				IF ((@TempHousingStatusID=0) OR (@TempHousingStatusID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 HousingStatusID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUHousingStatus
					 SET IsDeleted =1
					 WHERE HousingStatusID = @HousingStatusID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail HousingStatus';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideIncomeSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUIncomeSource
Description: Hides LUIncomeSource
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideIncomeSource](
	@IncomeSourceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60095 IncomeSourceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempIncomeSourceID = IncomeSourceID 
				  FROM person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID
			
								 
				IF ((@TempIncomeSourceID=0) OR (@TempIncomeSourceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60098 IncomeSourceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE   Person.LUIncomeSource
					 SET IsDeleted =1
					 WHERE IncomeSourceID = @IncomeSourceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60093 DELETE Fail IncomeSource';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideInsuranceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUInsuranceType
Description: Hides LUInsuranceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideInsuranceType](
	@InsuranceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempInsuranceTypeID int
	
	SET @InsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 InsuranceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @InsuranceTypeID =InsuranceTypeID  
				  FROM person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID
			
								 
				IF ((@TempInsuranceTypeID=0) OR (@TempInsuranceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 InsuranceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUInsuranceType
					 SET IsDeleted =1
					 WHERE InsuranceTypeID = @InsuranceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuInsuranceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHideLanguage]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date:21 July 11
*Table Name: LULanguage
Description: Deletes from LULanguage
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideLanguage](
	@LanguageID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguageID = 0) OR (@LanguageID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 LanguageID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempLanguageID = LanguageID 
				  FROM person.LULanguage
					 WHERE LanguageID = @LanguageID
			
								 
				IF ((@TempLanguageID=0) OR (@TempLanguageID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60068 LanguageID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LULanguage
					 SET IsDeleted =1
					 WHERE LanguageID = @LanguageID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideLUFamilyRelationship]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUFamilyRelationship
Description: Hide LUFamilyRelationship
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideLUFamilyRelationship](
	@FamilyRelationshipID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyRelationshipID = 0) OR (@FamilyRelationshipID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempFamilyRelationshipID =FamilyRelationshipID
				  FROM person.LUFamilyRelationship
					 WHERE  FamilyRelationshipID= @FamilyRelationshipID
			
								 
				IF ((@TempFamilyRelationshipID=0) OR (@TempFamilyRelationshipID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60048 FamilyRelationshipID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUFamilyRelationship
					 SET IsDeleted =1
					 WHERE FamilyRelationshipID = @FamilyRelationshipID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60043 DELETE Fail FamilyRelationship';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHidePersonType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPersonType
Description: Hides LUPersonType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePersonType](
	@PersonTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PersonTypeID = 0) OR (@PersonTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 PersonTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPersonTypeID =PersonTypeID  
				  FROM person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID
			
								 
				IF ((@TempPersonTypeID=0) OR (@TempPersonTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 PersonTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUPersonType
					 SET IsDeleted =1
					 WHERE PersonTypeID = @PersonTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail PersonType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHidePhoneType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPhoneType
Description: HideLUPhoneType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePhoneType](
	@PhoneTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600085 PhoneTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPhoneTypeID =PhoneTypeID  
				  FROM person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID
			
								 
				IF ((@TempPhoneTypeID=0) OR (@TempPhoneTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600088 PhoneTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUPhoneType
					 SET IsDeleted =1
					 WHERE PhoneTypeID = @PhoneTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600083 DELETE Fail PhoneType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHidePostalCode]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUPostalCode
Description: Hides LUPostalCode
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePostalCode](
	@PostalCodeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPostalCodeID int
	
	SET @TempPostalCodeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PostalCodeID = 0) OR (@PostalCodeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6075 PostalCodeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPostalCodeID =PostalCodeID
				  FROM person.LUPostalCode
					 WHERE  PostalCodeID= @PostalCodeID
			
								 
				IF ((@TempPostalCodeID=0) OR (@TempPostalCodeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6078 PostalCodeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE Person.LUPostalCode
					 SET IsDeleted =1
					 WHERE PostalCodeID = @PostalCodeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6073 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideProgramServiceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Hides LUProgramServiceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideProgramServiceType](
	@ProgramServiceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6055 ProgramServiceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramServiceTypeID =ProgramServiceTypeID
				  FROM person.LUProgramServiceType
					 WHERE  ProgramServiceTypeID= @ProgramServiceTypeID
			
								 
				IF ((@TempProgramServiceTypeID=0) OR (@TempProgramServiceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6058 ProgramServiceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUProgramServiceType
					 SET IsDeleted =1
					 WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6053 DELETE Fail ProgramServiceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideProgramType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUProgramType
Description: Hides LUProgramType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideProgramType](
	@ProgramTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6045 ProgramTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramTypeID =ProgramTypeID
				  FROM person.LUProgramType
					 WHERE  ProgramTypeID= @ProgramTypeID
			
								 
				IF ((@TempProgramTypeID=0) OR (@TempProgramTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6048 ProgramTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUProgramType
					 SET IsDeleted =1
					 WHERE ProgramTypeID = @ProgramTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6043 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideRace]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LURace
Description: Hides LURace
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideRace](
	@RaceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@RaceID = 0) OR (@RaceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6025 RaceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempRaceID =RaceID
				  FROM person.LURace
					 WHERE  RaceID= @RaceID
			
								 
				IF ((@TempRaceID=0) OR (@TempRaceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6028 RaceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE Person.LURace
					 SET IsDeleted =1
					 WHERE RaceID = @RaceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6023 DELETE Fail Race';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideState]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Hides LUState
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideState](
	@StateID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@StateID = 0) OR (@StateID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6035 StateID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempStateID =StateID
				  FROM person.LUState
					 WHERE  StateID= @StateID
			
								 
				IF ((@TempStateID=0) OR (@TempStateID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6038 StateID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUState
					 SET IsDeleted =1
					 WHERE StateID = @StateID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6033 DELETE Fail State';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pMakeFamilyMemberClientinSameHousehold]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member replaces the current client and becomes the client. 
*We handle the client by either deleting (supressing) from the system, moving the client to another household, creating
*another household or by 'demoting' the client to family member. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pMakeFamilyMemberClientinSameHousehold](
	@ClientPersonID int,
	@PromoteToClientPersonID int,
	@ActionToTake nVarchar(10),
	@NewPersonID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int;
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--Make sure that the @ActionToTake value is valid. If not, bail!
	 
	-- Check the @PromoteToClientPersonID to ensure that the person to be promoted is associated with the current client.
		--If Not Valid, Bail
		--Else
			--all of the household member IDs from the FamilyRelationship table so that we can update the ClientPersonID to that of the new client.
			--Change the Family status of the new client to reflect that they are no longer child, spouse, etc, of the client
	
	
	--If this works, then we will deal with the old client.
	
	--"DEMOTE" If the old client is to become a member of the same household
		--We add them to the FamilyRelationship table and give them a FamilyMember entry
		 
	--If they are part of a new household, then we update any records in the familyRelationship table that has their ID and 
	--Remove any from the FamilyRelationship status as appropriate
	
	--"DELETE" We remove the client by setting the IsDeleted bit in the person table. We keep them in the system,but
	--they are no longer visible from a query.		
	
	--"NEWHOUSEHOLD" -- We create a new household and return the new household ID. May not even need to do that because we are 
	--really just removing their association with the current client. When the move is finished. The person inputting data will have
	--to query on the new record and create the appropriate household members.
	
	
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [Maintenance].[pMoveFamilyMemberToAnotherHousehold]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member moves to a new household. It assumes that if the 
person is the head of the old household, that another person has been promoted to head of that household already
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pMoveFamilyMemberToAnotherHousehold](
	@OldHouseholdClientPersonID int, -- The old client that the person moving is associated with.
	@NewHouseholdClientPersonID int,--Person moving to new household
	@ToNewHouseholdPersonID int,--The person who going to new household
	@NewFamilyStatusType NVarchar(50) = NULL,--This may or may not be used.
	@NewFamilyRelationshipID int =0, --May or may not be used.
	@NewFamilyRelationshipDescription NVarchar(50)=NULL, --This may or may not be used
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@ErrNo int
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @ErrNo =0;	

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--Place a record in the Journal Table with the appropriate information before making the change. 
	--Update the Relationship table with the new household's client ID and the new relationship
	--Make update to demographics table for new family status. 
	
				 EXEC dbo.pInsertJournalClientFamilyChanges @ToNewHouseholdPersonID,
															@OldHouseholdClientPersonID,
															@NewHouseholdClientPersonId,
															'Moved to new household',
															@NewFamilyRelationshipDescription,
															@ModifiedBy
															
					
						--Move to new household
						INSERT  Person.FamilyRelationships(PersonID,ClientPersonID,RelationshipID,RelationDescription,ModifiedDate,ModifiedBy)
							VALUES
								(@ToNewHouseholdPersonID,@NewHouseholdClientPersonID,@NewFamilyRelationshipID,@NewFamilyRelationshipDescription,SYSDATETIME(),@ModifiedBy)
						--Remove from old Household
						SELECT @ErrNo =@@ERROR 
				
							IF @ErrNo<>0
								BEGIN
									SET @ErrorStatus ='Failed Insert Move to new household'
									RAISERROR(@ErrorStatus,16,0)
							
								END
						
						DELETE FROM person.FamilyRelationships 
							WHERE PersonID = @ToNewHouseholdPersonID AND ClientPersonID=@OldHouseholdClientPersonID
								
							IF @ErrNo<>0
								BEGIN
									SET @ErrorStatus ='Failed Delete Move to new household'
									RAISERROR(@ErrorStatus,16,0)
								END
						
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [Maintenance].[pRestoreClientRecord]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a deleted person needs to be restored to the database. We just flip the IsDeleted bit.
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRestoreClientRecord](
	@tRestorePersonID BatchProcessPersonID READONLY,--The person/Household,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@ErrNo INT,
	@LogMsg NVarchar(50),
	@journalSuccess BIT,
	@JournalErrorStatus NVarchar(50),
	@ErrorCount int,
	@Notes NVarchar(50)
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @ErrNo =0;	
	SET @LogMsg ='Restored client record. ';
	SET @ErrorCount =0;
		
	           
BEGIN TRY
	DECLARE
	@RowCount int,
	@NumberRecs int,
	@tmpPersonID int,
	@tmpClientPersonID int
					
							
	SET @RowCount =1
					
								
					
	SELECT @NumberRecs = COUNT(*) FROM @tRestorePersonID --How many records?
						
						
		WHILE @RowCount <=@NumberRecs
			BEGIN
				BEGIN TRANSACTION;--TX for each individual record
				
				SET @Notes =''
				
				SELECT @tmpPersonID =PersonID 
					FROM @tRestorePersonID
					WHERE RowID =@Rowcount
			
			UPDATE Person.Person
				SET IsDeleted =0
				WHERE PersonID =@TmpPersonID
				
				SELECT @ErrNo =@@ERROR 
				
				 SET @RowCount = @RowCount + 1
				 
			IF @ErrNo<>0 OR @@ROWCOUNT =0 
				BEGIN
					SET @ErrorCount = @ErrorCount +1
					SET @ErrorStatus ='Fail RestoreID: ' + CONVERT(NVarchar(50),@TmpPersonID)+','
					SET @Notes ='Failed restore PersonID' + CONVERT(NVarchar(50),@TmpPersonID)
					 
					ROLLBACK TRANSACTION --Rollback only the one that failed!
				END--IF@ErrNO	 
			
			IF @@TRANCOUNT >0
				BEGIN
					COMMIT TRANSACTION
					SET @Notes ='Restored PersonID: '+ CONVERT(NVarchar(50),@TmpPersonID)
				END
				
			
			--Place a record in the Journal Table with the appropriate information before making the change. 	
			 EXEC dbo.pInsertJournalClientFamilyChanges @TmpPersonID,
											0,--@HeadofHouseholdPersonID not needed
											0,--@NewHeadOfHouseholdPersonID
											@LogMsg,
											@Notes,
											@ModifiedBy,
											@JournalSuccess,--we don't care about the return values of this and error status for time being
											@JournalErrorStatus	
			END --End While
			
	
		 IF @ErrorCount >0--This goes to the error trap for recording those that failed, but we do not rollback in the error trap.
			BEGIN
				RAISERROR(@ErrorStatus,16,0)
			END
			
			
					
				
						
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		
	
		END TRY

		BEGIN CATCH
			--We do not rollback here
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		

















GO
/****** Object:  StoredProcedure [Maintenance].[pRetrieveClientRecords]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 11 Jun 11

Description: Returns the names DOB  of queried records
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRetrieveClientRecords](
	@IsDeleted bit,
	@IsSoundsLike bit,
	@FirstName Name,--if complete query for all deleted, then we don't need names or dob
	@LastName Name,
	@DOB DateTime,
	@IsAllDeletedRecords bit,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
	DECLARE
	@ErrNO int
	
	SET @ErrNO =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
		
			IF @IsAllDeletedRecords = 1 AND @IsDeleted =1 
				BEGIN
					--Cannot retrieve one record AND all records!
					SET @ErrorStatus ='Error ISAllDeltetedRecords & IsDeleted mutually exclusive, both cannot be True: ' 
							RAISERROR(@ErrorStatus,16,0)
				END
			--return everyone who is delteted
			IF @IsAllDeletedRecords =1 
				BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.PersonID = B.PersonID) AND A.IsDeleted =1
				END
			--Just one deleted	
			IF 	@IsDeleted =1
				BEGIN
				  SELECT A.FirstName, A.LastName, A.DateofBirth,
						 B.AddressLine1, b.City 
				  FROM person.[Person] AS A,
					    Person.Address as B
				  WHERE (A.PersonID = B.PersonID) AND FirstName = @FirstName AND LastName = @LastName AND DateOfBirth = @DOB AND IsDeleted =1
				END
			--Use soundex on last name to return deleted records like those	
			IF @IsDeleted =1 AND @IsSoundsLike =1
				BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.personid = B.personid) AND soundex(A.Lastname) =SOUNDEX(@LastName) AND A.IsDeleted =1
					
				END
					
			--Completely different query for non deleted record with soundex using both first and last name because IsDeleted =0 and we could have
			--a ton of Smiths!
			IF @IsDeleted =0 and @IsSoundsLike =1
				BEGIN
					BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.personid = B.personid) AND SOUNDEX(A.Lastname) =SOUNDEX(@LastName) AND SOUNDEX(a.Firstname) = SOUNDEX (@FirstName) AND A.IsDeleted =0
					
				END
				END		
				
				SELECT @ErrNO = @@ERROR
				
				IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Error on query: ' 
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
				
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @Errno because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @ErrNO <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNO);
					END
			  SET @Success =0;
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END















GO
/****** Object:  StoredProcedure [Maintenance].[pRetrieveLookupTables]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 11 Jun 11

Description: Returns the names of all look up tables in CV Connect
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRetrieveLookupTables](
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
	DECLARE
	@ErrNO int
	
	SET @ErrNO =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			
				SELECT * FROM sys.tables WHERE tables.name LIKE 'LU'+'%'
				SELECT @ErrNO =@@ERROR
				
				IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Failed on LU table return: ' 
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
				
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Signature].[pInsertSignature]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Signature.Signatures and Signature.Signature
Description: The signature history for each client must be kept in the signature table,thus there is an interchange
table called signatures that creates the relationship ties between the person and signature table.This procedure first
insterts to Singnature, retrieves the new SignatureID and makes the tie by inserting a row in the Signatures table. 
We do not need to do updates to this procedure since a new row must always be generated for the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [Signature].[pInsertSignature](
	@PersonID int,
	@Signature varChar(MAX),
	@ModifiedBy Name,
	@NewSignatureID int Output,
	@NewSignaturesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS

Set NoCount ON;


	DECLARE
	@TempSignatureID int,
	@TempPersonID int,
	@ProcedureLocation varchar,
	@TempSignaturesID int;
	
	
	SET @TempSignatureID =0;
	SET @TempPersonID =0;
	SET @TempSignaturesID =0;
	SET @Success = 0;
	SET @ProcedureLocation ='';
	SET @ErrorStatus ='';
	
	          

BEGIN TRANSACTION; --We will wrap both inserts in the same transaction to avoid orphaned data
  BEGIN TRY
  /****************************************************************************/
	--Check to see if this person already has a signaure. This is not required with the current procedure but 
	--is potentially required in the future so it remains. 	
		SELECT @TempPersonID = @PersonID
		  FROM Signature.Signature
			 WHERE Signature.PersonID = @PersonID 

/****************************************************************************/
  
	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = @@ERROR + '-4000'; --Range for Signature/Signatures
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END

	   BEGIN
	  				
					INSERT INTO Signature.Signature(PersonID,Signature.Signature,ModifiedDate, ModifiedBy)
						VALUES (@PersonID,@Signature,SYSDATETIME(),@ModifiedBy)
					
					SET @TempSignatureID =@@IDENTITY;
					SET @ErrorStatus =@@ERROR;
					SET @ProcedureLocation = 'Signature';
				
				 If @ErrorStatus = 0
					BEGIN	
						INSERT INTO Signature.signatures(PersonID, SignatureID, ModifiedDate, ModifiedBy)
							Values (@PersonID, @TempSignatureID,SYSDATETIME(),@ModifiedBy)
							
							SET @TempSignaturesID = @@IDENTITY;
							SET @ErrorStatus =@@ERROR; 
							SET @ProcedureLocation ='Signatures';
					END		
				IF @ErrorStatus =0
					BEGIN	
						SET @ProcedureLocation='';
						SET @success =1;
						COMMIT TRANSACTION;
					END
				ELSE
					BEGIN
						SELECT @ProcedureLocation = 'Insert failed at:' +@ProcedureLocation;
						RAISERROR( @ProcedureLocation,16,1);
					END 
		END
	END TRY
	

		BEGIN CATCH
		--Add in some granularity by returning an error id that indicates whether the failure was in Signature or Signatures.
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SELECT @ProcedureLocation = @ProcedureLocation + '4001 ' +@ErrorStatus;
			  SET @Success =0;
			  RAISERROR(@ProcedureLocation, 16, 1);
			 
		END CATCH;

		
	














GO
/****** Object:  UserDefinedFunction [dbo].[ActionToTake]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gary Savard
-- Create date: 28 April 11
-- Description:	This function validates the actions to be taken when a household member becomes the client, etc.
--				If the input value is valid, then the function returns 1, if not, 0.
-- =============================================
CREATE FUNCTION [dbo].[ActionToTake]
(
	@Source NVarchar(8)
	
)
RETURNS int
AS
BEGIN
	DECLARE
	@Result int,
	@Temp NVarchar(8)
	
	SET @Result =0;
	SET @Temp ='';
	
	
	SELECT @Temp = LTRIM(RTRIM(@Source));--Clean any spaces out
	
	IF @Temp = 'DEMOTE'
		SET @Result = 1; 
	ELSE IF @Temp ='DELETE'	
		SET @Result = 1; 
	ELSE IF @Temp ='NEWHOUSEHOLD'
		SET @Result = 1; 
	ELSE
		SET @Result =0;



	RETURN @Result;

END



GO
/****** Object:  UserDefinedFunction [dbo].[CheckRecertifyDate]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 10
-- Description:	This function determines whether a customer must recertify based on the 1 year criteria
-- The PersonID input is optional and, if it is zero then we just work based on the LastCertificationDate input
-- If the PersonID is >0 then we get the last certification date from the foodshelf.foodshelfcertification table and ignore
--the input date.
-- =============================================
CREATE FUNCTION [dbo].[CheckRecertifyDate]
(
	@PersonID int =0, --We can just do the calculation based on input date time, or by getting from the Foodshelf.FoodshelfCertification table
	@LastCertificationDate DateTime
	
)
RETURNS bit
AS
BEGIN
	DECLARE
	@Result BIT,
	@TempDate DATETIME
	SET @Result =0; --Could debate whether 0 or 1 is better for default.
	SET @TempDate =SYSDATETIME();
	
	IF @PersonID =0
	BEGIN
		IF (DATEDIFF(DD,@LastCertificationDate,SYSDATETIME()) >= 365)
			BEGIN
				SET	@Result =1;
				RETURN @RESULT;
			END
		ELSE
			BEGIN
				SET @Result =0;
				RETURN @Result;
			END
	END
	
	ELSE 
		BEGIN
		 SELECT @TempDate = MAX(LastCertificationDate) 
			FROM Foodshelf.FoodShelfCertification Where PersonID = @PersonID 
			  
			IF (DATEDIFF(DD,@TempDate,SYSDATETIME()) >= 365)
			BEGIN
				SET	@Result =1;
				RETURN @RESULT;
			END
		ELSE
			BEGIN
				SET @Result =0;
				RETURN @Result;
			END
		END
	
	
	RETURN @Result;

END



GO
/****** Object:  UserDefinedFunction [dbo].[MyActionToTake]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select max(DateOfBirth) AS MaxDOB, min(DateOfBirth) AS MinDOB, 
--avg(cast(DateOfBirth as int)) AS AvgDOB from Person.Person

----------------------------------------------------
-- Temp table to show rtrim and ltrim
--Create the temp table
--CREATE TABLE #trimExample (COL1 VARCHAR(10));
--GO
----Populate the table
--INSERT INTO #trimExample (COL1)
--VALUES ('a  '),('b  '),('  c'),('  d  ');

----Select the values using the functions
--SELECT COL1, '*' + RTRIM(COL1) + '*' AS "RTRIM",
--    '*' + LTRIM(COL1) + '*' AS "LTRIM"
--FROM #trimExample;

----Clean up
--DROP TABLE #trimExample;
----------------------------------------------------

--SELECT LastName,LEFT(LastName,5) AS "LEFT",
--    RIGHT(LastName,4) AS "RIGHT"
--FROM Person.Person

CREATE FUNCTION [dbo].[MyActionToTake] (@Source NVarchar(8))
RETURNS int AS
BEGIN
    DECLARE @Result int, @Temp NVarchar(8);
    SET @Result = 0;
    SET @Temp = '';

    -- Remove any spaces
    SELECT @Temp = RTRIM(LTRIM(@Source));

    IF @Temp = 'DEMOTE'
        SET @Result = 1;
    ELSE IF @Temp = 'DELETE'
        SET @Result = 1;
    ELSE IF @Temp = 'NEWHOUSEHOLD'
        SET @Result = 1;
    ELSE
        SET @Result = 0;

    RETURN @Result
END

GO
/****** Object:  UserDefinedFunction [dbo].[ValidateDataSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 10
-- Description:	This function takes in a set of possible values for origin of a new record: FOOD,WX,MICRO,TENANT,COMMACT
--				If the input value is valid, then the function returns 1, if not, 0.
-- =============================================
CREATE FUNCTION [dbo].[ValidateDataSource]
(
	@Source NVarchar(8)
	
)
RETURNS int
AS
BEGIN
	DECLARE
	@Result int,
	@Temp NVarchar(8)
	
	SET @Result =0;
	SET @Temp ='';
	
	
	SELECT @Temp = LTRIM(RTRIM(@Source));--Clean any spaces out
	
	IF @Temp = 'FOOD'
		SET @Result = 1; 
	ELSE IF @Temp ='WX'	
		SET @Result = 1; 
	ELSE IF @Temp ='MICRO'
		SET @Result = 1; 
	ELSE IF @Temp ='TENANT'
		SET @Result = 1; 
	ELSE IF @Temp ='COMMACT'
		SET @Result = 1; 
	ELSE IF @Temp ='ADMIN'
		SET @Result =1;
	ELSE
		SET @Result =0;



	RETURN @Result;

END


GO
/****** Object:  Table [dbo].[GuidelinesByProgram]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidelinesByProgram](
	[GuidelinesID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GuidelinesByProgram] PRIMARY KEY CLUSTERED 
(
	[GuidelinesID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HouseholdTransferRequest]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdTransferRequest](
	[ClientMaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[OriginalClientID] [int] NULL,
	[HouseholdMemberToMoveID] [int] NOT NULL,
	[NewClientID] [int] NOT NULL,
	[ActionRequested] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalClientFamilyChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalClientFamilyChanges](
	[JournalClientFamilyChangesID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdMembersID] [int] NOT NULL,
	[PreviousClientsID] [int] NULL,
	[NewClientsID] [int] NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalLookupTableChanges]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalLookupTableChanges](
	[JournalLookupTableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUHouseholdTransferOptions]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUHouseholdTransferOptions](
	[HouseholdTransferActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionToTake] [nvarchar](50) NOT NULL,
	[ActionToTakeDescription] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUStateFederalProgram]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUStateFederalProgram](
	[StateFederalProgramID] [int] IDENTITY(1,1) NOT NULL,
	[IsFederal] [bit] NOT NULL,
	[ProgramName] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUStateFederalProgram] PRIMARY KEY CLUSTERED 
(
	[StateFederalProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] NOT NULL,
	[OrganizationName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramGuidelines]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramGuidelines](
	[ProgramGuidelinesID] [int] IDENTITY(1,1) NOT NULL,
	[GuidelinesID] [int] NOT NULL,
	[Guideline1] [nvarchar](max) NOT NULL,
	[Guideline2] [nvarchar](max) NULL,
	[Guideline3] [nvarchar](max) NULL,
	[Guideline4] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProgramGuidelines] PRIMARY KEY CLUSTERED 
(
	[ProgramGuidelinesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodShelfCertification]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodShelfCertification](
	[FoodShelfCertificationID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[CertificationTextID] [int] NOT NULL,
	[LastCertificationDate] [datetime] NOT NULL,
	[IsPaperCertification] [bit] NULL,
	[PaperCertificationDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FoodShelfCertification_1] PRIMARY KEY CLUSTERED 
(
	[FoodShelfCertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_FoodShelfCertification] UNIQUE NONCLUSTERED 
(
	[FoodShelfCertificationID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodshelfRules]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodshelfRules](
	[FoodshelfRulesID] [int] IDENTITY(1,1) NOT NULL,
	[FoodshelfRules] [nvarchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodTypeGiven]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodTypeGiven](
	[PersonID] [int] NOT NULL,
	[FoodTypeGivenID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[FoodGiven] [Foodshelf].[GroceryOrBreadProduce] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FoodTypeGiven] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[FoodTypeGivenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_FoodTypeGiven] UNIQUE NONCLUSTERED 
(
	[FoodTypeGivenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_FoodTypeGivenRecord] UNIQUE NONCLUSTERED 
(
	[FoodTypeGivenID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[HouseholdNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[HouseholdNotes](
	[HouseholdNotesID] [int] IDENTITY(1,1) NOT NULL,
	[ClientPersonID] [int] NOT NULL,
	[HouseholdMemberPersonID] [int] NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[HouseholdNotesID] ASC,
	[ClientPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[LUCertificationText]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[LUCertificationText](
	[CertificationTextID] [int] IDENTITY(1,1) NOT NULL,
	[CertificationText] [nvarchar](max) NOT NULL,
	[GuidelinesText] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[Signature]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Foodshelf].[Signature](
	[SignatureID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[FoodShelfCertificationID] [int] NOT NULL,
	[Signature] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signature] PRIMARY KEY CLUSTERED 
(
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Signature] UNIQUE NONCLUSTERED 
(
	[SignatureID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Maintenance].[UserModifiableTables]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Maintenance].[UserModifiableTables](
	[UserModifiableTablesID] [int] IDENTITY(1,1) NOT NULL,
	[FromSchema] [nvarchar](30) NOT NULL,
	[FromTable] [nchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Message].[Msg]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Message].[Msg](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [dbo].[Name] NULL,
	[ErrMsg] [varchar](50) NULL,
	[ErrNo] [varchar](50) NULL,
	[StoredProcedure] [varchar](100) NULL,
	[inputValues] [varchar](max) NULL,
	[ErrDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Person].[Address]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[County] [nvarchar](30) NULL,
	[State] [nvarchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NULL,
	[AddressTypeID] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Demographics]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Demographics](
	[DemographicsID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[EducationCategoryID] [int] NULL,
	[HousingStatus] [nvarchar](50) NULL,
	[NumberInHousehold] [int] NULL,
	[Gender] [nvarchar](2) NULL,
	[Race] [nvarchar](20) NULL,
	[CountryOfOrigin] [nvarchar](70) NULL,
	[Ethnicity] [nvarchar](20) NULL,
	[Disability] [dbo].[NoYesMaybe] NOT NULL,
	[CSFP] [dbo].[NoYesMaybe] NOT NULL,
	[Veteran] [dbo].[NoYesMaybe] NOT NULL,
	[HealthInsurance] [dbo].[NoYesMaybe] NOT NULL,
	[FamilyStatusType] [nvarchar](50) NULL,
	[InsuranceType] [nvarchar](50) NULL,
	[FoodStamps] [dbo].[NoYesMaybe] NOT NULL,
	[HomeboundDelivery] [dbo].[NoYesMaybe] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK__Deomogra__E81ABA19151B244E] PRIMARY KEY CLUSTERED 
(
	[DemographicsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[FamilyRelationships]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[FamilyRelationships](
	[FamilyRelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ClientPersonID] [int] NOT NULL,
	[RelationshipID] [int] NOT NULL,
	[RelationDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FamilyRelationships] PRIMARY KEY CLUSTERED 
(
	[FamilyRelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_FamilyRelationships] UNIQUE NONCLUSTERED 
(
	[ClientPersonID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Income]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Income](
	[IncomeSourceRowID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeSourceID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED 
(
	[IncomeSourceRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_IncomeSource] UNIQUE NONCLUSTERED 
(
	[IncomeSourceRowID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LanguagesSpoken]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LanguagesSpoken](
	[LanguageID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[IsPrimaryLanguage] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[rowid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LanguagesSpokenID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LanguagesSpoken] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUAddressType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUAddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [nvarchar](10) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCity](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[CountyID] [int] NOT NULL,
	[PostalCodeID] [int] NOT NULL,
	[CityName] [nvarchar](30) NOT NULL,
	[CityAbbreviation] [nvarchar](30) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUContactType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCountryOfOrigin]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCountryOfOrigin](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryAbbreviation] [nvarchar](50) NULL,
	[CountryName] [nvarchar](70) NOT NULL,
	[FIPSCode] [nvarchar](2) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCounty]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCounty](
	[CountyID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CountyName] [nvarchar](20) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUCounty] PRIMARY KEY CLUSTERED 
(
	[CountyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_LUCounty] UNIQUE NONCLUSTERED 
(
	[CountyID] ASC,
	[CityID] ASC,
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUEducationCategory]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUEducationCategory](
	[EducationCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[EducationLevel] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUEthnicity]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUEthnicity](
	[EthnicityID] [int] IDENTITY(1,1) NOT NULL,
	[EthnicityAbbreviation] [nvarchar](20) NOT NULL,
	[EthnicityDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUFamilyRelationship]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUFamilyRelationship](
	[FamilyRelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipCode] [nvarchar](30) NOT NULL,
	[RelationshipDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUFamilyStatusType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUFamilyStatusType](
	[FamilyStatusTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyStatusType] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUHousingStatus]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUHousingStatus](
	[HousingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[HousingStatus] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUIncomeSource]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUIncomeSource](
	[IncomeSourceID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeSourceAbbreviation] [nvarchar](20) NOT NULL,
	[IncomeSourceDescription] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUInsuranceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUInsuranceType](
	[InsuranceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceType] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LULanguage]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LULanguage](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPersonType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPersonType](
	[PersonTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonType] [nvarchar](20) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPhoneType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPhoneType](
	[PhoneTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPostalCode]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPostalCode](
	[PostalCodeID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUPostalCode] PRIMARY KEY CLUSTERED 
(
	[PostalCodeID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUProgramServiceType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUProgramServiceType](
	[ProgramServiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](20) NOT NULL,
	[ServiceDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUProgramType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUProgramType](
	[ProgramTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [nvarchar](20) NOT NULL,
	[ProgramDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LURace]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LURace](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceAbbreviation] [nvarchar](20) NOT NULL,
	[RaceDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUState]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](2) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_State_StateID] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Notes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Notes](
	[HouseholdNotesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[HouseholdNotesID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Person].[Person]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [dbo].[Name] NOT NULL,
	[MiddleName] [dbo].[Name] NULL,
	[LastName] [dbo].[Name] NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[DateOfBirth] [datetime] NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[EmailContactPreference] [dbo].[NoYes] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [dbo].[NoYes] NULL,
 CONSTRAINT [PK_Person_PersonID] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[PersonAddresses]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[PersonAddresses](
	[AddressID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_PersonAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Phone]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Phone](
	[PhoneID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[PhoneNumber] [dbo].[Phone] NOT NULL,
	[PhoneExtension] [nvarchar](8) NULL,
	[PhoneType] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Programs]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Programs](
	[ProgramsID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[ProgramServicesUsed]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[ProgramServicesUsed](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ProgramServiceID] [int] NOT NULL,
 CONSTRAINT [PK_ProgramServicesUsed_1] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[PersonID] ASC,
	[ProgramID] ASC,
	[ProgramServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PK_ProgramService] UNIQUE NONCLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_ProgramServicesUsed] UNIQUE NONCLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Signature].[Signature]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Signature].[Signature](
	[SignatureID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[Signature] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signature] PRIMARY KEY CLUSTERED 
(
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Signature] UNIQUE NONCLUSTERED 
(
	[SignatureID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Signature].[Signatures]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Signature].[Signatures](
	[SignaturesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[SignatureID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signatures] PRIMARY KEY CLUSTERED 
(
	[SignaturesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Signatures] UNIQUE NONCLUSTERED 
(
	[SignaturesID] ASC,
	[PersonID] ASC,
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SSN].[SSN]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSN].[SSN](
	[SSNID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[SSN] [nvarchar](9) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_SSN] PRIMARY KEY CLUSTERED 
(
	[SSNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_SSN] UNIQUE NONCLUSTERED 
(
	[SSN] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[LUVolunteerJobType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Volunteer].[LUVolunteerJobType](
	[VolunteerJobTypeID] [int] IDENTITY(1,1) NOT NULL,
	[JobType] [varchar](50) NOT NULL,
	[JobDescription] [varchar](100) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Volunteer].[LUVolunteerType]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[LUVolunteerType](
	[VolunteerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerType] [nvarchar](20) NOT NULL,
	[VolunteerTypeDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerContactInformation]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerContactInformation](
	[ContactInformationID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[ContactPersonID] [int] NOT NULL,
	[DepartmentID] [int] NULL,
	[ContactFirstName] [dbo].[Name] NOT NULL,
	[ContactLastName] [dbo].[Name] NOT NULL,
	[ContactDOB] [datetime] NULL,
	[ContactAddress1] [nvarchar](max) NULL,
	[ContactAddress2] [nvarchar](max) NULL,
	[ContactHomePhone] [dbo].[Phone] NULL,
	[ContactWorkPhone] [dbo].[Phone] NULL,
	[ContactCellPhone] [dbo].[Phone] NULL,
	[ContactPager] [nvarchar](20) NULL,
	[ContactEmail] [nvarchar](50) NULL,
	[VolunteerTypeID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerContactInformation] PRIMARY KEY CLUSTERED 
(
	[VolunteerPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerDepartment]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerDepartment](
	[DeptTableID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[ParentDepartmentID] [int] NULL,
	[DepartmentDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeptTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerEmergencyContact]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerEmergencyContact](
	[VolunteerEmergencyContactID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[ContactInformation] [nvarchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerJobs]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerJobs](
	[VolunteerJobsID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[Job] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerNotes]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Volunteer].[VolunteerNotes](
	[VolunteerNotesID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Volunteer].[VolunteerScheduleDayTime]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleDayTime](
	[VolunteerScheduleDayTimeID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerScheduleWeekID] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[AvailableBeginTime] [time](7) NOT NULL,
	[AvailableEndTime] [time](7) NOT NULL,
	[IsNoShow] [bit] NOT NULL,
	[ActualHoursTotal] [numeric](18, 0) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerScheduleMonth]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleMonth](
	[VolunteerScheduleMonthID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerScheduleMonth] PRIMARY KEY CLUSTERED 
(
	[VolunteerScheduleMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerScheduleWeek]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleWeek](
	[VolunteerScheduleWeekID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerScheduleMonthID] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerScheduleWeek] PRIMARY KEY CLUSTERED 
(
	[VolunteerScheduleWeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[FetchActiveVolunteers]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-27
-- Description:	Get VolunteerPersonID's of persons in the volunteerContactInformation table that have their active bit set.
-- =============================================
CREATE FUNCTION [dbo].[FetchActiveVolunteers] ()

RETURNS TABLE 
AS
RETURN 
(
	WITH ActiveCTE AS 
    (
        SELECT VolunteerPersonID FROM Volunteer.VolunteerContactInformation
        WHERE IsActive = 1
    )
    SELECT VolunteerPersonID FROM ActiveCTE
)

GO
/****** Object:  UserDefinedFunction [dbo].[FetchChildDepartments]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FetchChildDepartments](@DepartmentID int)
RETURNS TABLE
AS
RETURN
    WITH ParentDepartment AS 
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription 
        FROM Volunteer.VolunteerDepartment
        WHERE DepartmentID = @DepartmentID
    ),
    ChildDepartment AS
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription
        FROM Volunteer.VolunteerDepartment
    )

    SELECT D1.DepartmentDescription AS "Parent Department", D2.DepartmentDescription AS "Child Department"
    FROM ParentDepartment AS D1
    INNER JOIN ChildDepartment AS D2
    ON D1.DepartmentID = D2.ParentDepartmentID


GO
/****** Object:  UserDefinedFunction [dbo].[FetchPersonInfo]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-26
-- Description:	Function to return the needed person info
-- =============================================
CREATE FUNCTION [dbo].[FetchPersonInfo] 
(
	-- Add the parameters for the function here
	@PersonID int
)
RETURNS TABLE 
AS
RETURN 
    WITH TEMPPerson
        AS (
            SELECT PersonID, FirstName, LastName, DateOfBirth, EmailAddress FROM Person.Person
            WHERE PersonID = @PersonID
        ),
        --SELECT * FROM TEMPPerson
        TEMPAddress
        AS (
            SELECT PersonID, AddressLine1 AS 'ContactAddreess1', AddressLine2 AS 'ContactAddreess2' FROM Person.Address
            WHERE PersonID = @PersonID
        ),
        TEMPPhone
        AS (
            SELECT PersonID,
            (SELECT PhoneNumber FROM Person.Phone
            WHERE PersonID = @PersonID AND PhoneType = 1) AS 'HomePhone',
            (SELECT PhoneNumber FROM Person.Phone
            WHERE PersonID = @PersonID AND PhoneType = 2) AS 'WorkPhone',
            (SELECT PhoneNumber FROM Person.Phone
            WHERE PersonID = @PersonID AND PhoneType = 3) AS 'CellPhone',
            (SELECT PhoneNumber FROM Person.Phone
            WHERE PersonID = @PersonID AND PhoneType = 6) AS 'Pager'
            FROM Person.Phone WHERE PersonID = @PersonID
        )

    SELECT DISTINCT P.PersonID AS 'VolunteerPersonID', P.FirstName AS 'ContactFirstName', P.LastName AS 'ContactLastName', P.DateOfBirth AS 'ContactDOB', 
        P.EmailAddress AS 'ContactEmail', A.ContactAddreess1 AS 'ContactAddress1', A.ContactAddreess2 AS 'ContactAddress2', PH.HomePhone AS 'ContactHomePhone', PH.WorkPhone AS 'ContactWorkPhone', 
        PH.CellPhone AS 'ContactCellPhone', PH.Pager AS 'ContactPager' FROM TEMPPerson AS P
    JOIN TEMPAddress AS A ON P.PersonID = A.PersonID
    JOIN TEMPPhone AS PH on P.PersonID = PH.PersonID



GO
/****** Object:  UserDefinedFunction [dbo].[FetchVolunteerContactInfo]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-25
-- Description:	Fetch volunteer contact information
-- =============================================
CREATE FUNCTION [dbo].[FetchVolunteerContactInfo] 
(	
	@PersonID int
)
RETURNS TABLE 
AS
RETURN 
(
	Select * From Volunteer.VolunteerContactInformation
    WHERE VolunteerPersonID = @PersonID
)

GO
/****** Object:  UserDefinedFunction [dbo].[GetGroceryHistory]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gary Savard
-- Create date: 14 April, 2011
-- Description:	Returns the number of times a client received groceries from the foodshelf in the past 6 months.
-- =============================================
CREATE FUNCTION [dbo].[GetGroceryHistory] 
(@PersonID int)
RETURNS TABLE 
AS
RETURN 
  select ReceivedDate from foodshelf.FoodTypeGiven where PersonID =@PersonID 
  and ReceivedDate between DATEADD(m,-6,(CONVERT(DATE,GETDATE()))) and CONVERT(DATE,GETDATE()) and FoodGiven =0;


GO
/****** Object:  View [dbo].[vGetFoodshelfRules]    Script Date: 10/16/2020 12:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetFoodshelfRules]
AS
SELECT     FoodshelfRules
FROM         Foodshelf.FoodshelfRules
WHERE     (ModifiedDate =
                          (SELECT     MAX(ModifiedDate) AS Expr1
                            FROM          Foodshelf.FoodshelfRules AS FoodshelfRules_1))

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_PersonLastName]    Script Date: 10/16/2020 12:23:26 PM ******/
CREATE NONCLUSTERED INDEX [idx_PersonLastName] ON [Person].[Person]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Person].[Address] ADD  CONSTRAINT [DF_Address_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[LanguagesSpoken] ADD  CONSTRAINT [DF_LanguagesSpoken_rowid]  DEFAULT (newid()) FOR [rowid]
GO
ALTER TABLE [Person].[LUAddressType] ADD  CONSTRAINT [DF_AddressType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[LUContactType] ADD  CONSTRAINT [DF_ContactType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[LUState] ADD  CONSTRAINT [DF_State_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Person] ADD  CONSTRAINT [DF_Person_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] ADD  CONSTRAINT [DF_VolSchedDayTime_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth] ADD  CONSTRAINT [DF_VolSchedMonth_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek] ADD  CONSTRAINT [DF_VolSchedWeek_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[GuidelinesByProgram]  WITH CHECK ADD  CONSTRAINT [FK_GuidelinesByProgram_LUStateFederalProgram] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[LUStateFederalProgram] ([StateFederalProgramID])
GO
ALTER TABLE [dbo].[GuidelinesByProgram] CHECK CONSTRAINT [FK_GuidelinesByProgram_LUStateFederalProgram]
GO
ALTER TABLE [dbo].[GuidelinesByProgram]  WITH CHECK ADD  CONSTRAINT [FK_GuidelinesByProgram_ProgramGuidelines] FOREIGN KEY([GuidelinesID])
REFERENCES [dbo].[ProgramGuidelines] ([ProgramGuidelinesID])
GO
ALTER TABLE [dbo].[GuidelinesByProgram] CHECK CONSTRAINT [FK_GuidelinesByProgram_ProgramGuidelines]
GO
ALTER TABLE [Foodshelf].[FoodShelfCertification]  WITH CHECK ADD  CONSTRAINT [FK_FoodShelfCertification_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[FoodShelfCertification] CHECK CONSTRAINT [FK_FoodShelfCertification_Person]
GO
ALTER TABLE [Foodshelf].[FoodTypeGiven]  WITH CHECK ADD  CONSTRAINT [FK_FoodTypeGiven_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[FoodTypeGiven] CHECK CONSTRAINT [FK_FoodTypeGiven_Person]
GO
ALTER TABLE [Foodshelf].[HouseholdNotes]  WITH CHECK ADD  CONSTRAINT [FK_HouseholdNotes_Person] FOREIGN KEY([ClientPersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[HouseholdNotes] CHECK CONSTRAINT [FK_HouseholdNotes_Person]
GO
ALTER TABLE [Foodshelf].[Signature]  WITH CHECK ADD  CONSTRAINT [FK_Signature_FoodShelfCertification] FOREIGN KEY([FoodShelfCertificationID], [PersonID])
REFERENCES [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID])
GO
ALTER TABLE [Foodshelf].[Signature] CHECK CONSTRAINT [FK_Signature_FoodShelfCertification]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Deomographics_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Deomographics_Person]
GO
ALTER TABLE [Person].[FamilyRelationships]  WITH CHECK ADD  CONSTRAINT [FK_FamilyRelationships_Person] FOREIGN KEY([ClientPersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[FamilyRelationships] CHECK CONSTRAINT [FK_FamilyRelationships_Person]
GO
ALTER TABLE [Person].[LanguagesSpoken]  WITH CHECK ADD  CONSTRAINT [FK_LanguagesSpoken_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[LanguagesSpoken] CHECK CONSTRAINT [FK_LanguagesSpoken_Person]
GO
ALTER TABLE [Person].[LUCity]  WITH CHECK ADD  CONSTRAINT [FK_LUCity_LUCounty] FOREIGN KEY([CountyID])
REFERENCES [Person].[LUCounty] ([CountyID])
GO
ALTER TABLE [Person].[LUCity] CHECK CONSTRAINT [FK_LUCity_LUCounty]
GO
ALTER TABLE [Person].[LUCounty]  WITH CHECK ADD  CONSTRAINT [FK_LUCounty_LUState] FOREIGN KEY([StateID])
REFERENCES [Person].[LUState] ([StateID])
GO
ALTER TABLE [Person].[LUCounty] CHECK CONSTRAINT [FK_LUCounty_LUState]
GO
ALTER TABLE [Person].[LUPostalCode]  WITH CHECK ADD  CONSTRAINT [FK_LUPostalCode_LUCity] FOREIGN KEY([CityID])
REFERENCES [Person].[LUCity] ([CityID])
GO
ALTER TABLE [Person].[LUPostalCode] CHECK CONSTRAINT [FK_LUPostalCode_LUCity]
GO
ALTER TABLE [Person].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_HouseholdNotes_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Notes] CHECK CONSTRAINT [FK_HouseholdNotes_Person]
GO
ALTER TABLE [Person].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Address] FOREIGN KEY([AddressID])
REFERENCES [Person].[Address] ([AddressID])
GO
ALTER TABLE [Person].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Address]
GO
ALTER TABLE [Person].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Person]
GO
ALTER TABLE [Person].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Phone] CHECK CONSTRAINT [FK_Phone_Person]
GO
ALTER TABLE [Person].[Programs]  WITH CHECK ADD  CONSTRAINT [FK_Programs_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Programs] CHECK CONSTRAINT [FK_Programs_Person]
GO
ALTER TABLE [Person].[ProgramServicesUsed]  WITH CHECK ADD  CONSTRAINT [FK_ProgramServicesUsed_Programs] FOREIGN KEY([PersonID], [ProgramID])
REFERENCES [Person].[Programs] ([PersonID], [ProgramID])
GO
ALTER TABLE [Person].[ProgramServicesUsed] CHECK CONSTRAINT [FK_ProgramServicesUsed_Programs]
GO
ALTER TABLE [Signature].[Signatures]  WITH CHECK ADD  CONSTRAINT [FK_Signatures_Signature1] FOREIGN KEY([SignatureID], [PersonID])
REFERENCES [Signature].[Signature] ([SignatureID], [PersonID])
GO
ALTER TABLE [Signature].[Signatures] CHECK CONSTRAINT [FK_Signatures_Signature1]
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerContactInformation_Department] FOREIGN KEY([DepartmentID])
REFERENCES [Volunteer].[VolunteerDepartment] ([DeptTableID])
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation] CHECK CONSTRAINT [FK_VolunteerContactInformation_Department]
GO
ALTER TABLE [Volunteer].[VolunteerEmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerEmergencyContact_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
ON DELETE CASCADE
GO
ALTER TABLE [Volunteer].[VolunteerEmergencyContact] CHECK CONSTRAINT [FK_VolunteerEmergencyContact_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerJobs]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerJobs_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
GO
ALTER TABLE [Volunteer].[VolunteerJobs] CHECK CONSTRAINT [FK_VolunteerJobs_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerNotes]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerNotes_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
GO
ALTER TABLE [Volunteer].[VolunteerNotes] CHECK CONSTRAINT [FK_VolunteerNotes_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleDayTime_VolunteerScheduleWeek] FOREIGN KEY([VolunteerScheduleWeekID])
REFERENCES [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID])
ON DELETE CASCADE
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] CHECK CONSTRAINT [FK_VolunteerScheduleDayTime_VolunteerScheduleWeek]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleMonth_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
ON DELETE CASCADE
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth] CHECK CONSTRAINT [FK_VolunteerScheduleMonth_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleWeek_VolunteerScheduleMonth] FOREIGN KEY([VolunteerScheduleMonthID])
REFERENCES [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID])
ON DELETE CASCADE
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek] CHECK CONSTRAINT [FK_VolunteerScheduleWeek_VolunteerScheduleMonth]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime]  WITH CHECK ADD  CONSTRAINT [CHK_VolunteerScheduleDayTime_DayOfWeek] CHECK  (([DayOfWeek]>=(1) AND [DayOfWeek]<=(7)))
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] CHECK CONSTRAINT [CHK_VolunteerScheduleDayTime_DayOfWeek]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth]  WITH CHECK ADD  CONSTRAINT [CHK_VolunteerScheduleMonth_Month] CHECK  (([Month]>=(1) AND [Month]<=(12)))
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth] CHECK CONSTRAINT [CHK_VolunteerScheduleMonth_Month]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek]  WITH CHECK ADD  CONSTRAINT [CHK_VolunteerScheduleWeek_Week] CHECK  (([Week]>=(1) AND [Week]<=(5)))
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek] CHECK CONSTRAINT [CHK_VolunteerScheduleWeek_Week]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the AdditionalContactInfo column in the Person.Contact table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'AdditionalContactInfoSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly Certification and Signature' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'FoodShelfCertification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Makes each row unique for those who utilize the service more than once' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'FoodTypeGiven', @level2type=N'CONSTRAINT',@level2name=N'UK_FoodTypeGivenRecord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the electronic signature capture table.' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID being used instead of the actual code because it may be possible to avoid duplicate addresses in the future' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The clientPersonID is the PersonID of the client. All in the household are stored here in the PersonID column, except for the client. This ties household members to the client' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'FamilyRelationships', @level2type=N'COLUMN',@level2name=N'ClientPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Table for Family Relationships. Data source is client' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'FamilyRelationships'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is called IncomeSourceRowID because we already have IncomeID from the LUIncomeType, avoid confusion!' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Income', @level2type=N'COLUMN',@level2name=N'IncomeSourceRowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Person can have multiple income sources, but we only want to record each source once, thus uniqueness' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Income', @level2type=N'CONSTRAINT',@level2name=N'UK_IncomeSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table lists all languages spoken by employee or volunteer' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LanguagesSpoken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for AddressType records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address type description. For example, Billing, Home, etc.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'AddressType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Types of addresses stored in the Address table. ' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'CONSTRAINT',@level2name=N'PK_AddressType_AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City for the hierarchy State, County City, PostalCode' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for ContactType records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'ContactTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contact type description.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup table containing the types of contacts stored in Contact.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'CONSTRAINT',@level2name=N'PK_ContactType_ContactTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the lookup table for Country of Origin for clients. The list is based on the CIA World Facts Book' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCountryOfOrigin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of counties' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCounty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Table for levels of education. Source is Client''s categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUEducationCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the ethnicity lookup table based on US Census Categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where the client gets income. Source is organization''s categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUIncomeSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the lookup table for race. It is based on US Census Categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LURace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for State records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'StateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO standard state code.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'StateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State lookup table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'CONSTRAINT',@level2name=N'PK_State_StateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Join table to allow multiple addresses per person' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'PersonAddresses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associates a person with a particluar program (division) within the organization' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Programs', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associates a person with one or more services within a program' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'ProgramServicesUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the electronic signature capture table. It lives in its own schema and may be encrypted for security reasons' , @level0type=N'SCHEMA',@level0name=N'Signature', @level1type=N'TABLE',@level1name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Only one SSN per person!' , @level0type=N'SCHEMA',@level0name=N'SSN', @level1type=N'TABLE',@level1name=N'SSN', @level2type=N'CONSTRAINT',@level2name=N'UK_SSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The types of jobs that the volunteer can do' , @level0type=N'SCHEMA',@level0name=N'Volunteer', @level1type=N'TABLE',@level1name=N'VolunteerJobs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "FoodshelfRules (Foodshelf)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetFoodshelfRules'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetFoodshelfRules'
GO
USE [master]
GO
ALTER DATABASE [ChamplainCharityLLC] SET  READ_WRITE 
GO
