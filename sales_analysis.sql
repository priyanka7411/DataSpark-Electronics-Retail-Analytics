-- Overall Sales Performance
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(s.Quantity * p.UnitPriceUSD) AS Total_Sales
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY Year, Month
ORDER BY Year, Month;

-- Sales by Product
SELECT 
    p.ProductName, 
    SUM(s.Quantity) AS Total_Quantity_Sold,
    SUM(s.Quantity * p.UnitPriceUSD) AS Total_Revenue
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Sales by Store
SELECT 
    st.StoreKey,
    st.Country, st.State, st.SquareMeters,
    SUM(s.Quantity * p.UnitPriceUSD) AS Store_Sales
FROM Sales s
JOIN Stores st ON s.StoreKey = st.StoreKey
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY st.StoreKey, st.Country, st.State, st.SquareMeters
ORDER BY Store_Sales DESC;

-- Sales by Currency
SELECT 
    s.CurrencyCode,
    SUM(s.Quantity * p.UnitPriceUSD * e.Exchange) AS Total_Sales_Converted
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.CurrencyCode = e.Currency AND s.OrderDate = e.Date
GROUP BY s.CurrencyCode;
