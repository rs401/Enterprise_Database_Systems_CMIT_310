USE [ChamplainCharityLLC]
GO

ALTER TABLE Volunteer.VolunteerScheduleDayTime
ADD CONSTRAINT CHK_VolunteerScheduleDayTime_DayOfWeek
CHECK (DayOfWeek BETWEEN 1 and 7);