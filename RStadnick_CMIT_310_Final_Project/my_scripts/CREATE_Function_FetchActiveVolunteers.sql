USE [ChamplainCharityLLC]
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
-- Create date: 2020-09-27
-- Description:	Get VolunteerPersonID's of persons in the volunteerContactInformation table that have their active bit set.
-- =============================================
CREATE FUNCTION FetchActiveVolunteers ()

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
