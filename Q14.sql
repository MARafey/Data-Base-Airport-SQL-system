
SELECT O.o_name, O.Phone
FROM owners O
JOIN Coporation C ON O.SSN = C.TIN
JOIN OWNS OW ON O.SSN = OW.SSN
JOIN AirPlane A ON OW.Reg = A.RegNo
JOIN Hangar H ON A.STORED_IN = H.ID
WHERE O.Address1 = H.HLocation
