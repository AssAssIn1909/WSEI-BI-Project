
CREATE VIEW [rapOp].[v_CurrentEmployeesSalary] AS
	SELECT 
		e.Emp_FirstName,
		e.Emp_LastName,
		p.Pay_Amount
	FROM
		[HR].[Paycheck] AS p WITH (NOLOCK)
	INNER JOIN 
		[dbo].[Employee] AS e ON e.Emp_Id = p.Emp_Id 
	WHERE p.Pay_DateTo IS NULL