SELECT PT.ModelNo, AVG(S.Hours) AS AvgMaintenanceHours
FROM Plane_Type PT
JOIN AirPlane A ON PT.ModelNo = A.OF_TYPE
JOIN PLANE_SERVICE PS ON A.RegNo = PS.Reg
JOIN SERVICE S ON PS.ServiceID = S.ServiceID
GROUP BY PT.ModelNo;
