SELECT O.o_name
FROM owners O
JOIN OWNS OW ON O.SSN = OW.SSN
JOIN AirPlane A ON OW.Reg = A.RegNo
JOIN PLANE_SERVICE PS ON A.RegNo = PS.Reg
JOIN SERVICE S ON PS.ServiceID = S.ServiceID
JOIN MAINTAIN M ON S.ServiceID = M.ServiceID
JOIN Employee E ON M.EmployeeID = E.EmployeeID
LEFT JOIN WORKS_ON WO ON E.EmployeeID = WO.EmployeeID AND A.OF_TYPE = WO.Model
WHERE WO.EmployeeID IS NULL;
