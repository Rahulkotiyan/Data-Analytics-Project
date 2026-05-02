/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: EXTRACT(), DATE_TRUNC(), TO_CHAR()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions
SELECT
	EXTRACT(YEAR FROM sls_order_dt) AS order_year,
	EXTRACT(MONTH FROM sls_order_dt) AS order_month,
	SUM(sls_sales) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(sls_quantity) AS total_quantity
FROM gold.fact_sales
WHERE sls_order_dt IS NOT NULL 
GROUP BY EXTRACT(YEAR FROM sls_order_dt),EXTRACT(MONTH FROM sls_order_dt)
ORDER BY EXTRACT(YEAR FROM sls_order_dt),EXTRACT(MONTH FROM sls_order_dt);

-- DATE_TRUNC()
SELECT
	DATE_TRUNC('month',sls_order_dt) AS order_Date,
	SUM(sls_sales) as total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(sls_quantity) AS total_quantity
FROM gold.fact_sales
WHERE sls_order_dt IS NOT NULL
GROUP BY DATE_TRUNC('month',sls_order_dt)
ORDER BY DATE_TRUNC('month',sls_order_dt);

-- TO_CHAR()
SELECT
	TO_CHAR(sls_order_dt,'yyyy-MMM') AS order_date,
	SUM(sls_sales) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(sls_quantity) AS total_quantity
FROM gold.fact_sales
WHERE sls_order_dt IS NOT NULL
GROUP BY TO_CHAR(sls_order_dt,'yyyy-MMM')
ORDER BY TO_CHAR(sls_order_dt,'yyyy-MMM');
