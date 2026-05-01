/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales
SELECT SUM(sls_sales) AS total_sales FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(sls_quantity) AS total_quantity FROM gold.fact_sales;

-- Find how many items are sold
SELECT AVG(sls_price) AS avg_price FROM gold.fact_sales;

-- Find the Total number of Orders
SELECT COUNT(sls_ord_num) AS total_orders FROM gold.fact_sales;
SELECT COUNT(DISTINCT sls_ord_num) AS total_orders FROM gold.fact_sales;

-- Find the total number of products
SELECT COUNT(product_name) AS total_products FROM gold.dim_products;

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.dim_customers;

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name,SUM(sls_sales) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity',SUM(sls_quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price',AVG(sls_price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders',COUNT(DISTINCT sls_ord_num) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products',COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers',COUNT(customer_key) FROM gold.dim_customers;
