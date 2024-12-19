-- Product Popularity
SELECT 
    p.ProductName,
    SUM(s.Quantity) AS Total_Sales_Quantity
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY Total_Sales_Quantity DESC;
-- Profitability Analysis
SELECT 
    p.ProductName,
    p.UnitCostUSD,
    p.UnitPriceUSD,
    (p.UnitPriceUSD - p.UnitCostUSD) AS Profit_Margin,
    SUM(s.Quantity * (p.UnitPriceUSD - p.UnitCostUSD)) AS Total_Profit
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName, p.UnitCostUSD, p.UnitPriceUSD
ORDER BY Total_Profit DESC;
-- Category Analysis
SELECT 
    p.Category,
    p.Subcategory,
    SUM(s.Quantity * p.UnitPriceUSD) AS Category_Sales
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY p.Category, p.Subcategory
ORDER BY Category_Sales DESC;
