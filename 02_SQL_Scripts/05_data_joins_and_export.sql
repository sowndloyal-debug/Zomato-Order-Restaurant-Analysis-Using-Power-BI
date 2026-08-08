-- ============================================================
-- Script 05: Data Joins & Final Export View
-- ============================================================
USE ZomatoDB;

-- Join Zomato_Orders and Zomato_Restaurants to get restaurant
-- names/attributes alongside every order's details.
DROP VIEW IF EXISTS vw_Zomato_Full;
CREATE VIEW vw_Zomato_Full AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_time,
    o.delivery_time,
    o.total_cost,
    o.item_count,
    o.payment_method,
    o.customer_rating,
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.area,
    r.cuisine,
    r.avg_rating,
    r.total_ratings,
    r.price_range,
    r.delivery_available
FROM Zomato_Orders o
JOIN Zomato_Restaurants r ON o.restaurant_id = r.restaurant_id;

SELECT * FROM vw_Zomato_Full LIMIT 20;

-- ------------------------------------------------------------
-- Export the transformed dataset as Excel/CSV:
-- In MySQL Workbench -> run "SELECT * FROM vw_Zomato_Full;"
-- -> click the Export/Save icon on the result grid ->
-- save as Zomato_Transformed_Data.xlsx
-- (This project ships that exported file pre-built in
--  ../03_Transformed_Data/Zomato_Transformed_Data.xlsx,
--  generated with the equivalent pandas merge so you can load
--  it into Power BI immediately without installing MySQL.)
-- ------------------------------------------------------------
