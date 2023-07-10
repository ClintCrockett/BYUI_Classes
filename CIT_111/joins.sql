USE v_art;

-- Query One
SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- Query Two
SELECT a.artfile
FROM artwork a 
	JOIN artwork_keyword ak ON a.artwork_id = ak.artwork_id
    JOIN keyword k ON ak.keyword_id = k.keyword_id
WHERE k.keyword = 'flowers';

-- Query Three
SELECT fname, lname, title
FROM artist a JOIN artwork w ON a.artist_id = w.artist_id;


USE magazine;

-- Query Four
SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine m 
	JOIN subscription b ON m.magazineKey = b.magazineKey
	JOIN subscriber s ON b.subscriberKey = s.subscriberKey
ORDER BY magazineName;

-- Query Five
SELECT magazineName
FROM magazine m 
	JOIN subscription b ON m.magazineKey = b.magazineKey
	JOIN subscriber s ON b.subscriberKey = s.subscriberKey
WHERE subscriberFirstName = 'Samantha' and subscriberLastName = 'Sanders';


USE employees;

-- Query Six
SELECT first_name, last_name
FROM employees
ORDER BY last_name
LIMIT 5;

-- Query Seven
SELECT first_name, last_name, dept_name, salary, s.from_date
FROM employees e 
	JOIN dept_emp d ON e.emp_no = d.emp_no
    JOIN departments dep ON d.dept_no = dep.dept_no
    JOIN salaries s ON e.emp_no = s.emp_no
WHERE first_name = 'Berni' and last_name = 'Genin'
ORDER BY from_date DESC
LIMIT 1;

