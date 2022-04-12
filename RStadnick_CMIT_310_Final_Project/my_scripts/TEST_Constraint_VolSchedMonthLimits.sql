USE [ChamplainCharityLLC]
GO

DECLARE @NewID int;

exec pInsertVolSchedMonth @VolPersonID=245,@Month=14,@VolModifiedBy='RS',@NewMonthID=@NewID output

SELECT @NewID