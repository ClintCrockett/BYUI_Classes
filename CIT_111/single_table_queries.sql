USE art_gallery;

-- Query 1
INSERT INTO artist
(fname, lname, dob, dod, country, local_artist)
VALUES
('Johannes', 'Vermeer', 1632, 1674, 'Netherlands', 'n');

-- Query 2
SELECT fname, mname, lname, dob, dod, country, local_artist
FROM artist
ORDER BY lname;

-- Query 3
UPDATE artist
SET dod = 1675
WHERE lname = 'Vermeer' and fname = 'Johannes';

-- Query 4
DELETE FROM artist
WHERE lname = 'Vermeer' and fname = 'Johannes';

USE bike;

-- Query 5
SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Houston' and state = 'TX';

-- Query 6
SELECT product_name, list_price, list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC; 

-- Query 7
SELECT first_name, last_name, email
FROM staff
WHERE store_id != 1;

-- Query 8
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';

-- Query 9
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- Query 10
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL AND city LIKE '%ach%' OR '%och%' OR last_name = 'William'
LIMIT 5;

-- Query 10 if we only wanted people with phone numbers?
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL AND city LIKE '%ach%' OR '%och%' OR phone IS NOT NULL AND last_name = 'William'
LIMIT 5;






