USE [ChamplainCharityLLC]
GO

ALTER TABLE Volunteer.VolunteerScheduleMonth
ADD CONSTRAINT CHK_VolunteerScheduleMonth_Month
CHECK (Month BETWEEN 1 and 12);