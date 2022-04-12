USE [ChamplainCharityLLC]
GO

ALTER TABLE [Volunteer].[VolunteerScheduleWeek] ADD  CONSTRAINT [DF_VolSchedWeek_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


