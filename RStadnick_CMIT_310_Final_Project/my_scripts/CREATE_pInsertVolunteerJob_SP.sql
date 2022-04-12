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
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-03
-- Description:	Inserts a volunteer job
-- =============================================
CREATE PROCEDURE pInsertVolunteerJobs
	-- Add the parameters for the stored procedure here
	@PersonID INT,
	@JobDescription NVARCHAR(50),
    @ModifiedByName NVARCHAR(50),
    @Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @MyModifiedDate DATETIME = GETDATE(),
        @ErrorMessage NVARCHAR(MAX), 
        @ErrorSeverity INT, 
        @ErrorState INT;

    SET @Success = 0;

    BEGIN TRY
        BEGIN TRANSACTION

            --Check the id exists and isn't null/0
            IF @PersonID = 0 OR @PersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('PersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR

            IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @PersonID)
                BEGIN --IF @PersonID NOT EXISTS
                    RAISERROR('PersonID does not exists',16,1);
                END --IF @PersonID NOT EXISTS

            -- Seems everything is in order.
            INSERT INTO Volunteer.VolunteerJobs (VolunteerPersonID,Job,ModifiedDate,ModifiedBy)
                VALUES (@PersonID,@JobDescription,@MyModifiedDate,@ModifiedByName)

            SET @Success = 1;
        COMMIT TRANSACTION
    END TRY

    BEGIN CATCH
        PRINT 'Rolling Back Transaction'
        ROLLBACK TRANSACTION

        SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();
        
        PRINT @ErrorMessage;
        PRINT @ErrorSeverity;
        PRINT @ErrorState;
    END CATCH

    
END
GO
