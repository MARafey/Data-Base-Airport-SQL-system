SELECT P.Liscence, COUNT(F.Model) AS NumberOfPlanes
FROM Pilot P
JOIN FLIES F ON P.Liscence = F.Fliscence
GROUP BY P.Liscence;
