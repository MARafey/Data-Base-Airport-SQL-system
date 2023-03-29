SELECT P.o_name, P.Address1
FROM owners AS P
JOIN OWNS AS O1 ON P.SSN = O1.SSN
JOIN AirPlane AS AP1 ON O1.Reg = AP1.RegNo
JOIN Coporation AS C1 ON P.SSN = C1.TIN
WHERE EXISTS (
    SELECT 1
    FROM OWNS AS O2
    JOIN AirPlane AS AP2 ON O2.Reg = AP2.RegNo
    JOIN Coporation AS C2 ON O2.SSN = C2.TIN
    WHERE C1.Cname like C2.Cname
    AND AP1.OF_TYPE = AP2.OF_TYPE
    AND O2.Pdate >= ('2020-01-08')
);
