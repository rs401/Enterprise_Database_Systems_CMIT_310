USE [ChamplainCharityLLC]
GO

DECLARE @NewID int;

exec pInsertVolSchedDayTime @VolSchedWeekID = 1,
		@DayOfWeek = 14,
		@AvailBegTime = '06:00:00.0',
		@AvailEndTime = '15:00:00.0',
		@IsNoShow = 0,
		@ActualHoursTotal = 22,
		@VolModifiedBy = N'RS',
		@NewDayTimeID = @NewID OUTPUT

SELECT @NewID