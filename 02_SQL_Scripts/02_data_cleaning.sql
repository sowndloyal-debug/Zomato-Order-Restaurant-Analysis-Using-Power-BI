-- ============================================================
-- Script 02: Basic Data Cleaning
-- ============================================================
USE ZomatoDB;

-- ------------------------------------------------------------
-- 1. Remove duplicate records (keep the lowest order_id / restaurant_id
--    per duplicate group, in case the same natural key repeats)
-- ------------------------------------------------------------
DELETE o1 FROM Zomato_Orders o1
INNER JOIN Zomato_Orders o2
    ON o1.order_id = o2.order_id
    AND o1.customer_id = o2.customer_id
    AND o1.order_date  = o2.order_date
    AND o1.total_cost  = o2.total_cost
    AND o1.order_id > o2.order_id;   -- deletes the later duplicate copy

DELETE r1 FROM Zomato_Restaurants r1
INNER JOIN Zomato_Restaurants r2
    ON r1.restaurant_name = r2.restaurant_name
    AND r1.city = r2.city
    AND r1.area = r2.area
    AND r1.restaurant_id > r2.restaurant_id;

-- ------------------------------------------------------------
-- 2. Handle NULL / blank values
--    (source data was verified clean - 0 NULLs across both files -
--     these statements are defensive, so the pipeline is safe to
--     re-run on any future data refresh that may contain gaps)
-- ------------------------------------------------------------
UPDATE Zomato_Orders
SET delivery_time = (SELECT AVG(delivery_time) FROM (SELECT * FROM Zomato_Orders) x)
WHERE delivery_time IS NULL;

UPDATE Zomato_Orders
SET customer_rating = 0
WHERE customer_rating IS NULL;

UPDATE Zomato_Orders
SET payment_method = 'Unknown'
WHERE payment_method IS NULL OR TRIM(payment_method) = '';

UPDATE Zomato_Restaurants
SET avg_rating = 0
WHERE avg_rating IS NULL;

UPDATE Zomato_Restaurants
SET price_range = 'Not Specified'
WHERE price_range IS NULL OR TRIM(price_range) = '';

-- ------------------------------------------------------------
-- 3. Trim stray whitespace on text fields
-- ------------------------------------------------------------
UPDATE Zomato_Restaurants
SET restaurant_name = TRIM(restaurant_name),
    city = TRIM(city),
    area = TRIM(area),
    cuisine = TRIM(cuisine);

-- ------------------------------------------------------------
-- 4. Referential-integrity check: orders pointing to a restaurant
--    that no longer exists (orphans) - review before deleting
-- ------------------------------------------------------------
SELECT o.order_id, o.restaurant_id
FROM Zomato_Orders o
LEFT JOIN Zomato_Restaurants r ON o.restaurant_id = r.restaurant_id
WHERE r.restaurant_id IS NULL;
