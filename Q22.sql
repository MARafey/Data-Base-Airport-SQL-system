SELECT E.Shift_Worked, AVG(E.Salary) AS AverageSalary
FROM Employee AS E
GROUP BY E.Shift_Worked;
