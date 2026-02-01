-- =====================================================
-- Database Exploration
-- Purpose: To get a quick inventory of tables and inspect table metadata (columns)
-- =====================================================

-- First, we explore all tables/views available via INFORMATION_SCHEMA
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Next, we explore all columns for a specific table (dim_customers)
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
