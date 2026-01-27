# SQL Exploratory Data Analysis (EDA) Project

## Project Overview
This project focuses on **Exploratory Data Analysis (EDA)** using **Microsoft SQL Server**. The goal is to apply a structured, repeatable framework to explore, profile, and analyze sales, customer, and product data. The work mirrors a real-world scenario where a data analyst joins an existing team, gains access to a database, and must quickly understand the data to answer core business questions.

---

## Business Problem / Objective
The objective is to convert raw database tables into actionable business insight by asking structured, decision-driven questions. The analysis is guided by a **Dimensions and Measures** framework to assess sales performance, customer demographics, and product behaviour.

**Key objectives:**
- **Data Profiling:** Understand database structure, table relationships, and column metadata.
- **Strategic Analysis:** Answer targeted business questions such as *“Who are the top customers?”* and *“Which categories generate the most revenue?”*
- **Trend Analysis:** Identify the historical time span of the data and understand sales activity over time.

---

## Data Sources and Inputs
The project uses a pre-built **DataWarehouseAnalytics** database populated through CSV files or SQL scripts.

**Source data:**
- **Format:** CSV flat files or SQL Server database backup (`.bak`)
- **Key datasets:**
  1. **Customers:** Demographic attributes such as gender, birthdate, and country.
  2. **Products:** Product hierarchy including category, subcategory, and cost.
  3. **Sales:** Transaction-level data including order dates, quantities, prices, and revenue.

---

## Data Architecture
The analysis is performed entirely on the **Gold Layer** of a data warehouse.

- **Schema design:** Star schema optimised for analytics.
- **Data organisation:**
  - **Dimensions:** Descriptive attributes used for filtering and grouping (e.g. country, category, date).
  - **Measures:** Numeric fields used for aggregation (e.g. sales amount, quantity, average price).

---

## ETL / Data Processing Approach
Although the focus is analytical, the environment is prepared using one of the following approaches:

1. **SQL Script Execution:** Running scripts to create schemas and load tables.
2. **Flat File Import:** Loading CSVs via SSMS import tools.
3. **Database Restore:** Restoring a full database backup (`.bak`).

**Analytical roadmap:**
1. **Database Exploration:** Inspect tables and columns using `INFORMATION_SCHEMA`.
2. **Dimension Exploration:** Use `DISTINCT` to understand categorical domains.
3. **Date Exploration:** Use `MIN`, `MAX`, and `DATEDIFF` to assess time coverage.
4. **Measure Exploration:** Compute key metrics (“Big Numbers”) using aggregate functions.

---

## Data Modelling and Key Tables
The analysis is centred on three core tables:

- **`fact_sales`**  
  Transaction-level measures such as `sales_amount`, `quantity`, and `order_date`.

- **`dim_customers`**  
  Customer attributes including `customer_key`, `country`, `gender`, and `birthdate`.

- **`dim_products`**  
  Product attributes including `product_key`, `category`, `subcategory`, and `cost`.

---

## Tools and Technologies Used
- **RDBMS:** Microsoft SQL Server (Express Edition)
- **Interface:** SQL Server Management Studio (SSMS)

**SQL features used:**
- **Aggregations:** `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`
- **Filtering & Sorting:** `WHERE`, `ORDER BY`, `TOP`
- **Grouping:** `GROUP BY`, `DISTINCT`
- **Joins:** `LEFT JOIN` for fact–dimension integration
- **System functions:** `INFORMATION_SCHEMA`, `DATEDIFF`, `GETDATE()`
- **Window functions:** `ROW_NUMBER` for ranking analysis.

---

## Key Insights and Outcomes
The exploratory analysis produced several high-level business insights:

- **Global footprint:** Customers span **6 distinct countries**, including Germany and the United States.
- **Sales history:** Transactions cover a **4-year period** (December 2010 – January 2014).
- **Customer demographics:** Customer ages range from **39 to 109 years**.
- **Financial scale:** Approximately **29 million** in total sales from **60,000 items** sold.
- **Product performance:** *Bikes* generate the highest revenue, while *Accessories* have significantly lower average costs.
- **Top performers:** Individual high-value customers were identified using ranking logic.

---

## How This Project Demonstrates Data Analytics Skills
- **Data profiling:** Explored an unfamiliar database using system metadata tables instead of relying on UI inspection.
- **Advanced SQL analysis:**
  - Performed **Magnitude Analysis** (e.g. total sales by country and category).
  - Conducted **Ranking Analysis** to identify top and bottom performers using both `TOP` and `ROW_NUMBER`.
  - Built a consolidated “Big Numbers” report using `UNION ALL`.
- **Business logic translation:** Converted business questions (e.g. *“Who is the youngest customer?”*) into precise SQL queries using date arithmetic and aggregations.
