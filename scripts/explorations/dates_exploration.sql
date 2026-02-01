-- =====================================================
-- DATES EXPLORATION
-- Purpose: To understand date coverage (min/max) and approximate timespans in the dataset
-- =====================================================

-- Order date coverage and approximate range in years
SELECT
    MIN(order_date) AS min_order_date,
    MAX(order_date) AS max_order_date,
    DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_in_years
FROM gold.fact_sales;

-- Customer age bounds based on birthdate (oldest v youngest)
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birtdate,
    DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
