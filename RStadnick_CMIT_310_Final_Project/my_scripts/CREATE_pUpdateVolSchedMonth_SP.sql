USE [ChamplainCharityLLC]
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates a record into Volunteer.VolunteerScheduleMonth
-- =============================================
CREATE PROCEDURE pUpdateVolSchedMonth 
	-- Add the parameters for the stored procedure here
	@VolPersonID int,
    @Month int,
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int;

            --Check the id exists and isn't null/0
            IF @VolPersonID = 0 OR @VolPersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('VolPersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            -- Check if volunteer is active
            IF NOT EXISTS (SELECT * FROM FetchActiveVolunteers() WHERE VolunteerPersonID = @VolPersonID)
                BEGIN --IF @VolPersonID NOT active
                    RAISERROR('VolPersonID is not active',16,1);
                END --IF @VolPersonID NOT active

            -- Update the values
            UPDATE Volunteer.VolunteerScheduleMonth 
            SET Month=@Month,
                ModifiedBy=@VolModifiedBy
            WHERE VolunteerPersonID=@VolPersonID

        COMMIT TRANSACTION
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
