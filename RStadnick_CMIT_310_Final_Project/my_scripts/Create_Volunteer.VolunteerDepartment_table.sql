USE [ChamplainCharityLLC]
GO

-- Drop the VolunteerDepartment table if it exists
IF OBJECT_ID (N'Volunteer.VolunteerDepartment', N'U') IS NOT NULL 
   DROP TABLE Volunteer.VolunteerDepartment;

GO

-- Create the VolunteerDepartment table
CREATE TABLE Volunteer.VolunteerDepartment (
    DeptTableID int IDENTITY(1,1) PRIMARY KEY,
    DepartmentID int,
    ParentDepartmentID int,
    DepartmentDescription nvarchar(100)
);

GO

-- Insert records into VolunteerDepartment
INSERT INTO Volunteer.VolunteerDepartment VALUES (1, NULL, 'Food Shelf')
INSERT INTO Volunteer.VolunteerDepartment VALUES (2, NULL, 'Administration')
INSERT INTO Volunteer.VolunteerDepartment VALUES (3, NULL, 'Housing')
INSERT INTO Volunteer.VolunteerDepartment VALUES (4, NULL, 'Outreach')
INSERT INTO Volunteer.VolunteerDepartment VALUES (5, NULL, 'Fund Raising')
INSERT INTO Volunteer.VolunteerDepartment VALUES (6, 1, 'Intake Worker')
INSERT INTO Volunteer.VolunteerDepartment VALUES (7, 1, 'Warehouse worker')
INSERT INTO Volunteer.VolunteerDepartment VALUES (8, 1, 'Inventory')
INSERT INTO Volunteer.VolunteerDepartment VALUES (9, 1, 'Vendor Management')
INSERT INTO Volunteer.VolunteerDepartment VALUES (10, 2, 'Administrative Assistant')
INSERT INTO Volunteer.VolunteerDepartment VALUES (11, 2, 'Financial Assistant')
INSERT INTO Volunteer.VolunteerDepartment VALUES (12, 3, 'Coordinator')
INSERT INTO Volunteer.VolunteerDepartment VALUES (13, 3, 'Client Outreach')
INSERT INTO Volunteer.VolunteerDepartment VALUES (14, 4, 'Media Relations')
INSERT INTO Volunteer.VolunteerDepartment VALUES (15, 4, 'Marketing Assistant')
INSERT INTO Volunteer.VolunteerDepartment VALUES (16, 5, 'Charity Outreach')
INSERT INTO Volunteer.VolunteerDepartment VALUES (17, 5, 'Fundraiser')
INSERT INTO Volunteer.VolunteerDepartment VALUES (18, 5, 'Event Coordinator')
INSERT INTO Volunteer.VolunteerDepartment VALUES (19, 5, 'Event Volunteer')

GO