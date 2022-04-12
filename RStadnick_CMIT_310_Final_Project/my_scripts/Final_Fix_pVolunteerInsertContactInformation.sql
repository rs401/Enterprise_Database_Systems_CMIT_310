USE [ChamplainCharityLLC]
GO

/****** Object:  StoredProcedure [dbo].[pInsertVolunteerContactInformation]    Script Date: 10/3/2020 5:08:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
    @VolunteerPersonID int,
    @DepartmentID int=NULL,
	@ContactFirstName Name,
	@ContactLastName Name,
    @ContactDOB datetime,
	@ContactAddress1 NVarchar(50),
	@ContactAddress2 NVarchar(50)=NULL,
	@ContactHomePhone Phone,
	@ContactWorkPhone Phone,
	@ContactCellPhone Phone,
	@ContactPager Nvarchar(20),
	@ContactEmail NVarchar(50),
	@VolunteerTypeID int,
	@IsActive bit,
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
@MyModifiedDate DATETIME = GETDATE(),
@ErrNo int =0,
@ErrMsg NVarchar(50)='',
@ContactPersonID int;

BEGIN TRY

	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	SET @ContactPersonID = @VolunteerPersonID
		INSERT INTO Volunteer.VolunteerContactInformation(
						VolunteerPersonID,
                        ContactPersonID,
                        DepartmentID,
						ContactFirstName,
						ContactLastName,
                        ContactDOB,
						ContactAddress1,
						ContactAddress2,
						ContactHomePhone,
						ContactCellPhone,
						ContactWorkPhone,
						ContactPager,
                        ContactEmail,
						Volunteertypeid,
						IsActive,
                        ModifiedDate,
						ModifiedBy
                        )
					VALUES(
                        @VolunteerPersonID,
                        @ContactPersonID,
                        @DepartmentID,
                        @ContactFirstName,
                        @ContactLastName,
                        @ContactDOB,
                        @ContactAddress1,
                        @ContactAddress2,
                        @ContactHomePhone,
                        @ContactWorkPhone,
                        @ContactCellPhone,
                        @ContactPager,
                        @ContactEmail,
                        @VolunteerTypeID,
                        @IsActive,
                        @MyModifiedDate,
                        @ModifiedBy
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
					SELECT @Error ='Failure in InsertPersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END




GO


