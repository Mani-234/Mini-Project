		Retail Inventory Management
SELECT * FROM retail.dbo.Retail;
	--Explanation
	----Table name is given as retail and it has columns like ProductID, ProductName, Category, UnitCost, QuantityInStock, ReorderLevel, SupplierID, SupplierName, ContactName, ContactEmail etc.,
	----FROM retail.dbo.Retail
	----retail is the database name.
	----dbo is the schema which is a container for database objects.
	----Retail is the table name inside the retail database and dbo schema.
	----So we are telling SQL Server to Get every column and every row from the Retail table in the dbo schema of the retail database.

SELECT ProductID, ProductName, QuantityInStock, ReorderLevel FROM retail.dbo.Retail WHERE QuantityInStock<ReorderLevel;
	--Explanation
	-----SELECT ProductID, ProductName, QuantityInStock, ReorderLevel
	-----This tells SQL to retrieve only these specific columns from the table.
	-----ProductID is the unique identifier for each product.
	-----ProductName is the name of the product.
	-----QuantityInStock is that how many units of the product are currently in stock.
	-----ReorderLevel is the threshold value—when inventory falls below this level, a reorder is needed.

SELECT Category,COUNT(*)AS reorder_count FROM retail.dbo.Retail WHERE QuantityInStock<ReorderLevel GROUP BY category;
	--Explanation
	-----Return each distinct Category from the table. Count the number of products in each category that meet the condition defined in the WHERE clause.
	-----Alias the count as reorder_count, meaning this column will show how many products in that category need to be reordered.
	-----WHERE QuantityInStock < ReorderLevel is the filter condition used to limit the rows the query will process. It selects only those products where is used.
	-----GROUP BY Category After filtering, the remaining records are grouped by product category. All reorder-needed products are organized by their category.
	-----COUNT(*) is then applied to each group category to get the number of reorder-needed products per category.

SELECT SUM(QuantityInStock*unitCost)AS total_inventory_value FROM retail.dbo.Retail;
	--Explanation
	-----It is used to return a specific calculation.
	-----SUM(QuantityInStock * UnitCost) is the core calculation and for each product it multiplies,
	-----QuantityInStock is used to calculate how many units are currently in inventory
	-----UnitCost is cost of one unit
	-----The SUM(...) function adds all the values across all products in the table.

SELECT CAST(COUNT(CASE WHEN QuantityInStock = 0 THEN 1 END) AS FLOAT) / COUNT(*) * 100 AS StockoutRatePercent FROM retail.dbo.Retail;
	--Explanation
	-----This query calculates the Stockout Rate, which is the percentage of products that are out of stock.
	-----CAST is used to convert the result into a decimal value, so division gives us a precise percentage instead of an integer.

SELECT SUM(UnitCost * QuantityInStock) AS EstimatedCostofGoodsSold FROM retail.dbo.Retail;
	--Explanation
	-----This query is used to calculate the total value of goods currently in stock by multiplying the cost per unit by the quantity available for all products.
