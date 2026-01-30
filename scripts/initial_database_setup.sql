/*
=============================================================
Database and Gold Layer Initialisation.
=============================================================
Purpose:
    This script sets up a clean analytics database called
    'DataWarehouseAnalytics'. If the database already exists,
    it is dropped and recreated to guarantee a fresh
    environment. The script then defines the Gold schema and
    creates the core dimension and fact tables used for
    analytical reporting.

Warning:
    Running this script will permanently delete the existing
    'DataWarehouseAnalytics' database and all of its contents.
    Only execute this script when a full reset is intended and
    after confirming that backups are available.
*/

USE master;
GO

-- If the database already exists, force disconnect all users and drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics
        SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create a new, empty DataWarehouseAnalytics database
CREATE DATABASE DataWarehouseAnalytics;
GO

-- Switch context to the newly created database
USE DataWarehouseAnalytics;
GO

-- =====================================================
-- Create Gold schema (business-ready analytics layer)
-- =====================================================
CREATE SCHEMA gold;
GO

-- =====================================================
-- Create Customer Dimension Table
-- Stores descriptive customer attributes
-- =====================================================
CREATE TABLE gold.dim_customers (
    customer_key     INT,
    customer_id      INT,
    customer_number  NVARCHAR(50),
    first_name       NVARCHAR(50),
    last_name        NVARCHAR(50),
    country          NVARCHAR(50),
    marital_status   NVARCHAR(50),
    gender           NVARCHAR(50),
    birthdate        DATE,
    create_date      DATE
);
GO

-- =====================================================
-- Create Product Dimension Table
-- Stores descriptive product attributes
-- =====================================================
CREATE TABLE gold.dim_products (
    product_key     INT,
    product_id      INT,
    product_number  NVARCHAR(50),
    product_name    NVARCHAR(50),
    category_id     NVARCHAR(50),
    category        NVARCHAR(50),
    subcategory     NVARCHAR(50),
    maintenance     NVARCHAR(50),
    cost            INT,
    product_line    NVARCHAR(50),
    start_date      DATE
);
GO

-- =====================================================
-- Create Sales Fact Table
-- Stores transaction-level measures and dimension keys
-- =====================================================
CREATE TABLE gold.fact_sales (
    order_number    NVARCHAR(50),
    product_key     INT,
    customer_key    INT,
    order_date      DATE,
    shipping_date   DATE,
    due_date        DATE,
    sales_amount    INT,
    quantity        TINYINT,
    price           INT
);
GO

-- =====================================================
-- Reload Gold Layer Tables from CSV Files
-- =====================================================

-- Remove existing customer dimension data before reload
TRUNCATE TABLE gold.dim_customers;
GO

-- Load customer dimension data from CSV file
BULK INSERT gold.dim_customers
FROM 'paste_path_here\sql-data-analytics-project\datasets\csv-files\gold.dim_customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

-- Remove existing product dimension data before reload
TRUNCATE TABLE gold.dim_products;
GO

-- Load product dimension data from CSV file
BULK INSERT gold.dim_products
FROM 'paste_path_here\sql-data-analytics-project\datasets\csv-files\gold.dim_products.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

-- Remove existing sales fact data before reload
TRUNCATE TABLE gold.fact_sales;
GO

-- Load sales fact data from CSV file
BULK INSERT gold.fact_sales
FROM 'paste_path_here\sql-data-analytics-project\datasets\csv-files\gold.fact_sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO
