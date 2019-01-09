
CREATE VIEW [rapOp].[v_OrdersForBrand] AS 
	SELECT bra.Bra_FullName, COUNT(ord.Ord_Id) AS [Orders], SUM(ord.Ord_Price) AS [OrderSum]
	FROM [dbo].[Brand] AS bra WITH (NOLOCK)
	LEFT JOIN [dbo].[Model] AS mol ON mol.Bra_Id = bra.Bra_Id
	LEFT JOIN [dbo].[Order] AS ord ON ord.Mod_Id = mol.Mod_Id
	GROUP BY bra.Bra_FullName;