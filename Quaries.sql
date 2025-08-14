-- SQL Queries for Blinkit Data Analysis
-- This file contains SQL queries for data cleaning, KPI calculations, and various sales analyses
-- on the 'blinkit_data' table.

-- Data Cleaning: Standardize Item_Fat_Content
-- Ensures data consistency by unifying variations like 'LF', 'low fat' to 'Low Fat'
-- and 'reg' to 'Regular'.
UPDATE blinkit_data
SET Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END;

-- Verify Data Cleaning: Check distinct Item_Fat_Content values
-- Run this query after the UPDATE statement to confirm standardization.
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;

-- KPI 1: Total Sales (in Millions)
-- Calculates the sum of all sales, formatted to two decimal places in millions.
SELECT CAST(SUM(Total_Sales) / 1000000.0 AS DECIMAL(10,2)) AS Total_Sales_Million
FROM blinkit_data;

-- KPI 2: Average Sales
-- Calculates the average sales, cast to an integer.
SELECT CAST(AVG(Total_Sales) AS INT) AS Avg_Sales
FROM blinkit_data;

-- KPI 3: Number of Items/Orders
-- Counts the total number of rows in the dataset, representing items or orders.
SELECT COUNT(*) AS No_of_Orders
FROM blinkit_data;

-- KPI 4: Average Rating
-- Calculates the average rating, formatted to one decimal place.
SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data;

-- Analysis B: Total Sales by Fat Content
-- Aggregates total sales for each category of 'Item_Fat_Content'.
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Fat_Content;

-- Analysis C: Total Sales by Item Type
-- Calculates total sales for each 'Item_Type', ordered by sales in descending order.
SELECT Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- Analysis D: Fat Content by Outlet for Total Sales (PIVOT Query)
-- Transforms data to show total sales for 'Low Fat' and 'Regular' content
-- across different 'Outlet_Location_Type's. NULL values are replaced with 0.
SELECT Outlet_Location_Type,
ISNULL([Low Fat], 0) AS Low_Fat,
ISNULL(, 0) AS Regular
FROM
(
SELECT Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
SUM(Total_Sales)
FOR Item_Fat_Content IN ([Low Fat],)
) AS PivotTable
ORDER BY Outlet_Location_Type;

-- Query Explanations
-- This query aims to transform the blinkit_data table to display total sales (Total_Sales) for each combination of Outlet_Location_Type and Item_Fat_Content.
-- The result will show Outlet_Location_Type as rows and Item_Fat_Content categories ("Low Fat" and "Regular") as columns.
-- If there are no sales for a particular combination, the query will display 0 instead of NULL.
-- Detailed Explanation:
-- Subquery
-- Aggregation:
-- Purpose: This subquery groups the data by Outlet_Location_Type and Item_Fat_Content, calculating the total sales for each combination.
-- CAST(SUM(Total_Sales) AS DECIMAL(10,2)): Sums the Total_Sales for each group and casts the result to a decimal with two decimal places for precision.
-- PIVOT Operation:
-- Pivoting:
-- Purpose: Transforms the rows of Item_Fat_Content into columns ([Low Fat] and).
-- SUM(Total_Sales): Aggregates the Total_Sales for each Item_Fat_Content category within each Outlet_Location_Type.
-- Main Query:
-- Selecting and Handling NULLs:
-- ISNULL([Low Fat], 0) AS Low_Fat: Replaces any NULL values in the [Low Fat] column with 0 and renames the column to Low_Fat.
-- ISNULL(, 0) AS Regular: Similarly, replaces NULL values in the column with 0.
-- ORDER BY Outlet_Location_Type: Sorts the final result set by Outlet_Location_Type.
-- Why Use ISNULL?
-- When performing a PIVOT operation, if a particular combination of Outlet_Location_Type and Item_Fat_Content doesn't exist in the data, the resulting cell will contain a NULL value.
-- Using ISNULL(column)

-- Analysis E: Total Sales by Outlet Establishment Year
-- Calculates total sales for each 'Outlet_Establishment_Year', ordered chronologically.
SELECT Outlet_Establishment_Year, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- Analysis F: Percentage of Sales by Outlet Size
-- Calculates total sales and the percentage contribution of each 'Outlet_Size'
-- to overall sales, ordered by total sales in descending order.
SELECT
Outlet_Size,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

-- Query Explanation:
-- Outlet_Size: This column represents the size category of the outlet (e.g., Small, Medium, Large).
-- CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales:
-- SUM(Total_Sales): Calculates the total sales for each Outlet_Size.
-- CAST(... AS DECIMAL(10,2)): Formats the resulting sum to a decimal number with two decimal places for precision.
-- CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage:
-- SUM(Total_Sales) * 100.0: Multiplies the total sales of the current Outlet_Size by 100 to prepare for percentage calculation.
-- SUM(SUM(Total_Sales)) OVER():
-- SUM(Total_Sales): Within the GROUP BY context, this computes the total sales for each Outlet_Size.
-- SUM(... ) OVER(): The outer SUM combined with the OVER() clause calculates the grand total of all Total_Sales across all outlet sizes without collapsing the result set.
-- SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER(): Divides the total sales of the current Outlet_Size by the grand total sales and multiplies by 100 to get the percentage contribution of each outlet size to the overall sales.
-- CAST(... AS DECIMAL(10,2)): Formats the resulting percentage to two decimal places.

-- Analysis G: Sales by Outlet Location
-- Calculates total sales for each 'Outlet_Location_Type', ordered by sales in descending order.

SELECT Outlet_Location_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

-- Analysis H: All Metrics by Outlet Type
-- Provides a comprehensive view of total sales, average sales, number of items,
-- average rating, and average item visibility for each 'Outlet_Type'.

SELECT Outlet_Type,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
COUNT(*) AS No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;
