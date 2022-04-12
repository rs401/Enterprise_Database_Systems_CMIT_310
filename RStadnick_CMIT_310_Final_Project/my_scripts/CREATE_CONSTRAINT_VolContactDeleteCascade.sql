USE ChamplainCharityLLC
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Adding constraint to FK_VolunteerEmergencyContact_VolunteerContactInformation
-- =============================================
BEGIN;
    -- Drop the constraint
    ALTER TABLE Volunteer.VolunteerEmergencyContact
    DROP CONSTRAINT FK_VolunteerEmergencyContact_VolunteerContactInformation;

    -- RE-Create the constraint
    ALTER TABLE Volunteer.VolunteerEmergencyContact
    ADD CONSTRAINT FK_VolunteerEmergencyContact_VolunteerContactInformation
    FOREIGN KEY (VolunteerPersonID)
    REFERENCES Volunteer.VolunteerContactInformation (VolunteerPersonID)
    ON DELETE CASCADE;
END;