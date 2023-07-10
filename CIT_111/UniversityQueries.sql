-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university_project
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university_project` ;

-- -----------------------------------------------------
-- Schema university_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university_project` DEFAULT CHARACTER SET utf8 ;
USE `university_project` ;

-- -----------------------------------------------------
-- Table `university_project`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`student` ;

CREATE TABLE IF NOT EXISTS `university_project`.`student` (
  `student_id` INT NOT NULL,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`college` ;

CREATE TABLE IF NOT EXISTS `university_project`.`college` (
  `college_id` INT NOT NULL,
  `college_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`dept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`dept` ;

CREATE TABLE IF NOT EXISTS `university_project`.`dept` (
  `dept_id` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  `college_id` INT NOT NULL,
  `dept_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`dept_id`, `college_id`),
  INDEX `fk_dept_college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_dept_college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `university_project`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`course` ;

CREATE TABLE IF NOT EXISTS `university_project`.`course` (
  `course_id` INT NOT NULL,
  `course_code` INT NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `dept_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `dept_id`),
  INDEX `fk_course_dept1_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_dept1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `university_project`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university_project`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(45) NOT NULL,
  `faculty_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`term` ;

CREATE TABLE IF NOT EXISTS `university_project`.`term` (
  `term_id` INT NOT NULL,
  `term` ENUM('Fall', 'Winter', 'Spring', 'Summer') NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`section` ;

CREATE TABLE IF NOT EXISTS `university_project`.`section` (
  `section_id` INT NOT NULL,
  `section_num` INT NOT NULL,
  `capacity` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `faculty_id`, `term_id`, `course_id`),
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university_project`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university_project`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university_project`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university_project`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university_project`.`enrollment` (
  `section_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `student_id`),
  INDEX `fk_section_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_section_has_student_section_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_student_section`
    FOREIGN KEY (`section_id`)
    REFERENCES `university_project`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university_project`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



USE university_project;

INSERT INTO college
(college_id, college_name)
VALUES
(1, 'College of Physical Science and Engineering'),
(2, 'College of Business and Communication'),
(3, 'College of Language and Letters');

INSERT INTO dept
(dept_id, dept_name, dept_code, college_id)
VALUES
(1, 'Computer Information Technology', 'CIT', 1),
(2, 'Economics', 'ECON', 2),
(3, 'Humanities and Philosophy', 'HUM', 3);

INSERT INTO course
(course_id, course_code, course_title, credits, dept_id)
VALUES
(1, '111', 'Intro to Databases', 3, 1),
(2, '388', 'Econometrices', 4, 2),
(3, '150', 'Micro Economics', 3, 2),
(4, '376', 'Classical Heritage', 2, 3);


INSERT INTO faculty
(faculty_id, faculty_fname, faculty_lname)
VALUES
(1, 'Marty', 'Morring'),
(2, 'Nate', 'Norris'),
(3, 'Ben', 'Barrus'),
(4, 'John', 'Jensen'),
(5, 'Bill', 'Barney');

INSERT INTO term
(term_id, term, year)
VALUES
(1, 'Fall', '2019'),
(2, 'Winter', '2018');

INSERT INTO section
(section_id, section_num, capacity, faculty_id, term_id, course_id)
VALUES
(1, 1, 30, 1, 1, 1),
(2, 1, 50, 2, 1, 3),
(3, 2, 50, 2, 1, 3),
(4, 1, 35, 3, 1, 2),
(5, 1, 30, 4, 1, 4),
(6, 2, 30, 1, 2, 1),
(7, 3, 35, 5, 2, 1),
(8, 1, 50, 2, 2, 3),
(9, 2, 50, 2, 2, 3),
(10, 1, 30, 4, 2, 4);

INSERT INTO student
(student_id, f_name, l_name, gender, city, state, birthdate)
VALUES
(1, 'Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
(2, 'Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
(3, 'Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
(4, 'Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
(5, 'Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
(6, 'Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
(7, 'Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
(8, 'Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
(9, 'Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
(10, 'Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

INSERT INTO enrollment
(student_id, section_id)
VALUES
(6, 7),
(7, 6),
(7, 8),
(7, 10),
(4, 5),
(9, 9),
(2, 4),
(3, 4),
(5, 4),
(5, 5),
(1, 1),
(1, 3),
(8, 9),
(10, 6);


-- Query 1
SELECT f_name, l_name, DATE_FORMAT(birthdate, '%M %d, %Y') as 'Sept Birthdays'
FROM student
WHERE MONTH(birthdate) =9;

-- Query 2
SELECT l_name, f_name,
	FLOOR(DATEDIFF('2017-01-05', birthdate)/365) as 'Years',
	ROUND((((DATEDIFF('2017-01-05', birthdate)/365) - (FLOOR(DATEDIFF('2017-01-05', birthdate)/365)))*365)) as 'Days',
    CONCAT(
		FLOOR(DATEDIFF('2017-01-05', birthdate)/365), 
		' - Yrs, ', 
        ROUND((((DATEDIFF('2017-01-05', birthdate)/365) - (FLOOR(DATEDIFF('2017-01-05', birthdate)/365)))*365)), 
		' - Days') as 'Years and Days'
FROM student
ORDER BY Years DESC;

-- Query 3
SELECT f_name, l_name
FROM student st
	JOIN enrollment e ON st.student_id = e.student_id
    JOIN section s ON e.section_id = s.section_id
    JOIN faculty f ON s.faculty_id = f.faculty_id
WHERE faculty_fname = 'John' and faculty_lname = 'Jensen'
ORDER BY l_name;

-- Query 4
SELECT faculty_fname, faculty_lname
FROM student st
	JOIN enrollment e ON st.student_id = e.student_id
    JOIN section s ON e.section_id = s.section_id
    JOIN faculty f ON s.faculty_id = f.faculty_id
    JOIN term t ON s.term_id = t.term_id
WHERE f_name = 'Bryce'
ORDER BY faculty_lname;

-- Query 5
SELECT f_name, l_name
FROM student st
	JOIN enrollment e ON st.student_id = e.student_id
    JOIN section s ON e.section_id = s.section_id
    JOIN course c ON s.course_id = c.course_id
    JOIN term t ON s.term_id = t.term_id
WHERE c.course_id = 2 and t.term_id = 1
ORDER BY l_name;

-- Query 6
SELECT dept_code, course_code, course_title
FROM course c
	JOIN dept d ON d.dept_id = c.dept_id
    JOIN section s ON c.course_id = s.course_id
    JOIN term t ON t.term_id = s.term_id
    JOIN enrollment e ON s.section_id = e.section_id
    JOIN student st ON st.student_id = e.student_id
WHERE term = 'Winter' and f_name = 'Bryce' and l_name = 'Carlson'
ORDER BY course_title;

-- Query 7
SELECT term, year, COUNT(student_id) 'Enrollment'
FROM term t
	JOIN section s ON t.term_id = s.term_id
    JOIN enrollment e ON s.section_id = e.section_id
WHERE t.term_id = 1
GROUP BY t.term_id;

-- Query 8
SELECT college_name, COUNT(course_id) 'Number of Courses'
FROM college u
	JOIN dept d ON u.college_id = d.college_id
    JOIN course c ON d.dept_id = c.dept_id
GROUP BY college_name
ORDER BY college_name;

-- Query 9
SELECT faculty_fname, faculty_lname, SUM(capacity) as 'Teaching Capacity'
FROM faculty f 
	JOIN section s ON f.faculty_id = s.faculty_id
    JOIN term t ON s.term_id = t.term_id
WHERE t.term_id = 2
GROUP BY f.faculty_id
ORDER BY `Teaching Capacity`;

-- Query 10
SELECT l_name, f_name, SUM(credits) 'Credits'
FROM student st 
	JOIN enrollment e ON st.student_id = e.student_id
    JOIN section s ON e.section_id = s.section_id
    JOIN course c ON s.course_id = c.course_id
    JOIN term t ON s.term_id = t.term_id
WHERE t.term_id = 1
GROUP BY st.student_id
HAVING Credits > 3
ORDER BY Credits DESC;

