USE [ChamplainCharityLLC]
GO

ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] ADD  CONSTRAINT [DF_VolSchedDayTime_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


