# Project Documentation — Zomato Order & Restaurant Analysis

## Problem statement
Analyze and visualize Zomato's restaurant and order data to uncover trends in
customer preferences, restaurant performance, pricing impact, and
location-based insights, turning raw data into actionable business
intelligence.

## Business use cases addressed
- Identifying top-performing restaurants based on ratings and order volume.
- Analyzing how pricing impacts customer orders.
- Understanding customer preferences in different cities and areas.
- Optimizing delivery times and improving efficiency.
- Surfacing demand trends to support future growth planning.

## Dataset
| File | Rows | Description |
|---|---|---|
| `Zomato_Orders.csv` | 15,000 | order_id, restaurant_id, customer_id, order_date, order_time, delivery_time, total_cost, item_count, payment_method, customer_rating |
| `Zomato_Restaurants.csv` | 500 | restaurant_id, restaurant_name, city, area, cuisine, avg_rating, total_ratings, price_range, delivery_available |

Join key: `restaurant_id` (1 restaurant → many orders).

## Data quality findings
- No NULL values in either file.
- No duplicate rows in either file.
- All 15,000 orders reference a valid `restaurant_id`.
- Date range: 2024-01-01 to 2024-12-28 (full calendar year).
- 5 cities (Mumbai, Bangalore, Delhi, Kolkata, Chennai), 5 areas (Area_A–E),
  5 cuisines (Indian, Chinese, Italian, Mexican, Thai), 3 price tiers
  (Low/Medium/High).

## Findings by task (maps to the 10 Power BI tasks in the brief)

1. **Restaurants per city** — Mumbai (115) and Bangalore (109) have the
   densest restaurant supply; Chennai (91) the lowest.
2. **Order share by city** — Mumbai (22.6%) and Bangalore (22.0%) generate
   the largest share of orders; Chennai and Kolkata trail at ~18.2% each.
   Supply and demand are broadly proportional across cities — no city is
   badly under- or over-supplied relative to its order volume.
3. **Order amount trend over time** — Revenue is stable month over month
   (₹1.26M–₹1.38M), a ~9% swing with no clear seasonal pattern in this
   dataset.
4. **Correlation of factors affecting rating** — Price range, delivery time
   and order volume all show near-zero correlation with rating in this
   dataset (|r| < 0.01 in every pairing tested). Ratings appear independent
   of the operational metrics captured here.
5. **Top 5 restaurants by total sales** — Restaurant_116, Restaurant_262,
   Restaurant_56, Restaurant_27, Restaurant_127 — all within a tight
   ₹48,203–₹50,931 band.
6. **Revenue by area (tree map)** — Area_A leads (₹33.9L) with the other
   four areas (B–E) close behind, within a ~15% spread — a diversified
   footprint rather than one dominant locality.
7. **Order density by city (heat map)** — Mirrors the order-share findings:
   Mumbai and Bangalore are the "hottest" cities by order count.
8. **KPI cards** — Total Revenue ₹1.56 Cr · Avg Order Value ₹1,038.26 ·
   15,000 orders · 52.4 min avg delivery time · 3.00★ avg rating.
9. **Restaurant-wise sales summary** — see the sortable table in the HTML
   dashboard and the `Zomato_Full_Data` sheet for the full 500-restaurant
   breakdown.
10. **Combined dashboard** — delivered as `05_HTML_Dashboard/index.html`
    (interactive preview) with a full Power BI build path in
    `04_PowerBI_Guide/PowerBI_Build_Guide.md`.

## Business recommendations
- **Invest delivery/marketing capacity in Mumbai and Bangalore first** — they
  already carry ~44% of order volume and have room to convert restaurant
  density into further growth.
- **Don't rely on delivery-time-only campaigns to lift ratings** — the data
  shows no relationship between delivery speed and customer rating; pair any
  speed initiative with a food-quality or order-accuracy metric.
- **Premium pricing needs a differentiated pitch.** Since price tier doesn't
  correlate with rating, "High" price-range restaurants should compete on
  something other than perceived quality (ambience, exclusivity, portion
  size) to justify the premium.
- **Study the top 5 restaurants as a playbook** for mid-performing outlets in
  the same cities/cuisines.

## Deliverables checklist
- [x] MySQL database export (SQL scripts, `02_SQL_Scripts/`)
- [x] Transformed dataset (`03_Transformed_Data/Zomato_Transformed_Data.xlsx`)
- [x] Power BI Report — build guide provided (`04_PowerBI_Guide/`); build the
      `.pbix` locally following the guide, since Power BI Desktop isn't
      available in this environment
- [x] Interactive dashboard preview (`05_HTML_Dashboard/index.html`)
- [x] Project documentation (this file + root `README.md`)
- [x] Presentation deck (`07_Presentation/`)
