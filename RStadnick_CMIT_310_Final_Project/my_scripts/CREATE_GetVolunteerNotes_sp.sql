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
-- Author:		Richard Stadnick
-- Create date: 20-09-2020
-- Description:	Gather notes for a volunteer by name
-- =============================================
CREATE PROCEDURE pGetVolunteerNotes 
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
