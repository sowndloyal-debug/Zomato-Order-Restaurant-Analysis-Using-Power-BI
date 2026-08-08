-- ============================================================
-- ZOMATO ORDER & RESTAURANT ANALYSIS
-- Script 01: Database & Table Creation
-- ============================================================

CREATE DATABASE IF NOT EXISTS ZomatoDB;
USE ZomatoDB;

-- ------------------------------------------------------------
-- Table: Zomato_Restaurants
-- ------------------------------------------------------------
DROP TABLE IF EXISTS Zomato_Restaurants;
CREATE TABLE Zomato_Restaurants (
    restaurant_id       VARCHAR(20) PRIMARY KEY,
    restaurant_name     VARCHAR(100) NOT NULL,
    city                VARCHAR(50)  NOT NULL,
    area                VARCHAR(50)  NOT NULL,
    cuisine             VARCHAR(50)  NOT NULL,
    avg_rating          DECIMAL(3,1) NOT NULL,
    total_ratings       INT          NOT NULL,
    price_range         VARCHAR(10)  NOT NULL,   -- Low / Medium / High
    delivery_available  VARCHAR(3)   NOT NULL    -- Yes / No
);

-- ------------------------------------------------------------
-- Table: Zomato_Orders
-- ------------------------------------------------------------
DROP TABLE IF EXISTS Zomato_Orders;
CREATE TABLE Zomato_Orders (
    order_id         VARCHAR(20) PRIMARY KEY,
    restaurant_id    VARCHAR(20) NOT NULL,
    customer_id      VARCHAR(20) NOT NULL,
    order_date       DATE        NOT NULL,
    order_time       TIME        NOT NULL,
    delivery_time    INT         NOT NULL,       -- minutes
    total_cost       DECIMAL(10,2) NOT NULL,
    item_count       INT         NOT NULL,
    payment_method   VARCHAR(20) NOT NULL,
    customer_rating  DECIMAL(3,1) NOT NULL,
    CONSTRAINT fk_restaurant FOREIGN KEY (restaurant_id)
        REFERENCES Zomato_Restaurants (restaurant_id)
);

-- ------------------------------------------------------------
-- Load data (run from MySQL client with --local-infile=1,
-- or use Table Data Import Wizard in MySQL Workbench)
-- ------------------------------------------------------------
-- LOAD DATA LOCAL INFILE '/path/to/Zomato_Restaurants.csv'
-- INTO TABLE Zomato_Restaurants
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- LOAD DATA LOCAL INFILE '/path/to/Zomato_Orders.csv'
-- INTO TABLE Zomato_Orders
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- Quick sanity check
SELECT COUNT(*) AS restaurant_rows FROM Zomato_Restaurants;
SELECT COUNT(*) AS order_rows FROM Zomato_Orders;
