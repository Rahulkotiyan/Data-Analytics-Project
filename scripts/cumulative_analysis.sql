/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER(ORDER BY order_date) AS moving_average_price
FROM(
SELECT
	DATE_TRUNC('year',sls_order_dt) AS order_date,
	SUM(sls_sales) AS total_sales,
	AVG(sls_price) AS avg_price
FROM gold.fact_sales
WHERE sls_order_dt IS NOT NULL
GROUP BY DATE_TRUNC('year',sls_order_dt)
)t
