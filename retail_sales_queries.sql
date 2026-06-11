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
