USE [ChamplainCharityLLC]
GO

DECLARE	@return_value int,
		@NewMonthID int

EXEC	@return_value = [dbo].[pInsertVolSchedMonth]
		@VolPersonID = 186,
		@Month = 1,
		@VolModifiedBy = N'RS',
		@NewMonthID = @NewMonthID OUTPUT

SELECT	@NewMonthID as N'@NewMonthID'

SELECT	'Return Value' = @return_value

GO
