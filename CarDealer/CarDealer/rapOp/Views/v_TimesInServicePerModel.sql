
CREATE VIEW [rapOp].[v_TimesInServicePerModel] AS
	SELECT 
		m.Bra_Id,
		m.Mod_Name,
		COUNT(o.Ser_Id) AS Times
	FROM
		[Service].[Order] AS o WITH (NOLOCK)
	RIGHT JOIN
		[dbo].[Model] AS m ON m.Mod_Id = o.Mod_Id
	GROUP BY
		m.Bra_Id, m.Mod_Name