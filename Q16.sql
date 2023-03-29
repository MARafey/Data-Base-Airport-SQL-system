SELECT P.Name, SUM(S.Hours) AS TotalHours
FROM Employee AS E
JOIN PERSON AS P ON E.PERSON = P.SSN
JOIN MAINTAIN AS M ON E.EmployeeID = M.EmployeeID
JOIN SERVICE AS S ON M.ServiceID = S.ServiceID
JOIN PLANE_SERVICE AS PS ON S.ServiceID = PS.ServiceID
JOIN OWNS AS O ON PS.Reg = O.Reg
JOIN Coporation AS C ON O.SSN = C.TIN
WHERE C.Cname = 'Acme Corporation'
GROUP BY P.Name
ORDER BY TotalHours DESC;
