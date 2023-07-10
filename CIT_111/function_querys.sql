USE magazine;

-- Query 1
SELECT magazineName, ROUND(magazinePrice - magazinePrice * .03, 2) AS magazinePrice
FROM magazine;

-- Query 2
SELECT subscriptionKey, 
	ROUND(DATEDIFF('2020-12-20', subscriptionStartDate)/365) AS 'Years since subscription'
FROM subscription;


-- Query 3
SELECT subscriptionStartDate, subscriptionLength,
	DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%M %d, %Y') AS 'Subscription end'
FROM subscription;

USE bike;

-- Query 4
SELECT TRIM(LEFT(product_name, LOCATE(' - ', product_name))) AS product_name
FROM product
ORDER BY product_id
LIMIT 14;


-- Query 5
SELECT product_name, CONCAT('$', FORMAT(list_price / 3, 2, 'en-US')) AS 'One of 3 payments'
FROM product
WHERE model_year = '2019';
