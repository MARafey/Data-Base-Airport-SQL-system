SELECT top 1 H.HLocation, H.PlaneCapacity - COUNT(A.RegNo) AS AvailableSpace
FROM Hangar H
LEFT JOIN AirPlane A ON H.ID = A.STORED_IN
GROUP BY H.ID, H.HLocation, H.PlaneCapacity
ORDER BY AvailableSpace DESC
