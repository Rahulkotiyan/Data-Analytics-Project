SELECT
	p.product_name,
	SUM(f.sls_sales) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT * 
FROM(
	SELECT
		p.product_name,
		SUM(f.sls_sales) AS total_revenue,
		RANK() OVER(ORDER BY SUM(f.sls_sales) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
		ON p.product_key = f.product_key
	GROUP BY p.product_name
) AS ranked_products
WHERE rank_products<5 OR rank_products=5;
