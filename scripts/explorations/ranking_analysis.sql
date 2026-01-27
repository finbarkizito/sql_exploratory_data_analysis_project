-- =====================================================
-- 06 Ranking Analysis
-- Purpose: Rank dimension members by measures to identify top/bottom performers
-- Examples: top products by revenue, worst products by revenue, top subcategories,
--           top customers by revenue, bottom customers by order count.
-- =====================================================


-- =====================================================
-- Q1: Top 5 products by total revenue
-- =====================================================
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- =====================================================
-- Q2: Bottom 5 products by total revenue
-- =====================================================
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue;


-- =====================================================
-- Q3: Top 5 subcategories by total revenue
-- =====================================================
SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC;


-- =====================================================
-- Q4: Bottom 5 subcategories by total revenue
-- =====================================================
SELECT TOP 5
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue;


-- =====================================================
-- Q5: Top 5 products by revenue (window-function ranking)
-- Note: Same result as Q1, but uses ROW_NUMBER for ranking control
-- =====================================================
SELECT *
FROM (
    SELECT
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank_products
    FROM (
        SELECT
            p.product_name AS product_name,
            SUM(f.sales_amount) AS total_revenue
        FROM gold.fact_sales f
        LEFT JOIN gold.dim_products p
            ON p.product_key = f.product_key
        GROUP BY p.product_name
    ) a
) r
WHERE r.rank_products <= 5;


-- =====================================================
-- Task: Top 10 customers by total revenue
-- =====================================================
SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;


-- =====================================================
-- Task: Bottom 3 customers by distinct order count (fewest orders)
-- =====================================================
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders;
