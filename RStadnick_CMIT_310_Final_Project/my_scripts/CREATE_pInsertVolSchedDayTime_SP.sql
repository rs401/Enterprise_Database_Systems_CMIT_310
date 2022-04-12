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
-- Description:	Inserts a record into Volunteer.VolunteerScheduleDayTime
-- =============================================
CREATE PROCEDURE pInsertVolSchedDayTime
	-- Add the parameters for the stored procedure here
	@VolSchedWeekID int,
    @DayOfWeek int,
    @AvailBegTime time(7),
    @AvailEndTime time(7),
    @IsNoShow bit,
    @ActualHoursTotal numeric(18,0),
	@VolModifiedBy nvarchar(50),
    @NewDayTimeID int output
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
            IF @VolSchedWeekID = 0 OR @VolSchedWeekID IS NULL
			    BEGIN  --IF @VolSchedWeekID = 0 OR 
				    RAISERROR('VolSchedWeekID cannot be null or 0',16,1);
			    END	--IF @VolSchedWeekID = 0 OR

            -- Check if VolSchedWeekID exists
            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerScheduleWeek WHERE VolunteerScheduleWeekID = @VolSchedWeekID)
                BEGIN --IF @VolSchedWeekID
                    RAISERROR('VolSchedWeekID does not exist',16,1);
                END --IF @VolSchedWeekID

            -- 
            -- Insert the values
            INSERT INTO Volunteer.VolunteerScheduleDayTime 
                (
                VolunteerScheduleWeekID,
                DayOfWeek,
                AvailableBeginTime,
                AvailableEndTime,
                IsNoShow,
                ActualHoursTotal,
                ModifiedBy
                )
            VALUES 
                (
                @VolSchedWeekID,
                @DayOfWeek,
                @AvailBegTime,
                @AvailEndTime,
                @IsNoShow,
                @ActualHoursTotal,
                @VolModifiedBy
                )
            -- Set the return
            SELECT @NewDayTimeID = SCOPE_IDENTITY()

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
