USE [ChamplainCharityLLC]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[pVolunteerScheduleInsert]
		@VolPersonID = 245,
		@Month = 2,
		@Week = 3,
		@DayOfWeek = 2,
		@AvailBegTime = '06:00:00.0',
		@AvailEndTime = '15:00:00.0',
		@IsNoShow = 0,
		@ActualHoursTotal = 9,
		@VolModifiedBy = N'''RS'''

SELECT	'Return Value' = @return_value

GO
