SELECT AP.RegNo, PT.ModelNo
FROM AirPlane AS AP
JOIN Plane_Type AS PT ON AP.OF_TYPE = PT.ModelNo
LEFT JOIN OWNS AS O ON AP.RegNo = O.Reg
LEFT JOIN Coporation AS C ON O.SSN = C.TIN
LEFT JOIN PLANE_SERVICE AS PS ON AP.RegNo = PS.Reg
LEFT JOIN SERVICE AS S ON PS.ServiceID = S.ServiceID
LEFT JOIN MAINTAIN AS M ON S.ServiceID = M.ServiceID
LEFT JOIN Employee AS E ON M.EmployeeID = E.EmployeeID
WHERE C.Cname IS NULL AND (E.Shift_Worked != 'Day Shift' OR E.Shift_Worked IS NULL)
GROUP BY AP.RegNo, PT.ModelNo;
