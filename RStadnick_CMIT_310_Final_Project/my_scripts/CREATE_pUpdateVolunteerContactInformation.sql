USE [ChamplainCharityLLC]
GO

/****** Object:  StoredProcedure [dbo].[pInsertVolunteerContactInformation]    Script Date: 10/3/2020 5:08:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-10-15
-- Description:	Updates volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateVolunteerContactInformation] 
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

	    BEGIN TRANSACTION
	        SET @ContactPersonID = @VolunteerPersonID
		    UPDATE Volunteer.VolunteerContactInformation
            SET DepartmentID=@DepartmentID,
			    ContactFirstName=@ContactFirstName,
			    ContactLastName=@ContactLastName,
                ContactDOB=@ContactDOB,
			    ContactAddress1=@ContactAddress1,
			    ContactAddress2=@ContactAddress2,
			    ContactHomePhone=@ContactHomePhone,
			    ContactCellPhone=@ContactCellPhone,
			    ContactWorkPhone=@ContactWorkPhone,
			    ContactPager=@ContactPager,
                ContactEmail=@ContactEmail,
			    Volunteertypeid=@Volunteertypeid,
			    IsActive=@IsActive,
                ModifiedDate=@MyModifiedDate,
			    ModifiedBy=@ModifiedBy
            WHERE VolunteerPersonID = @VolunteerPersonID
					
					 
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
				
			 SET @Success =0;
			  
			 IF RTRIM(LTRIM(@ErrMsg)) =''
				 BEGIN
					SELECT @Error ='Failure in UpdatePersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END




GO


