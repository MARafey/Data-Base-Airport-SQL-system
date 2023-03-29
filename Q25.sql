Here are four queries on the given SQL code:

Find all airplanes that are currently under maintenance.
-- This query is important because it helps track airplanes that are not available for use.
-- It can be used by schedulers and maintenance personnel to plan and manage maintenance tasks.
SELECT a.RegNo, p.ModelNo, h.HLocation, a.UnderMaintenance
FROM AirPlane a
JOIN Plane_Type p ON a.OF_TYPE = p.ModelNo
JOIN Hangar h ON a.STORED_IN = h.ID
WHERE a.UnderMaintenance = 1;
Find the total number of airplanes owned by each owner.
-- This query is important because it provides an overview of the ownership distribution.
-- It can be used by management, sales, or finance departments to assess their customer base or market share.
SELECT o.o_name, COUNT(ow.Reg) as TotalOwned
FROM owners o
JOIN OWNS ow ON o.SSN = ow.SSN
GROUP BY o.o_name;
List all employees and the plane types they are qualified to work on.
-- This query is important because it helps management to assign tasks to employees based on their qualifications.
-- It can be used by HR or operations departments to ensure efficient allocation of resources and workforce.
SELECT e.EmployeeID, p.Name, pt.ModelNo
FROM Employee e
JOIN PERSON p ON e.PERSON = p.SSN
JOIN WORKS_ON wo ON e.EmployeeID = wo.EmployeeID
JOIN Plane_Type pt ON wo.Model = pt.ModelNo;
Find all pilots and the plane types they are licensed to fly.
-- This query is important because it helps identify pilots with the required licenses for specific airplane types.
-- It can be used by management, HR, or training departments to plan training programs, assign pilots to flights, or recruit new pilots.
SELECT pi.Liscence, p.Name, pt.ModelNo
FROM Pilot pi
JOIN PERSON p ON pi.PERSON2 = p.SSN
JOIN FLIES f ON pi.Liscence = f.Fliscence
JOIN Plane_Type pt ON f.Model = pt.ModelNo;
