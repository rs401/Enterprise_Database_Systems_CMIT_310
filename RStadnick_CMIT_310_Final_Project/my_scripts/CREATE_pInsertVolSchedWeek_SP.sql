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
-- Create date: 2020-10-10
-- Description:	Inserts a record into Volunteer.VolunteerScheduleWeek
-- =============================================
CREATE PROCEDURE pInsertVolSchedWeek 
	-- Add the parameters for the stored procedure here
	@VolSchedMonthID int,
    @Week int,
	@VolModifiedBy nvarchar(50),
    @NewWeekID int output
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
            IF @VolSchedMonthID = 0 OR @VolSchedMonthID IS NULL
			    BEGIN  --IF @VolSchedMonthID = 0 OR 
				    RAISERROR('VolSchedMonthID cannot be null or 0',16,1);
			    END	--IF @VolSchedMonthID = 0 OR

            -- Check if volunteer month id exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleMonth WHERE VolunteerScheduleMonthID = @VolSchedMonthID)
                BEGIN --IF @VolSchedMonthID NOT EXISTS
                    RAISERROR('VolSchedMonthID does is not Exist',16,1);
                END --IF @VolSchedMonthID NOT EXISTS

            -- Insert the values
            INSERT INTO Volunteer.VolunteerScheduleWeek (VolunteerScheduleMonthID, Week, ModifiedBy)
            VALUES (@VolSchedMonthID, @Week, @VolModifiedBy)
            -- Set the return
            SELECT @NewWeekID = SCOPE_IDENTITY()

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
