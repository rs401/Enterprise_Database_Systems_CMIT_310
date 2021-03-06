USE [ChamplainCharityLLC]
GO

DECLARE	@return_value int,
		@NewDayTimeID int

EXEC	@return_value = [dbo].[pInsertVolSchedDayTime]
		@VolSchedWeekID = 1,
		@DayOfWeek = 1,
		@AvailBegTime = '06:00:00.0',
		@AvailEndTime = '15:00:00.0',
		@IsNoShow = 0,
		@ActualHoursTotal = 22,
		@VolModifiedBy = N'RS',
		@NewDayTimeID = @NewDayTimeID OUTPUT

SELECT	@NewDayTimeID as N'@NewDayTimeID'

SELECT	'Return Value' = @return_value

GO
