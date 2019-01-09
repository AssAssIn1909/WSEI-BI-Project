
CREATE VIEW [rapOp].[v_ModelsWithoutOrders] AS
	SELECT mol.*
	FROM [dbo].[Model] AS mol WITH (NOLOCK)
	LEFT JOIN [dbo].[Order] AS ord ON ord.Mod_Id = mol.Mod_Id
	WHERE ord.Ord_Id IS NULL;