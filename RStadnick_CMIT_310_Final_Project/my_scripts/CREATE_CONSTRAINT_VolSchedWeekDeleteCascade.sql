USE ChamplainCharityLLC
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Adding constraint to FK_VolunteerScheduleWeek_VolunteerScheduleMonth
-- =============================================
BEGIN;
    -- Drop the constraint
    ALTER TABLE Volunteer.VolunteerScheduleWeek
    DROP CONSTRAINT FK_VolunteerScheduleWeek_VolunteerScheduleMonth;

    -- RE-Create the constraint
    ALTER TABLE Volunteer.VolunteerScheduleWeek
    ADD CONSTRAINT FK_VolunteerScheduleWeek_VolunteerScheduleMonth
    FOREIGN KEY (VolunteerScheduleMonthID)
    REFERENCES Volunteer.VolunteerScheduleMonth (VolunteerScheduleMonthID)
    ON DELETE CASCADE;
END;