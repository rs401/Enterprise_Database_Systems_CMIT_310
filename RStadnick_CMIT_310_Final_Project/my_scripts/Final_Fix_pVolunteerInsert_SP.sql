USE [ChamplainCharityLLC]
GO

/****** Object:  StoredProcedure [dbo].[pVolunteerInsert]    Script Date: 10/3/2020 5:40:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Richard Stadnick <richard.stadnick@mymail.champlain.edu>
-- Create date: 2020-09-25
-- Description:	Get person information to be inserted into volunteerContactInformation table,
--         From table valued function FetchPersonInfo.
-- UPDATE: Added insert volunteer jobs and notes.
-- =============================================
CREATE PROCEDURE [dbo].[pVolunteerInsert] 
	-- Add the parameters for the stored procedure here
	@PersonID int,
    @DeptID int=NULL,
    @VolTypeID int,
    @IsVolActive bit,
    @VolNotes NVARCHAR(MAX),
    @VolJobDescription NVARCHAR(50),
	@VolModifiedBy nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE 
            @VolunteerPersonID int,
            @ContactFirstName nvarchar(50)=null,
            @ContactLastName nvarchar(50)=null,
            @ContactDOB datetime=null,
            @ContactAddress1 nvarchar(max)=null,
            @ContactAddress2 nvarchar(max)=null,
            @ContactEmail nvarchar(50)=null,
            @ContactHomePhone nvarchar(25)=null,
            @ContactWorkPhone nvarchar(25)=null,
            @ContactCellPhone nvarchar(25)=null,
            @ContactPager nvarchar(20)=null,
            @DepartmentID int,
            @VolunteerTypeID int,
            @IsActive bit,
	        @ModifiedBy nvarchar(50),
            @ErrorMessage nvarchar(max), 
            @ErrorSeverity int, 
            @ErrorState int,
            @Success int,
            @Succ int;

            --Check the id exists and isn't null/0
            IF @PersonID = 0 OR @PersonID IS NULL
			    BEGIN  --IF @PersonID = 0 OR 
				    RAISERROR('PersonID cannot be null or 0',16,1);
			    END	--IF @ClientPersonID = 0 OR 

            IF NOT EXISTS (SELECT * FROM Person.Person WHERE PersonID = @PersonID)
                BEGIN --IF @PersonID NOT EXISTS
                    RAISERROR('PersonID does not exists',16,1);
                END --IF @PersonID NOT EXISTS

            -- Check that the other parameters are not null
            IF @IsVolActive IS NULL
                BEGIN --IF VolIsActive null
                    RAISERROR('IsVolActive cannot be null',16,1);
                END --IF VolIsActive null

            IF @VolTypeID IS NULL
                BEGIN --IF VolTypeID null
                    RAISERROR('VolTypeID cannot be null',16,1);
                END --IF VolTypeID null

            IF @VolModifiedBy IS NULL
                BEGIN --IF @VolModifiedBy null
                    RAISERROR('VolModifiedBy cannot be null',16,1);
                END --IF @VolModifiedBy null

            -- SET the other needed parameters
            SET @DepartmentID = @DeptID
            SET @VolunteerTypeID = @VolTypeID
            SET @IsActive = @IsVolActive
            SET @ModifiedBy = @VolModifiedBy

            -- Fetch and assign values to variables from Fetch Function
            SELECT @VolunteerPersonID = VolunteerPersonID, 
            @ContactFirstName = ContactFirstName, 
            @ContactLastName = ContactLastName,
            @ContactDOB = CONVERT(DATETIME,ContactDOB,103),
            @ContactAddress1 = ContactAddress1,
            @ContactAddress2 = ContactAddress2,
            @ContactEmail = ContactEmail,
            @ContactHomePhone = ContactHomePhone,
            @ContactWorkPhone = ContactWorkPhone,
            @ContactCellPhone = ContactCellPhone,
            @ContactPager = ContactPager
            FROM [dbo].FetchPersonInfo(@PersonID)
            
            -- Check we got the info
            IF @@ROWCOUNT != 1
                BEGIN --IF @@ROWCOUNT != 1
                    RAISERROR('Could not fetch person info.',16,1);
                END --IF @@ROWCOUNT != 1

            -- I was having a problem with vol contact info already existing. So I'm going to check if it exists
            -- and if it does, I will skip this insert and move to job and notes, else insert it.
            IF NOT EXISTS(SELECT * FROM Volunteer.VolunteerContactInformation WHERE VolunteerPersonID = @PersonID)
            BEGIN
                -- Execute insertvolcontact sp call with the above parameters
                EXEC [dbo].pInsertVolunteerContactInformation 
                    @VolunteerPersonID,
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
                    @ModifiedBy,
                    @ErrorMessage output,
                    @ErrorSeverity output,
                    @Success output;

		        IF @Success <>1--<> Error!
			        BEGIN
				        RAISERROR('Could not insert volunteer contact information.',16,0)
			        END
            END

            SELECT * FROM FetchVolunteerContactInfo(@PersonID)

            -- Insert Notes
            EXEC [dbo].pInsertVolunteerNotes @VolunteerPersonID=@PersonID, @Notes=@VolNotes, @ModifiedBy=@VolModifiedBy, 
                @Error=@ErrorMessage out, @ErrorNo=@ErrorState out, @Success=@Success out
            IF @Success <> 1
            BEGIN
                RAISERROR('Could not insert volunteer notes.',16,0)
            END

            -- Insert Job
            EXEC [dbo].pInsertVolunteerJobs @PersonID=@VolunteerPersonID, @JobDescription=@VolJobDescription, @ModifiedByName=@VolModifiedBy, @Success=@Succ out
            IF @Succ <> 1
            BEGIN
                RAISERROR('Could not insert volunteer job.',16,0)
            END

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


