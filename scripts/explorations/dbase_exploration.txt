-- =====================================================
-- Database Exploration
-- Purpose: Get a quick inventory of tables and inspect table metadata (columns)
-- =====================================================

-- Explore all tables/views available via INFORMATION_SCHEMA
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Explore all columns for a specific table (dim_customers)
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
