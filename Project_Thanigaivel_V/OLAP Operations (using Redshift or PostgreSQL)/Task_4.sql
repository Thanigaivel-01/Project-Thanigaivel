-- Task4
-- Project: OLAP Operations (using Redshift or PostgreSQL)
-- 1.Database Creation

Create table Sales_sample4(Product_Id Integer Primary key, Region varchar(50),date_ Date, Sales_Amount Numeric);

-- 2.Data Creation

Insert into Sales_sample4 values
(1, 'West', '2024-01-02', 1500),
(2, 'East', '2024-02-04', 900),
(3, 'North', '2024-03-08', 6000),
(4, 'South', '2024-04-10', 550),
(5, 'East', '2024-05-06', 700),
(6, 'North', '2024-06-05', 6000),
(7, 'East', '2024-07-04', 900),
(8, 'West', '2024-08-03', 2500);


-- 3.Perform OLAP operations:
-- a) Drill Down

select region,product_id,sum(sales_amount) as total_sales from Sales_sample4 group bY region,product_id Order BY region,product_id;

-- b) Rollup

Select Case When Product_Id Is Null Then 'Total' Else Region End As Region,Sum(Sales_Amount)   AS total_sales From sales_sample4 GROUP BY ROLLUP (Region, Product_Id) ORDER BY Region;

-- c) Cube

SELECT CASE WHEN Product_Id IS NULL AND Region IS NULL AND Date_ IS NULL THEN 'Total'
WHEN Product_Id IS NULL AND Region IS NULL THEN 'Total by Date'
WHEN Product_Id IS NULL AND Date_ IS NULL THEN 'Total by Region'
WHEN Region IS NULL AND Date_ IS NULL THEN 'Total by Product'
WHEN Product_Id IS NULL THEN 'Total by Region, Date'
WHEN Region IS NULL THEN 'Total by Product, Date'
WHEN Date_ IS NULL THEN 'Total by Product, Region'
ELSE 'Detail'
END AS Perspective,Product_Id,Region,Date_, SUM(Sales_Amount) AS total_sales FROM sales_sample4
GROUP BY CUBE (Product_Id, Region, Date_) ORDER BY Product_Id, Region, Date_;

-- d) Slice 

SELECT *FROM Sales_sample4 WHERE Region = 'East' AND date_ BETWEEN '2024-02-04' AND '2024-08-03';

-- e) Dice

  SELECT * FROM Sales_sample4 WHERE Product_Id = 6 AND Region = 'North'
  AND date_ = '2024-06-05';

