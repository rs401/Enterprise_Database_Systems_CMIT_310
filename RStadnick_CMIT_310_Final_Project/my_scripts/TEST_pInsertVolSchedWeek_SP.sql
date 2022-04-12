USE [ChamplainCharityLLC]
GO

DECLARE	@return_value int,
		@NewWeekID int

EXEC	@return_value = [dbo].[pInsertVolSchedWeek]
		@VolSchedMonthID = 2,
		@Week = 1,
		@VolModifiedBy = N'RS',
		@NewWeekID = @NewWeekID OUTPUT

SELECT	@NewWeekID as N'@NewWeekID'

SELECT	'Return Value' = @return_value

GO
