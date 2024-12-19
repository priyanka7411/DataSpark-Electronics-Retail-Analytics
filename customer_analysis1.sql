
-- Demographic Distribution
SELECT 
    Gender,
    COUNT(*) AS Total_Customers,
    AVG(TIMESTAMPDIFF(YEAR, Birthday, CURDATE())) AS Avg_Age,
    City, State, Country, Continent
FROM Customer
GROUP BY Gender, City, State, Country, Continent;

-- Purchase Patterns
SELECT 
    c.CustomerKey,
    COUNT(s.OrderNumber) AS Purchase_Frequency,
    AVG(s.Quantity * p.UnitPriceUSD) AS Avg_Order_Value,
    GROUP_CONCAT(DISTINCT p.ProductName ORDER BY p.ProductName) AS Preferred_Products
FROM Sales s
JOIN Customer c ON s.CustomerKey = c.CustomerKey
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY c.CustomerKey;

-- Segmentation
SELECT 
    c.CustomerKey, 
    c.Gender, 
    TIMESTAMPDIFF(YEAR, c.Birthday, CURDATE()) AS Age, 
    c.City, c.State, c.Country, c.Continent,
    COUNT(s.OrderNumber) AS Total_Purchases,
    SUM(s.Quantity * p.UnitPriceUSD) AS Total_Spent
FROM Sales s
JOIN Customer c ON s.CustomerKey = c.CustomerKey
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY c.CustomerKey
HAVING Total_Spent > 1000;
