create  database abc;

DROP DATABASE IF EXISTS abc;
CREATE DATABASE abc;

USE abc;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2)
);

CREATE DATABASE IF NOT EXISTS a;
USE a;

CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

create table student 
(stuname varchar(50),stuid int,stuage int);
desc student;

-- ALTER

alter table student
add column course char(10);

alter table student 
add column fee int ;

alter table student
drop column course;

alter table student
rename column fee to course_fee;
desc student;

alter table student 
modify column stuname char(10);


select * from student;

truncate table student;

desc student;
select * from student;

drop table student;
desc abc.student;

-- ALTER CONSTRAINTS

drop table employees;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,              -- PRIMARY KEY
    email VARCHAR(100) UNIQUE,            -- UNIQUE
    name VARCHAR(50) NOT NULL,             -- NOT NULL
    age INT CHECK (age >= 18),             -- CHECK
    salary DECIMAL(10,2) DEFAULT 25000   -- DEFAULT
    );

-- Modify NOT NULL Constraint

ALTER TABLE Employees
MODIFY name VARCHAR(50) ;

desc employees;
-- 👉 Make it NOT NULL again
ALTER TABLE Employees
MODIFY name VARCHAR(50) NOT NULL;


-- 2. Modify DEFAULT Value
--  Change default salary

ALTER TABLE employees
MODIFY salary DECIMAL(10,2) DEFAULT 75000;


 

-- -- DROP 
 --  Drop primary key

ALTER TABLE Employees
DROP PRIMARY KEY;


desc employees;

--  Add new primary key
ALTER TABLE Employees
ADD PRIMARY KEY (emp_id);

ALTER TABLE table_name
DROP FOREIGN KEY fk_name;


drop table student;
desc student;






