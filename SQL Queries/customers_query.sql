-- Get total sales amount per customer
SELECT c.customer_code, c.customer_name, c.customer_type, 
       SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN customers c ON t.customer_code = c.customer_code
GROUP BY c.customer_code, c.customer_name, c.customer_type
ORDER BY total_sales DESC;
