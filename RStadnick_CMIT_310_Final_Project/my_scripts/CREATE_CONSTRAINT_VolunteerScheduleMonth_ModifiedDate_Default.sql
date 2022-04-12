USE [ChamplainCharityLLC]
GO

ALTER TABLE [Volunteer].[VolunteerScheduleMonth] ADD  CONSTRAINT [DF_VolSchedMonth_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


