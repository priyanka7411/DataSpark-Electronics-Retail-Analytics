-- Store Performance
SELECT 
    st.StoreKey,
    st.Country, st.State,
    st.SquareMeters,
    SUM(s.Quantity * p.UnitPriceUSD) AS Total_Sales,
    SUM(s.Quantity * p.UnitPriceUSD) / st.SquareMeters AS Sales_Per_Square_Meter
FROM Sales s
JOIN Stores st ON s.StoreKey = st.StoreKey
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY st.StoreKey, st.Country, st.State, st.SquareMeters
ORDER BY Total_Sales DESC;

-- Geographical Analysis
SELECT 
    st.Country, 
    st.State,
    SUM(s.Quantity * p.UnitPriceUSD) AS Total_Sales
FROM Sales s
JOIN Stores st ON s.StoreKey = st.StoreKey
JOIN Product p ON s.ProductKey = p.ProductKey
GROUP BY st.Country, st.State
ORDER BY Total_Sales DESC;
