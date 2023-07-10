-- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university_project
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `university_project` ;

-- -----------------------------------------------------
-- Schema university_project
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `university_project` DEFAULT CHARACTER SET utf8 ;
-- USE `university_project` ;

-- -----------------------------------------------------
-- Table `university_project`.`student`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`student` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`student` (
--   `student_id` INT NOT NULL,
--   `f_name` VARCHAR(45) NOT NULL,
--   `l_name` VARCHAR(45) NOT NULL,
--   `gender` ENUM('M', 'F') NOT NULL,
--   `city` VARCHAR(15) NOT NULL,
--   `state` VARCHAR(2) NOT NULL,
--   `brithdate` DATE NOT NULL,
--   PRIMARY KEY (`student_id`))
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`college`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`college` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`college` (
--   `college_id` INT NOT NULL,
--   `college_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`college_id`))
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`dept`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`dept` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`dept` (
--   `dept_id` INT NOT NULL,
--   `dept_name` VARCHAR(45) NOT NULL,
--   `college_id` INT NOT NULL,
--   PRIMARY KEY (`dept_id`, `college_id`),
--   INDEX `fk_dept_college1_idx` (`college_id` ASC) VISIBLE,
--   CONSTRAINT `fk_dept_college1`
--     FOREIGN KEY (`college_id`)
--     REFERENCES `university_project`.`college` (`college_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`course`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`course` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`course` (
--   `course_id` INT NOT NULL,
--   `course_code` VARCHAR(45) NOT NULL,
--   `course_title` VARCHAR(45) NOT NULL,
--   `credits` INT NOT NULL,
--   `dept_id` INT NOT NULL,
--   PRIMARY KEY (`course_id`, `dept_id`),
--   INDEX `fk_course_dept1_idx` (`dept_id` ASC) VISIBLE,
--   CONSTRAINT `fk_course_dept1`
--     FOREIGN KEY (`dept_id`)
--     REFERENCES `university_project`.`dept` (`dept_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`faculty`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`faculty` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`faculty` (
--   `faculty_id` INT NOT NULL,
--   `faculty_fname` VARCHAR(45) NOT NULL,
--   `faculty_lname` VARCHAR(45) NOT NULL,
--   PRIMARY KEY (`faculty_id`))
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`term`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`term` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`term` (
--   `term_id` INT NOT NULL,
--   `term` ENUM('Fall', 'Winter', 'Spring', 'Summer') NOT NULL,
--   `year` YEAR NOT NULL,
--   PRIMARY KEY (`term_id`))
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`section`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`section` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`section` (
--   `section_id` INT NOT NULL,
--   `section_num` INT NOT NULL,
--   `capacity` INT NOT NULL,
--   `faculty_id` INT NOT NULL,
--   `term_id` INT NOT NULL,
--   `course_id` INT NOT NULL,
--   PRIMARY KEY (`section_id`, `faculty_id`, `term_id`, `course_id`),
--   INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
--   INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
--   INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
--   CONSTRAINT `fk_section_faculty1`
--     FOREIGN KEY (`faculty_id`)
--     REFERENCES `university_project`.`faculty` (`faculty_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_term1`
--     FOREIGN KEY (`term_id`)
--     REFERENCES `university_project`.`term` (`term_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_course1`
--     FOREIGN KEY (`course_id`)
--     REFERENCES `university_project`.`course` (`course_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_project`.`enrollment`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`enrollment` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`enrollment` (
--   `section_id` INT NOT NULL,
--   `student_id` INT NOT NULL,
--   PRIMARY KEY (`section_id`, `student_id`),
--   INDEX `fk_section_has_student_student1_idx` (`student_id` ASC) VISIBLE,
--   INDEX `fk_section_has_student_section_idx` (`section_id` ASC) VISIBLE,
--   CONSTRAINT `fk_section_has_student_section`
--     FOREIGN KEY (`section_id`)
--     REFERENCES `university_project`.`section` (`section_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_has_student_student1`
--     FOREIGN KEY (`student_id`)
--     REFERENCES `university_project`.`student` (`student_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------
-- -- Schema university_project
-- -- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `university_project` ;

-- -- -----------------------------------------------------
-- -- Schema university_project
-- -- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `university_project` DEFAULT CHARACTER SET utf8 ;
-- USE `university_project` ;

-- -- -----------------------------------------------------
-- -- Table `university_project`.`student`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`student` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`student` (
--   `student_id` INT NOT NULL,
--   `f_name` VARCHAR(45) NOT NULL,
--   `l_name` VARCHAR(45) NOT NULL,
--   `gender` ENUM('M', 'F') NOT NULL,
--   `city` VARCHAR(15) NOT NULL,
--   `state` VARCHAR(2) NOT NULL,
--   `brithdate` DATE NOT NULL,
--   PRIMARY KEY (`student_id`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`college`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`college` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`college` (
--   `college_id` INT NOT NULL,
--   `college_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`college_id`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`dept`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`dept` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`dept` (
--   `dept_id` INT NOT NULL,
--   `dept_name` VARCHAR(45) NOT NULL,
--   `college_id` INT NOT NULL,
--   PRIMARY KEY (`dept_id`, `college_id`),
--   INDEX `fk_dept_college1_idx` (`college_id` ASC) VISIBLE,
--   CONSTRAINT `fk_dept_college1`
--     FOREIGN KEY (`college_id`)
--     REFERENCES `university_project`.`college` (`college_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`course`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`course` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`course` (
--   `course_id` INT NOT NULL,
--   `course_code` VARCHAR(45) NOT NULL,
--   `course_title` VARCHAR(45) NOT NULL,
--   `credits` INT NOT NULL,
--   `dept_id` INT NOT NULL,
--   PRIMARY KEY (`course_id`, `dept_id`),
--   INDEX `fk_course_dept1_idx` (`dept_id` ASC) VISIBLE,
--   CONSTRAINT `fk_course_dept1`
--     FOREIGN KEY (`dept_id`)
--     REFERENCES `university_project`.`dept` (`dept_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`faculty`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`faculty` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`faculty` (
--   `faculty_id` INT NOT NULL,
--   `faculty_fname` VARCHAR(45) NOT NULL,
--   `faculty_lname` VARCHAR(45) NOT NULL,
--   PRIMARY KEY (`faculty_id`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`term`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`term` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`term` (
--   `term_id` INT NOT NULL,
--   `term` ENUM('Fall', 'Winter', 'Spring', 'Summer') NOT NULL,
--   `year` YEAR NOT NULL,
--   PRIMARY KEY (`term_id`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`section`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`section` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`section` (
--   `section_id` INT NOT NULL,
--   `section_num` INT NOT NULL,
--   `capacity` INT NOT NULL,
--   `faculty_id` INT NOT NULL,
--   `term_id` INT NOT NULL,
--   `course_id` INT NOT NULL,
--   PRIMARY KEY (`section_id`, `faculty_id`, `term_id`, `course_id`),
--   INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
--   INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
--   INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
--   CONSTRAINT `fk_section_faculty1`
--     FOREIGN KEY (`faculty_id`)
--     REFERENCES `university_project`.`faculty` (`faculty_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_term1`
--     FOREIGN KEY (`term_id`)
--     REFERENCES `university_project`.`term` (`term_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_course1`
--     FOREIGN KEY (`course_id`)
--     REFERENCES `university_project`.`course` (`course_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `university_project`.`enrollment`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `university_project`.`enrollment` ;

-- CREATE TABLE IF NOT EXISTS `university_project`.`enrollment` (
--   `section_id` INT NOT NULL,
--   `student_id` INT NOT NULL,
--   PRIMARY KEY (`section_id`, `student_id`),
--   INDEX `fk_section_has_student_student1_idx` (`student_id` ASC) VISIBLE,
--   INDEX `fk_section_has_student_section_idx` (`section_id` ASC) VISIBLE,
--   CONSTRAINT `fk_section_has_student_section`
--     FOREIGN KEY (`section_id`)
--     REFERENCES `university_project`.`section` (`section_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_section_has_student_student1`
--     FOREIGN KEY (`student_id`)
--     REFERENCES `university_project`.`student` (`student_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE university_project;

INSERT INTO college
(college_id, college_name)
VALUES
(1, 'College of Physical Science and Engineering'),
(2, 'College of Business and Communication'),
(3, 'College of Language and Letters');

INSERT INTO dept
(dept_id, dept_name, college_id)
VALUES
(1, 'Computer Information Technology', 1),
(2, 'Economics', 2),
(3, 'Humanities and Philosophy', 3);

INSERT INTO course
(course_id, course_code, course_title, credits, dept_id)
VALUES
(1, 'CIT 111', 'Intro to Databases', 3, 1),
(2, 'ECON 388', 'Econometrices', 4, 2),
(3, 'ECON 150', 'Micro Economics', 3, 2),
(4, 'HUM 376', 'Classical Heritage', 2, 3);


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
(student_id, f_name, l_name, gender, city, state, brithdate)
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

-- USE university_project;

-- SELECT f_name, 
-- 	CONCAT('enrolled in ', course_code) as course, 
-- 	CONCAT(term, ' ', year) AS semester, 
-- 	CONCAT('Section ', section_num) AS section
-- FROM student p
-- 	INNER JOIN enrollment e ON p.student_id = e.student_id
--     INNER JOIN section s ON e.section_id = s.section_id
--     INNER JOIN term t ON s.term_id = t.term_id
--     INNER JOIN course c ON s.course_id = c.course_id
-- ORDER BY f_name;