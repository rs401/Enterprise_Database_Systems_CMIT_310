USE [ChamplainCharityLLC]
GO

/****** Object:  StoredProcedure [dbo].[pInsertVolunteerEmergencyContactInformation]    Script Date: 10/15/2020 9:51:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates volunteer emergency contact information
-- =============================================
create PROCEDURE [dbo].[pUpdateVolunteerEmergencyContactInformation] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@ContactInformation NVARCHAR(MAX),
	@ModifiedBy Name,
	@EmergencyContactInformationID int Output,
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
	
		UPDATE Volunteer.VolunteerEmergencyContact
		SET ContactInformation=@ContactInformation,
			ModifiedBy=@ModifiedBy,
			ModifiedDate=SYSDATETIME()
		WHERE VolunteerPersonID=@VolunteerPersonID
					 
		SELECT @ErrNo = @@ERROR
			
		IF @ErrNo <>0--<> Error!
			BEGIN
				RAISERROR(@ErrNo,16,0)
			END
		SET @Success =1;
			
		COMMIT TRANSACTION

	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in UpdateVolEmergencyContactInfo Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END

GO


