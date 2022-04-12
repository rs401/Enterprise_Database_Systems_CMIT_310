USE ChamplainCharityLLC
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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE pVolunteerScheduleInsert 
	-- Add the parameters for the stored procedure here
	@VolPersonID INT, 
	@Month INT,
    @Week INT,
    @DayOfWeek INT,
	@AvailBegTime TIME(7),
	@AvailEndTime TIME(7),
	@IsNoShow BIT,
	@ActualHoursTotal NUMERIC(18,0),
    @VolModifiedBy NVARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN
            -- declare variables
            DECLARE
            @VolSchedMonthID int,
            @VolSchedWeekID int,
            @VolSchedDayTimeID int,
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

            -- Check if month with personid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleMonthID FROM Volunteer.VolunteerScheduleMonth WHERE @VolPersonID = VolunteerPersonID AND Month = @Month)
                BEGIN-- IF month record not exists, create it
                    EXEC pInsertVolSchedMonth @VolPersonID=@VolPersonID, @Month=@Month, @VolModifiedBy=@VolModifiedBy, @NewMonthID=@VolSchedMonthID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedMonthID = VolunteerScheduleMonthID FROM Volunteer.VolunteerScheduleMonth
                    WHERE @VolPersonID = VolunteerPersonID AND Month = @Month;
                END

            -- Check if week with monthid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleWeekID FROM Volunteer.VolunteerScheduleWeek WHERE @VolSchedMonthID = VolunteerScheduleMonthID AND Week = @Week)
                BEGIN-- IF week record not exists, create it
                    EXEC pInsertVolSchedWeek @VolSchedMonthID=@VolSchedMonthID, @Week=@Week, @VolModifiedBy=@VolModifiedBy, @NewWeekID=@VolSchedWeekID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedWeekID = VolunteerScheduleWeekID FROM Volunteer.VolunteerScheduleWeek
                    WHERE @VolSchedMonthID = VolunteerScheduleMonthID AND Week = @Week;
                END

            -- Check if DayTime day of week with weekid already exists
            IF NOT EXISTS (SELECT VolunteerScheduleDayTimeID FROM Volunteer.VolunteerScheduleDayTime WHERE @VolSchedWeekID = VolunteerScheduleWeekID AND DayOfWeek = @DayOfWeek)
                BEGIN-- IF DayTime record not exists, create it
                    EXEC pInsertVolSchedDayTime @VolSchedWeekID=@VolSchedWeekID, @DayOfWeek=@DayOfWeek, @AvailBegTime=@AvailBegTime, @AvailEndTime=@AvailEndTime, @IsNoShow=@IsNoShow, @ActualHoursTotal=@ActualHoursTotal, @VolModifiedBy=@VolModifiedBy, @NewDayTimeID=@VolSchedDayTimeID output;
                END
            ELSE
                BEGIN
                    SELECT @VolSchedDayTimeID = VolunteerScheduleDayTimeID FROM Volunteer.VolunteerScheduleDayTime
                    WHERE @VolSchedWeekID = VolunteerScheduleWeekID AND DayOfWeek = @DayOfWeek;
                END

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
