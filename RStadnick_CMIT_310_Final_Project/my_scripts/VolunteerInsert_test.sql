USE [ChamplainCharityLLC]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[pVolunteerInsert]
		@PersonID = 186,
		@OrgID = 1,
		@VolTypeID = 1,
		@IsVolActive = 1,
		@VolNotes = N'Double Test note from pVolInsert',
		@VolJobDescription = N'Picks things up and puts them down, Part 2',
		@VolModifiedBy = N'RS'

SELECT	'Return Value' = @return_value

GO
