USE bike;

--  Concatinating
SELECT CONCAT(first_name, ' ', last_name, ', ', TRIM(street), ', ', city, ' ', state) AS adress
FROM customer
Order BY first_name, last_name;

--  Finding how many letters before -
SELECT product_name, LOCATE('-',  product_name)
FROM product
ORDER BY LOCATE('-', product_name) DESC;

-- Finding how many letters before - starting backwards
SELECT product_name, LOCATE('-',  product_name), 
    LENGTH(product_name) - LOCATE('-',  REVERSE(product_name)) + 1
FROM product
ORDER BY LOCATE('-', product_name);

-- First word of the product name
SELECT product_name, LOCATE(' ',  product_name),
	LEFT(product_name, LOCATE(' ', product_name) - 1)
FROM product
ORDER BY LOCATE('-', product_name);

-- Adding days to a date
SELECT order_date, DATE_ADD(order_date, INTERVAL 25 DAY)
FROM cust_order
ORDER BY order_date;

SELECT order_date, shipped_date, DATEDIFF(order_date, shipped_date)
FROM cust_order
ORDER BY order_date;








