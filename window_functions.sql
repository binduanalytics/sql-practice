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

-- ROW_NUMBER

SELECT ProductName,
       SalesAmount,
       ROW_NUMBER() OVER (ORDER BY SalesAmount DESC) AS RowNum
FROM Sales;

-- RANK

SELECT ProductName,
       SalesAmount,
       RANK() OVER (ORDER BY SalesAmount DESC) AS SalesRank
FROM Sales;

-- DENSE_RANK

SELECT ProductName,
       SalesAmount,
       DENSE_RANK() OVER (ORDER BY SalesAmount DESC) AS DenseSalesRank
FROM Sales;
