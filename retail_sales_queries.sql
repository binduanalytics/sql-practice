-- Create Sales table

CREATE TABLE Sales (
    SalesID INT,
    ProductName VARCHAR(50),
    Region VARCHAR(20),
    SalesAmount DECIMAL(10,2)
);

-- Insert sample data

INSERT INTO Sales VALUES
(1, 'Laptop', 'South', 50000),
(2, 'Mobile', 'North', 20000),
(3, 'Laptop', 'South', 45000),
(4, 'Tablet', 'East', 15000),
(5, 'Laptop', 'West', 55000);

-- Query 1: Show all data

SELECT *
FROM Sales;

-- Query 2: Total Sales

SELECT SUM(SalesAmount) AS TotalSales
FROM Sales;

-- Query 3: Sales by Region

SELECT Region,
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;

-- Query 4: Laptop Sales

SELECT *
FROM Sales
WHERE ProductName = 'Laptop';

--Query 5: Sales by Product

SELECT ProductName,
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductName
ORDER BY TotalSales DESC;

--Query 6: Region with Highest Sales

SELECT TOP 1
       Region,
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region
ORDER BY TotalSales DESC;

--Query 7: Average Sales by Product

SELECT ProductName,
       AVG(SalesAmount) AS AvgSales
FROM Sales
GROUP BY ProductName;

--Query 8: Ranking Products using Window Function

SELECT ProductName,
       SUM(SalesAmount) AS TotalSales,
       RANK() OVER (
           ORDER BY SUM(SalesAmount) DESC
       ) AS SalesRank
FROM Sales
GROUP BY ProductName;

--Query 9: CTE Example

WITH ProductSales AS
(
    SELECT ProductName,
           SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductName
)
SELECT *
FROM ProductSales
WHERE TotalSales > 50000;
