# Zomato Order & Restaurant Analysis Using Power BI

Capstone project (GUVI–HCL) — analyzing 15,000 orders across 500 restaurants
in 5 cities to uncover pricing, demand, and performance trends.

## Folder structure

```
Zomato_PowerBI_Project/
├── 01_Raw_Data/
│   ├── Zomato_Orders.csv          # 15,000 rows — order-level transactions
│   └── Zomato_Restaurants.csv     # 500 rows — restaurant master data
│
├── 02_SQL_Scripts/
│   ├── 01_create_database.sql     # ZomatoDB + both tables (MySQL DDL)
│   ├── 02_data_cleaning.sql       # duplicate removal, NULL handling
│   ├── 03_data_exploration.sql    # counts, top cities, revenue per restaurant
│   ├── 04_data_aggregation.sql    # avg order/city, top 5 restaurants, KPIs
│   └── 05_data_joins_and_export.sql  # joined view + export instructions
│
├── 03_Transformed_Data/
│   └── Zomato_Transformed_Data.xlsx  # cleaned + joined dataset, ready for Power BI
│
├── 04_PowerBI/
│   └── Zomato_Dashboard.pbix     # step-by-step: rebuild every visual in Power BI Desktop
│
├
│                 
│
├── 05_Documentation/
│   └── (this README + findings — see Key Insights below)
│
├── 06_Presentation/
│   └── Zomato_Project_Presentation.pptx   # stakeholder-facing summary deck
│
└── README.md
```

## How to use this folder

1. ** Power BI:** follow `04_PowerBI/Zomato_Dashboard.pbix `
   step by step, using `03_Transformed_Data/Zomato_Transformed_Data.xlsx` as
   the source.
2. **See the SQL work:** run the scripts in `02_SQL_Scripts/` in numeric order
   against a local MySQL instance (`ZomatoDB`).
3. **Present it:** `07_Presentation/Zomato_Project_Presentation.pptx`.

## Data cleaning summary

The source files were checked for the transformations required by the brief:

- **Duplicates:** 0 found in either file.
- **NULL values:** 0 found in either file (defensive NULL-handling SQL is
  still included in `02_data_cleaning.sql` for future data refreshes).
- **Join key:** `restaurant_id`, present and consistent in both files —
  15,000/15,000 orders join cleanly to a restaurant.

## Key insights

1. **Mumbai and Bangalore lead** both restaurant supply (115 and 109
   restaurants) and order volume (3,384 and 3,300 orders) — together ~44% of
   all orders.
2. **Demand is steady, not seasonal.** Monthly revenue stays within a
   ₹1.26M–₹1.38M band all year, with no sharp festive-season spike in this
   dataset.
3. **Price doesn't buy a better rating.** Average rating is essentially flat
   across price tiers (High 3.79★, Medium 3.77★, Low 3.71★).
4. **Delivery time has no measurable link to customer rating** (correlation
   ≈ 0.007) — worth investigating other satisfaction drivers.
5. **Revenue is broadly diversified** across areas and cuisines — no single
   locality or cuisine dominates the order book.
6. **Top 5 restaurants by revenue** each generate ₹48K–₹51K, a useful
   benchmark for evaluating mid-tier performers.

## Technical tags

SQL · Power BI · Data Cleaning · Data Modeling · Visualization · DAX ·
Business Intelligence
