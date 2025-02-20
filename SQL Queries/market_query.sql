-- Get total sales per market and zone
SELECT m.zone, m.markets_name, SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN markets m ON t.market_code = m.markets_code
GROUP BY m.zone, m.markets_name
ORDER BY total_sales DESC;

-- Compare Performance of E-Commerce vs. Brick & Mortar
SELECT c.customer_type, 
       SUM(t.sales_amount) AS total_sales, 
       SUM(t.profit_margin) AS total_profit
FROM transactions t
JOIN customers c ON t.customer_code = c.customer_code
GROUP BY c.customer_type;

-- Top 5 Markets by Sales
SELECT m.markets_name, SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN markets m ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_sales DESC
LIMIT 5;

