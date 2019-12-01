
-- Create a handy view summarizing customer orders
CREATE VIEW vwCustomerOrderSummary
WITH SCHEMABINDING
AS
SELECT
	c.CustomerID, c.FirstName, c.LastName, --c.CustomerRanking,
	ISNULL(SUM(oh.OrderTotal), 0) AS OrderTotal
FROM dbo.Customer c
LEFT JOIN dbo.OrderHeader oh
	ON c.CustomerID = oh.CustomerID
GROUP BY
	c.CustomerID,
	c.FirstName,
	c.LastName--,
	--c.CustomerRanking;
