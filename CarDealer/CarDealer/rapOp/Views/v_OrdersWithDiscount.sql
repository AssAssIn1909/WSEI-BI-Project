
CREATE VIEW [rapOp].[v_OrdersWithDiscount] AS
	SELECT ord.*, ((prl.Pri_Price - ord.Ord_Price) / prl.Pri_Price) AS [Discount]
	FROM [dbo].[Order] AS ord WITH (NOLOCK)
	INNER JOIN [dbo].[PriceList] AS prl ON prl.Mod_Id = ord.Mod_Id
	WHERE ord.Ord_OrderDate > prl.Pri_DateFrom AND ord.Ord_OrderDate < prl.Pri_DateTo