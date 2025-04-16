
-- 1. Create the table (if not already created)
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- 2. Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 3. Top 3 Months by Revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- 4. Monthly Revenue (Filtered for 2023)
SELECT 
    EXTRACT(MONTH FROM order_date) AS month_2023,
    SUM(amount) AS revenue_2023
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY month_2023
ORDER BY month_2023;

-- 5. Handling NULL amounts (optional safe handling)
SELECT 
    EXTRACT(YEAR FROM order_date) AS year_null_safe,
    EXTRACT(MONTH FROM order_date) AS month_null_safe,
    SUM(COALESCE(amount, 0)) AS safe_revenue
FROM online_sales
GROUP BY year_null_safe, month_null_safe
ORDER BY safe_revenue DESC;
