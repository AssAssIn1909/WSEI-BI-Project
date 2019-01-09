
CREATE VIEW [rapOp].[v_EmployeeOrders] AS
	SELECT emp.Emp_FirstName, Emp_LastName, COUNT(ord.Ord_Id) AS [Orders], SUM(ord.Ord_Price) AS [OrderSum]
	FROM [dbo].[Employee] AS emp WITH (NOLOCK)
	LEFT JOIN [dbo].[Order] AS ord ON ord.Emp_Id = emp.Emp_Id
	GROUP BY emp.Emp_Id, emp.Emp_FirstName, emp.Emp_LastName