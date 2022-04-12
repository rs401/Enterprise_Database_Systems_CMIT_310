USE [ChamplainCharityLLC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Richard Stadnick
-- Create date: 20/09/2020
-- Description:	Deletes volunteer contact information record
-- =============================================
CREATE PROCEDURE [dbo].[pDeleteVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
    @VolunteerPersonID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



    BEGIN TRANSACTION
	
		DELETE FROM Volunteer.VolunteerContactInformation
        WHERE VolunteerPersonID = @VolunteerPersonID
						

			
	COMMIT TRANSACTION
   
END



GO


