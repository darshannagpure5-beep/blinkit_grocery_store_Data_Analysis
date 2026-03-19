Create Database Blinkit_store;
use Blinkit_store;
SELECT 
    *
FROM
    cleaned_blinkit_data;
    
-- 1. Total Sales 
SELECT 
    SUM(Sales) AS total_sales
FROM
    cleaned_blinkit_data;
    
-- 2. Sales by Item Type
SELECT 
    Item_Type, SUM(Sales) AS total_sales
FROM
    cleaned_blinkit_data
GROUP BY Item_Type
ORDER BY total_sales DESC;

-- 3. Top 5 Selling Products
SELECT 
    Item_Identifier, Item_Type, SUM(Sales) AS Total_sales
FROM
    cleaned_blinkit_data
GROUP BY Item_Identifier , Item_Type
ORDER BY total_sales DESC
LIMIT 5;

-- 4. Sales by Outlet Type
SELECT 
    Outlet_Type, SUM(Sales) AS Total_sales
FROM
    cleaned_blinkit_data
GROUP BY Outlet_Type
ORDER BY total_sales;

-- 5. Average Sales per category
SELECT 
    Item_type, AVG(Sales) AS Average_Sales
FROM
    cleaned_blinkit_data
GROUP BY Item_Type
ORDER BY Average_sales DESC;

-- 6. High Value Product
SELECT 
    *
FROM
    cleaned_blinkit_data
WHERE
    Sales > 200
Order by Sales DESC;

-- 7. Contribution Percent 
SELECT 
    Item_Type,
    SUM(Sales) * 100 / (SELECT 
            SUM(Sales)
        FROM
            cleaned_blinkit_data) AS contribution_percent
FROM
    cleaned_blinkit_data
GROUP BY Item_Type
ORDER BY contribution_percent DESC;

-- 8. Which Outlet is best?
SELECT 
    Item_Type, Sales
FROM
    cleaned_blinkit_data
ORDER BY Sales DESC
LIMIT 1;

-- 9. Which Category has Highest Sales?
SELECT 
    Outlet_Type, Sales
FROM
    cleaned_blinkit_data
ORDER BY Sales DESC
LIMIT 1;
