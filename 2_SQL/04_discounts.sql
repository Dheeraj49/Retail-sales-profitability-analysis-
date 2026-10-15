USE retail_analytics;

#1. Profit by discount band
SELECT CASE WHEN discount = 0 THEN '0%'
            WHEN discount <= 0.10 THEN '1-10%'
            WHEN discount <= 0.20 THEN '11-20%'
            WHEN discount <= 0.30 THEN '21-30%'
            WHEN discount <= 0.50 THEN '31-50%'
            ELSE '51%+' END AS discount_band,
       COUNT(*) AS line_items,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit,
       ROUND(SUM(profit)/SUM(sales)*100,2) AS margin_pct
FROM superstore_clean
GROUP BY discount_band
ORDER BY MIN(discount);

#2. Discount behaviour by region
SELECT region,
       ROUND(AVG(discount)*100,1) AS avg_discount_pct,
       ROUND(SUM(discount >= 0.3)/COUNT(*)*100,1) AS pct_lines_30plus
FROM superstore_clean
GROUP BY region
ORDER BY avg_discount_pct DESC;

#3. Discounts in the problem sub-categories
SELECT sub_category,
       ROUND(AVG(discount)*100,1) AS avg_discount_pct,
       ROUND(SUM(profit),2) AS profit
FROM superstore_clean
WHERE sub_category IN ('Tables','Bookcases','Supplies','Machines')
GROUP BY sub_category
ORDER BY profit;