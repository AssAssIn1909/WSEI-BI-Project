
CREATE VIEW [rapOp].[v_ServiceCountsWithAvaragePrice] AS
	SELECT 
		s.Ser_Name,
		COUNT(o.Sor_Id) AS [Count],
		AVG(o.Sor_Price) AS [AvaragePrice]
	FROM
		[Service].[Service] AS s WITH (NOLOCK)
	LEFT JOIN
		[Service].[Order] AS o ON o.Ser_Id = s.Ser_Id
	GROUP BY
		s.Ser_Name