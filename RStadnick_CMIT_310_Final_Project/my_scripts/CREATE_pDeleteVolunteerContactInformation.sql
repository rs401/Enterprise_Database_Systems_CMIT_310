USE ChamplainCharityLLC
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Deletes VolunteerContactInformation record
-- =============================================

CREATE PROCEDURE pDeleteVolunteerContactInformation
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID INT
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
            IF @VolunteerPersonID = 0 OR @VolunteerPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @VolunteerPersonID)
                BEGIN --IF @VolPersonID exists
                    RAISERROR('VolunteerPersonID does not exist.',16,1);
                END --IF @VolPersonID

            DELETE FROM Volunteer.VolunteerContactInformation
            WHERE VolunteerPersonID = @VolunteerPersonID;

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
