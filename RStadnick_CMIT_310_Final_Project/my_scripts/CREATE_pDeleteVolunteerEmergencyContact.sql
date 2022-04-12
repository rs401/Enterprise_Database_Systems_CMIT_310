USE ChamplainCharityLLC
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerEmergencyContact record
-- =============================================

CREATE PROCEDURE pDeleteVolunteerEmergencyContact
	-- Add the parameters for the stored procedure here
	@VolunteerEmergencyContactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolunteerEmergencyContactID = 0 OR @VolunteerEmergencyContactID IS NULL
			    BEGIN  --IF @@VolunteerEmergencyContactID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @@VolunteerEmergencyContactID = 0 OR

            -- Check if VolunteerEmergencyContact exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerEmergencyContact WHERE VolunteerEmergencyContactID = @VolunteerEmergencyContactID)
                BEGIN --IF @VolunteerEmergencyContactID exists
                    RAISERROR('VolunteerEmergencyContactID does not exist.',16,1);
                END --IF @VolunteerEmergencyContactID

            DELETE FROM Volunteer.VolunteerEmergencyContact
            WHERE VolunteerEmergencyContactID = @VolunteerEmergencyContactID;

        COMMIT TRAN
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        IF @@TRANCOUNT <> 0
        BEGIN
            ROLLBACK TRANSACTION
        END

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

        --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

END
GO
