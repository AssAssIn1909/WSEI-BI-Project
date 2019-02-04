
CREATE VIEW [rapOp].[v_TotalSalaryWithBonus] AS
	SELECT 
		e.Emp_FirstName,
		e.Emp_LastName,
		SUM(s.Sal_Amount) AS Total,
		SUM(case when s.Sal_Type = 'Premia' THEN s.Sal_Amount END) AS Bonus
		
	FROM
		[HR].[Salary] AS s WITH (NOLOCK)
	INNER JOIN
		[dbo].[Employee] AS e ON e.Emp_Id = s.Emp_Id
	GROUP BY
		e.Emp_FirstName, e.Emp_LastName