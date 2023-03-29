SELECT C.Cname, C.CAddress
FROM Coporation C
JOIN owners O ON C.TIN = O.SSN
JOIN OWNS OW ON O.SSN = OW.SSN
JOIN AirPlane A ON OW.Reg = A.RegNo
JOIN Plane_Type PT ON A.OF_TYPE = PT.ModelNo
WHERE PT.PassengerCapacity > 200;
