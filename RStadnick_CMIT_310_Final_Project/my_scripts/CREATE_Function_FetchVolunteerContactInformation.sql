USE ChamplainCharityLLC
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-25
-- Description:	Fetch volunteer contact information
-- =============================================
CREATE FUNCTION FetchVolunteerContactInfo 
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
