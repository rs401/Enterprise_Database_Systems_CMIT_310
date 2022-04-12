USE ChamplainCharityLLC
GO

CREATE PROCEDURE GetChildDepartments(@DepartmentID int)
AS
BEGIN
    WITH ParentDepartment AS 
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription 
        FROM Volunteer.VolunteerDepartment
        WHERE DepartmentID = @DepartmentID
    ),
    ChildDepartment AS
    (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription
        FROM Volunteer.VolunteerDepartment
    )

    SELECT D1.DepartmentDescription AS "Parent Department", D2.DepartmentDescription AS "Child Department"
    FROM ParentDepartment AS D1
    INNER JOIN ChildDepartment AS D2
    ON D1.DepartmentID = D2.ParentDepartmentID

END