USE bike;

-- Query 1
SELECT ROUND(AVG(quantity)) AS 'Stock Average'
FROM stock;

-- Query 2
SELECT DISTINCT product_name 
FROM product p JOIN stock s ON p.product_id = s.product_id
WHERE quantity = 0
ORDER BY product_name;

-- Query 3
SELECT category_name, COUNT(quantity) as 'instock'
FROM store s 
	JOIN stock q ON s.store_id = q.store_id
    JOIN product p ON q.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
WHERE store_name = 'Baldwin Bikes'
GROUP BY category_name
ORDER BY instock;


USE employees;
-- Query 4
SELECT COUNT(emp_no) as 'Number of Employees'
FROM employees;

-- Query 5
SELECT dept_name, ROUND(AVG(salary), 2) as average_salary
FROM salaries s 
	JOIN dept_emp e ON s.emp_no = e.emp_no
    JOIN departments d ON d.dept_no = e.dept_no
GROUP BY dept_name
HAVING average_salary < 60000;

-- Query 6
SELECT d.dept_name, COUNT(e.gender) as 'Number of Females'
FROM employees e 
	JOIN dept_emp u ON e.emp_no = u.emp_no
    JOIN departments d ON u.dept_no = d.dept_no
WHERE gender = 'F'
GROUP BY dept_name
ORDER BY dept_name;