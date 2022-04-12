USE ChamplainCharityLLC
GO

-- I'm thinking maybe a sp to list all the depts isn't good, 
-- going to make a report that lists the departmeents and the number of volunteers in each department
--CREATE PROCEDURE spListVolunteerDepartments
--AS
--BEGIN
WITH Parents AS (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription FROM Volunteer.VolunteerDepartment
        WHERE ParentDepartmentID IS NULL
    ),
    Children AS (
        SELECT DepartmentID, ParentDepartmentID, DepartmentDescription FROM Volunteer.VolunteerDepartment
        WHERE ParentDepartmentID IS NOT NULL
    )
SELECT P.DepartmentDescription AS 'Parent Department', C.DepartmentDescription AS 'Child Departmeent' From Parents AS P 
JOIN Children AS C ON P.DepartmentID = C.ParentDepartmentID ORDER BY P.DepartmentID

--END