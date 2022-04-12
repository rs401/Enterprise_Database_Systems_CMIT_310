USE ChamplainCharityLLC
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Adding constraint to FK_VolunteerScheduleDayTime_VolunteerScheduleWeek
-- =============================================
BEGIN;
    -- Drop the constraint
    ALTER TABLE Volunteer.VolunteerScheduleDayTime
    DROP CONSTRAINT FK_VolunteerScheduleDayTime_VolunteerScheduleWeek;

    -- RE-Create the constraint
    ALTER TABLE Volunteer.VolunteerScheduleDayTime
    ADD CONSTRAINT FK_VolunteerScheduleDayTime_VolunteerScheduleWeek
    FOREIGN KEY (VolunteerScheduleWeekID)
    REFERENCES Volunteer.VolunteerScheduleWeek (VolunteerScheduleWeekID)
    ON DELETE CASCADE;
END;