USE [ChamplainCharityLLC]
GO

ALTER TABLE Volunteer.VolunteerScheduleWeek
ADD CONSTRAINT CHK_VolunteerScheduleWeek_Week
CHECK (Week BETWEEN 1 and 5);