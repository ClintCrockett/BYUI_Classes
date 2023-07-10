USE world;

SELECT Name, Population
FROM country
WHERE Population < 5000000
ORDER BY Population DESC;

SELECT Language
FROM countrylanguage
GROUP BY Language
ORDER BY Language;

SELECT Continent, COUNT(Code)
FROM country
GROUP BY Continent;


SELECT 
	CONCAT('Country - ', Name) AS Name, 
	CONCAT('Avg_Population_of_Cities - ', ROUND(COUNT(Population))) AS Population
FROM country
GROUP BY Name
HAVING Name = 'China'
ORDER BY AVG(Population) DESC;

SELECT 
	c.Name Country, 
	ROUND(AVG(city.Population)) Avg_Population_of_Cities
FROM country c
	JOIN city ON c.Code = city.CountryCode
WHERE c.Name = 'Australia'
GROUP BY c.Name
ORDER BY AVG(city.Population) DESC;
