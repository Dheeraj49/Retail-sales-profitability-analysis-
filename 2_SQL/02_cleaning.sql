# CHECK DATA QUALITY

USE retail_analytics;

#1. Dates that fail to convert (expect 0)
SELECT COUNT(*) AS bad_dates
FROM superstore_raw
WHERE STR_TO_DATE(order_date,'%m/%d/%Y') IS NULL
   OR STR_TO_DATE(ship_date,'%m/%d/%Y') IS NULL;

#2. Duplicate row IDs (expect 0)
SELECT COUNT(*) - COUNT(DISTINCT row_id) AS dup_rows
FROM superstore_raw;

#3. Missing values (expect all 0)
SELECT SUM(sales IS NULL) AS null_sales,
       SUM(profit IS NULL) AS null_profit,
       SUM(customer_id = '') AS blank_customer,
       SUM(product_id = '') AS blank_product
FROM superstore_raw;


#BUILD CLEAN TABLE

CREATE TABLE superstore_clean AS
SELECT row_id, order_id,
       STR_TO_DATE(order_date,'%m/%d/%Y') AS order_date,
       STR_TO_DATE(ship_date,'%m/%d/%Y') AS ship_date,
       ship_mode, customer_id, customer_name, segment,
       country, city, state, postal_code, region,
       product_id, category, sub_category, product_name,
       sales, quantity, discount, profit
FROM superstore_raw;

ALTER TABLE superstore_clean ADD PRIMARY KEY (row_id);

SELECT COUNT(*) AS total_rows,
       MIN(order_date) AS first_order,
       MAX(order_date) AS last_order,
       ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM superstore_clean;
