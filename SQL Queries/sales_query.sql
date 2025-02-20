-- Monthly Sales Trends
SELECT d.year, d.month_name, 
       SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN date d ON t.order_date = d.date
GROUP BY d.year, d.month_name
ORDER BY d.year, d.month_name;

-- Find Most Profitable Products
SELECT p.product_code, p.product_type, 
       SUM(t.profit_margin) AS total_profit
FROM transactions t
JOIN products p ON t.product_code = p.product_code
GROUP BY p.product_code, p.product_type
ORDER BY total_profit DESC;

-- Find Products with Negative Profit Margins
SELECT t.product_code, p.product_type, 
       SUM(t.sales_amount) AS total_sales, 
       SUM(t.profit_margin) AS total_profit
FROM transactions t
JOIN products p ON t.product_code = p.product_code
GROUP BY t.product_code, p.product_type
HAVING SUM(t.profit_margin) < 0
ORDER BY total_profit ASC;

