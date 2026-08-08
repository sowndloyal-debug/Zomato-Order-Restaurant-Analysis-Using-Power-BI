-- ============================================================
-- Script 04: Data Aggregation
-- ============================================================
USE ZomatoDB;

-- 1. Average order amount for each city
SELECT r.city, ROUND(AVG(o.total_cost), 2) AS avg_order_amount
FROM Zomato_Orders o
JOIN Zomato_Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY avg_order_amount DESC;

-- 2. Top 5 restaurants with the highest total sales
SELECT r.restaurant_name, SUM(o.total_cost) AS total_sales
FROM Zomato_Orders o
JOIN Zomato_Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_sales DESC
LIMIT 5;

-- Bonus aggregations used later in Power BI --------------------

-- Revenue by area (for the tree map)
SELECT r.area, SUM(o.total_cost) AS total_revenue
FROM Zomato_Orders o
JOIN Zomato_Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.area
ORDER BY total_revenue DESC;

-- Monthly order-amount trend (for the line chart)
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
       SUM(o.total_cost) AS monthly_revenue,
       COUNT(*) AS monthly_orders
FROM Zomato_Orders o
GROUP BY order_month
ORDER BY order_month;

-- Price range vs. average rating
SELECT price_range, ROUND(AVG(avg_rating), 2) AS avg_rating
FROM Zomato_Restaurants
GROUP BY price_range;

-- Payment method distribution
SELECT payment_method, COUNT(*) AS order_count
FROM Zomato_Orders
GROUP BY payment_method
ORDER BY order_count DESC;

-- KPI figures: total revenue & average order value
SELECT SUM(total_cost) AS total_revenue,
       ROUND(AVG(total_cost), 2) AS avg_order_value,
       COUNT(*) AS total_orders,
       ROUND(AVG(delivery_time), 1) AS avg_delivery_time_min,
       ROUND(AVG(customer_rating), 2) AS avg_customer_rating
FROM Zomato_Orders;
