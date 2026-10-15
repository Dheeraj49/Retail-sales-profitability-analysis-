USE retail_analytics;

#1. Overall KPIs
SELECT ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct,
       COUNT(DISTINCT order_id) AS orders,
       COUNT(DISTINCT customer_id) AS customers
FROM superstore_clean;

#2. By category
SELECT category,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY category
ORDER BY profit DESC;

#3. By sub-category (worst profit first)
SELECT category, sub_category,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY category, sub_category
ORDER BY profit ASC;

#4. By region
SELECT region,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY region
ORDER BY profit DESC;