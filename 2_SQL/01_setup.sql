CREATE DATABASE retail_analytics;
USE retail_analytics;

CREATE TABLE superstore_raw (
  row_id INT,
  order_id VARCHAR(20),
  order_date VARCHAR(15),
  ship_date VARCHAR(15),
  ship_mode VARCHAR(20),
  customer_id VARCHAR(15),
  customer_name VARCHAR(60),
  segment VARCHAR(20),
  country VARCHAR(40),
  city VARCHAR(60),
  state VARCHAR(40),
  postal_code VARCHAR(10),
  region VARCHAR(20),
  product_id VARCHAR(20),
  category VARCHAR(30),
  sub_category VARCHAR(30),
  product_name VARCHAR(200),
  sales DECIMAL(12,4),
  quantity INT,
  discount DECIMAL(5,2),
  profit DECIMAL(12,4)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
INTO TABLE superstore_raw
CHARACTER SET latin1
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM superstore_raw;
SELECT * FROM superstore_raw LIMIT 5;
