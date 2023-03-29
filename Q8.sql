SELECT O.o_name, O.Phone
FROM owners O
JOIN OWNS OW ON O.SSN = OW.SSN
WHERE OW.Pdate >= '2020-09-08';
