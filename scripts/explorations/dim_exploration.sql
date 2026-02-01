-- =====================================================
-- Dimensions Exploration
-- Purpose: To inspect distinct values to understand categorical domains and granularity
-- =====================================================

-- Distinct countries in the customer dimension
SELECT DISTINCT
    country
FROM gold.dim_customers;

-- Distinct category hierarchy + product names (sorted for readability)
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY 1, 2, 3;

-- =====================================================
Exploration satisfactory
-- =====================================================
