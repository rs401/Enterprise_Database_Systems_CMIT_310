-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-27
-- Description:	Get volunteer contact information for all active volunteers.
-- =============================================
CREATE PROCEDURE pGetActiveVolunteerContactInfo 
	
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
