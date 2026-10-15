# Retail Sales and Profitability Analysis

**Tools:** MySQL, SQL, Power BI, DAX

![Dashboard](images/dashboard.png)

## Business problem

A retail company has growing sales but unclear profitability. Which products, regions and discount levels drive or destroy profit, and what should the business do about it?

## Dataset

Sample Superstore dataset (Kaggle, uploaded by vivek468): 9,994 order lines and 21 columns of US retail orders from 3 Jan 2014 to 30 Dec 2017. This is a public sample dataset, not data from a real company.

## Approach

1. **Load:** Imported the raw CSV into MySQL with `LOAD DATA INFILE` and reconciled the row count to the source (9,994).
2. **Validate and clean:** Checked for unparsable dates, duplicate row IDs, null values and blank keys (none found). Converted the M/D/YYYY text dates to `DATE` and built a clean table with a primary key.
3. **Analyse in SQL:** KPIs, category, sub-category and region performance, discount bands, yearly trend, seasonality, worst products and customer segments.
4. **Visualise in Power BI:** DAX measures (Total Sales, Total Profit, Profit Margin %, Orders, Customers), KPI cards, four charts and year and region slicers.

## Headline numbers

| Sales | Profit | Margin | Orders | Customers |
|---|---|---|---|---|
| $2.30M | $286.4K | 12.47% | 5,009 | 793 |

## Key findings

**1. Furniture is the profit problem.** It is 32% of sales but only 6% of profit (2.5% margin), against about 17% for Technology and Office Supplies.

**2. Three sub-categories lose money.** Tables (-$17.7K, -8.6% margin), Bookcases (-$3.5K) and Supplies (-$1.2K). Machines is barely profitable at a 1.8% margin on $189K of sales.

**3. Heavy discounts destroy profit.** The margin turns negative somewhere above a 20% discount.

| Discount band | Order lines | Profit | Margin |
|---|---|---|---|
| 0% | 4,798 | $321.0K | 29.5% |
| 1-10% | 94 | $9.0K | 16.6% |
| 11-20% | 3,709 | $91.8K | 11.6% |
| 21-30% | 227 | -$10.4K | -10.1% |
| 31-50% | 310 | -$48.4K | -24.8% |
| 51%+ | 856 | -$76.6K | -119.2% |

Lines discounted above 20% (14% of all lines) lost $135K combined. Lines at 20% or below earned $422K.

**4. Central is the weakest region.** Margin is 7.9% versus 14.9% in West. Central's average discount is 24.0%, against 10.9% in West, and 27.7% of its lines are discounted 30% or more (3.7% in West).

**5. Growth is healthy but margin slipped in 2017.** From 2014 to 2017, sales grew 51% and profit grew 89%. Margin rose from 10.2% to a peak of 13.4% in 2016, then eased to 12.7% in 2017.

**6. Sales peak late in the year.** November and December bring 29.5% of annual sales. November's margin is 10.1% against 13.3% in December.

**7. A few products drive big losses.** The ten worst products lost $29.5K combined. The two Cubify 3D printers alone lost $12.7K at roughly 50% average discounts.

**8. Segments.** Consumer is the largest segment ($1.16M) but has the lowest margin (11.6%). Home Office has the best margin (14.0%).

## Recommendations

- Cap discounts at 20%, or require approval above it.
- Review pricing and discounting on Tables, Bookcases and Machines.
- Review discount practices in the Central region.
- Check the November promotions, since that month has the highest sales but a lower margin.
- Review or retire the ten worst-performing products.

## Limitations

- This analysis shows that deeply discounted sales lose money. It cannot show whether those sales would have happened without the discount.
- The dataset has no cost breakdown, so the causes of low margins (cost, pricing or returns) can't be separated.
- It is a sample dataset covering four years.

## Repository structure

```
data/        Sample - Superstore.csv
sql/         01_setup.sql, 02_cleaning.sql, 03_analysis.sql, 04_discounts.sql, 05_trends.sql
dashboard/   retail_sales_profitability.pbix
images/      dashboard screenshots
```

## How to reproduce

1. Create the database and table with `sql/01_setup.sql` and load the CSV.
2. Run `sql/02_cleaning.sql` to build `superstore_clean`.
3. Run the analysis scripts in `sql/` in order.
4. Open the `.pbix` file in Power BI Desktop (or load the cleaned table exported as CSV).

## Author

[Your name] | [LinkedIn URL] | [Email]
