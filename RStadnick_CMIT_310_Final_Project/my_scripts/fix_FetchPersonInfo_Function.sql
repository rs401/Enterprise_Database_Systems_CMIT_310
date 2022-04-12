USE [ChamplainCharityLLC]
GO

/****** Object:  UserDefinedFunction [dbo].[FetchPersonInfo]    Script Date: 10/3/2020 5:44:04 PM ******/
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


