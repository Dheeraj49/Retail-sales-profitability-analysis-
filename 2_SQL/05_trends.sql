USE retail_analytics;

#1. Yearly trend
SELECT YEAR(order_date) AS yr,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY YEAR(order_date)
ORDER BY yr;

#2. Seasonality (all years combined, by month)
SELECT MONTH(order_date) AS month_no,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY MONTH(order_date)
ORDER BY month_no;

#3. Ten worst products by profit
SELECT product_name,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(AVG(discount)*100,1) AS avg_discount_pct
FROM superstore_clean
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

#4. Customer segments
SELECT segment,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY segment
ORDER BY profit DESC;