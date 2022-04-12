USE [ChamplainCharityLLC]
GO

/****** Object:  StoredProcedure [dbo].[pInsertVolunteerNotes]    Script Date: 10/3/2020 3:13:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer Notes
-- =============================================
-- =============================================
-- Modified By:	Richard Stadnick
-- Create date: 03/10/2020
-- Description:	Removed bad parameter, added check to verify VolPeronID exists
-- =============================================
create PROCEDURE [dbo].[pInsertVolunteerNotes] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@Notes NVARCHAR(MAX),
	@ModifiedBy Name,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END

        IF NOT EXISTS (SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @VolunteerPersonID)
        BEGIN
            SELECT @ErrNo =999999
            SELECT @ErrMsg='That VolunteerPersonID does not exists'
            RAISERROR(@ErrNo,16,1);
        END
	
		INSERT  Volunteer.VolunteerNotes(
						VolunteerPersonID,
						Note,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @Notes,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			 SET @Success =0;
			  
			 IF RTRIM(LTRIM(@ErrMsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertVolNotes Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END

GO


