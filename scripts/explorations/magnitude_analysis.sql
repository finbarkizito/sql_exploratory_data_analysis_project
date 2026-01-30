-- =====================================================
-- 05 Magnitude Analysis
-- Purpose: To Compare business measures across dimensions (e.g., customers by country,
--          revenue by category, items sold by country). These queries help identify
--          where volume and value concentrate across the model.
-- =====================================================


-- =====================================================
-- Customers by country
-- =====================================================
SELECT
    country,
    COUNT(customer_id) AS total_cust_per_country
FROM gold.dim_customers
GROUP BY country
ORDER BY total_cust_per_country DESC;


-- =====================================================
-- Customers by gender
-- =====================================================
SELECT
    gender,
    COUNT(customer_id) AS total_cust_per_gender
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_cust_per_gender DESC;


-- =====================================================
-- Products by category
-- =====================================================
SELECT
    category,
    COUNT(product_id) AS total_products_per_category
FROM gold.dim_products
GROUP BY category
ORDER BY total_products_per_category DESC;


-- =====================================================
-- Average product cost by category
-- =====================================================
SELECT
    category,
    AVG(cost) AS average_costs_per_category
FROM gold.dim_products
GROUP BY category
ORDER BY average_costs_per_category DESC;


-- =====================================================
-- Total revenue by product category
-- =====================================================
SELECT
    dp.category,
    SUM(fs.sales_amount) AS total_revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_products dp
    ON fs.product_key = dp.product_key
GROUP BY dp.category
ORDER BY total_revenue DESC;


-- =====================================================
-- Total revenue by customer (top customers)
-- =====================================================
SELECT
    fs.customer_key,
    c.first_name,
    c.last_name,
    SUM(fs.sales_amount) AS total_revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customers c
    ON fs.customer_key = c.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;


-- =====================================================
-- Total items sold by country
-- =====================================================
SELECT
    c.country,
    SUM(fs.quantity) AS total_sold_items
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customers c
    ON fs.customer_key = c.customer_key
GROUP BY
    c.country
ORDER BY total_sold_items DESC;
