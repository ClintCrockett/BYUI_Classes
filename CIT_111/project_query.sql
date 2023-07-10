USE university_project;

SELECT f_name, 
	CONCAT('enrolled in ', course_code) as course, 
	CONCAT(term, ' ', year) AS semester, 
	CONCAT('Section ', section_num) AS section
FROM student p
	INNER JOIN enrollment e ON p.student_id = e.student_id
    INNER JOIN section s ON e.section_id = s.section_id
    INNER JOIN term t ON s.term_id = t.term_id
    INNER JOIN course c ON s.course_id = c.course_id
ORDER BY f_name;

