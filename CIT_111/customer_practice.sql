USE bike;

-- Assending order
SELECT product_name, model_year, list_price
FROM product
WHERE model_year = 2018
ORDER BY list_price;

-- Descending order
SELECT product_name, model_year, list_price
FROM product
WHERE model_year = 2018
ORDER BY list_price DESC;

-- Ywo years
SELECT product_name, model_year, list_price
FROM product
WHERE model_year = 2018 or model_year = 2017
ORDER BY list_price DESC, model_year;

-- -- Making an aliase
SELECT product_name, model_year, list_price,
ROUND(list_price * 0.2, 2) AS discount_amount
FROM product
WHERE model_year = 2018 or model_year = 2017
ORDER BY list_price DESC, model_year;

-- Customers in NY
SELECT first_name, last_name, phone, city
FROM customer
WHERE state = "NY" and phone IS NOT NULL;

-- All people from Texas Without a phone and order emails alphabetical 
SELECT first_name, last_name, email
FROM customer
WHERE state = "TX" and phone IS NULL
ORDER BY email;

-- Orders that havent been shipped out yet
SELECT store_id, cust_order_id, order_date, required_date, shipped_date
FROM cust_order
WHERE shipped_date IS NULL;
