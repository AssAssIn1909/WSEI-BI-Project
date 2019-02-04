
CREATE VIEW [rapOp].[v_AvarageSalaryPerTeam] AS
	SELECT 
		ep.Pos_Position,
		AVG(p.Pay_Amount) AS AvarageSalary
	FROM
		[HR].[EmployeePosition] AS ep WITH (NOLOCK)
	INNER JOIN 
		[HR].Paycheck AS p ON p.Emp_Id = ep.Emp_Id
	WHERE
		ep.Eps_DateTo IS NULL
	GROUP BY 
		ep.Pos_Position