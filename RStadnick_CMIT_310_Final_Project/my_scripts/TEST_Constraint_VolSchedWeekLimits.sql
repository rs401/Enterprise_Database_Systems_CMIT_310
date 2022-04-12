USE [ChamplainCharityLLC]
GO

DECLARE @NewID int;

exec pInsertVolSchedWeek @VolSchedMonthID=2,@Week=14,@VolModifiedBy='RS',@NewWeekID=@NewID output

SELECT @NewID