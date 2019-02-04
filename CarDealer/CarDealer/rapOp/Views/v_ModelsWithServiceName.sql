
CREATE VIEW [rapOp].[v_ModelsWithServiceName] AS
	SELECT 
		m.Bra_Id,
		m.Mod_Name,
		s.Ser_Name
	FROM
		[Service].[OrderHistory] AS oh WITH (NOLOCK)
	INNER JOIN
		[Service].[Order] AS o ON o.Sor_Id = oh.Sor_Id
	INNER JOIN 
		[dbo].[Model] AS m ON m.Mod_Id = o.Mod_Id
	INNER JOIN
		[Service].[Service] as s ON s.Ser_Id = o.Ser_Id