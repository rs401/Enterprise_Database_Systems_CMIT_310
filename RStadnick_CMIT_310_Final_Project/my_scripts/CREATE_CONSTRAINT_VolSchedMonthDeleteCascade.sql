USE ChamplainCharityLLC
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Adding constraint to FK_VolunteerScheduleMonth_VolunteerContactInformation
-- =============================================
BEGIN;
    -- Drop the constraint
    ALTER TABLE Volunteer.VolunteerScheduleMonth
    DROP CONSTRAINT FK_VolunteerScheduleMonth_VolunteerContactInformation;

    -- RE-Create the constraint
    ALTER TABLE Volunteer.VolunteerScheduleMonth
    ADD CONSTRAINT FK_VolunteerScheduleMonth_VolunteerContactInformation
    FOREIGN KEY (VolunteerPersonID)
    REFERENCES Volunteer.VolunteerContactInformation (VolunteerPersonID)
    ON DELETE CASCADE;
END;