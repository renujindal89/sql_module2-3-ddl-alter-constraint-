 SET SQL_SAFE_UPDATES = 0;

int -2,147,483,648 to 2,147,483,647
 unsigned 0 to 4,294,967,295
 char 0 to 255 characters  1 char 1 byte
 varchar 0 to 65535 bytes
 
 
 
 CREATE TABLE datatype_demo (
    id INT,
    age INT UNSIGNED,
    code CHAR(5),
    name VARCHAR(20)
);

INSERT INTO datatype_demo (id, age, code, name) VALUES
(1, 25, 'A101', 'Rohit'),
(2, 30, 'B22', 'Sneha'),
(3, 18, 'XYZ', 'Amit'),
(4, 45, 'PQR12', 'Priya');

update datatype_demo
set age=60
where id=2;


-- Create Database --
CREATE DATABASE company;
Drop database company;
-- Select Database --
USE  company;



CREATE TABLE employees (
    emp_id INT PRIMARY KEY,  -- uniquess,not null        -- Primary Key
    email VARCHAR(100) UNIQUE,  -- uniquess,null allowed      -- Unique Constraint
    name VARCHAR(50),
    salary DECIMAL(10,2)
   );
   
   
   insert into employees values
   (2,'renugoel89@gmail.com','renu goel',1000);
   
   insert into employees 
   values (7,'sumit1','a',400);
   
   
   desc employees;
   
   select * from employees;
   insert into employees values
    (2,'renugoel@gmail.com','renu jindal',1000);	
    
   select * from employees;
   insert into employees values
   (2,'renu1goel@gmail.com','ritu',1000);
   insert into employees values
   (2,'renugoel@outlook.com','renu',1000);
   insert into employees (email,name,salary)values
   ('sahil@gmail.com','renu',1000.00);
   
   desc employees;
   select * from employees;
   
INSERT INTO employees VALUES
(1, 'rohit@gmail.com', 'Rohit', 50000),
(2, 'priya@gmail.com', 'Priya', 60000);
INSERT INTO employees VALUES
(3, 'rohit@gmail.com', 'Amit', 45000);


-- CREATE TABLE WITH CONTRAINTS--
CREATE TABLE employee(emp_id INT PRIMARY KEY, 
name VARCHAR(15) , 
email VARCHAR(30) UNIQUE ,
phone_number CHAR(10) DEFAULT 'N/A' ,
 age INT CHECK (age  between 18 and 60) , 
deptment varchar(15) NOT NULL);

insert into employee values (7,'saba','saba@gmail.com',20,'sql');
select * from employee;
-- Insert values --
INSERT INTO employee(emp_id,name , email , phone_number , age , deptment) 
VALUES(1,'jatin', 'jatintest333@gmail.com' , 963258741 , 19 , 'IT'),
(2,'kamal', 'jatintest44@gmail.com' , 9632556444 , 20 , 'HR'),
(3,'jatin', 'test@gmail.com' ,8548555775, 21 , 'dev app'), 
(4,'jatin', 'test444@gmail.com' ,2644758556, 21 , 'dev app');
desc employee;
-- 1. Change Primary Key
ALTER TABLE employee
DROP PRIMARY KEY;

ALTER TABLE employee
ADD PRIMARY KEY (emp_id);

desc employee;

-- 2. Change UNIQUE Constraint
-- First find the index name:

SHOW INDEX FROM employee;

-- Then:

ALTER TABLE employee
DROP INDEX email;

ALTER TABLE employee
ADD CONSTRAINT uq_email UNIQUE (email);

-- 3. Change DEFAULT Value
ALTER TABLE employee
ALTER COLUMN phone_number SET DEFAULT '0000000000';
desc employee;
-- Or:

ALTER TABLE employee
MODIFY phone_number CHAR(10) DEFAULT '0000000000';

-- 4. Change NOT NULL Constraint

-- Allow NULLs:

ALTER TABLE employee
MODIFY deptment VARCHAR(15) NULL;

-- Make it NOT NULL again:

ALTER TABLE employee
MODIFY deptment VARCHAR(15) NOT NULL;

desc employee;
-- 5. Change CHECK Constraint

ALTER TABLE employee
DROP CHECK employee_chk_1;

ALTER TABLE employee
ADD CONSTRAINT chk_age
CHECK (age between 18 and 40);


desc employee;

create table renu (id int auto_increment primary key,name varchar(10));
insert into renu (name)values ('ritu');
select * from renu;
-- 6. Remove AUTO_INCREMENT
ALTER TABLE employee
MODIFY emp_id INT;

-- Add AUTO_INCREMENT back:

ALTER TABLE employee
MODIFY emp_id INT AUTO_INCREMENT;

-- View All Constraints
SHOW CREATE TABLE employees1;

-- or
-- or 

CREATE TABLE Employees1 (
    emp_id INT ,
    email VARCHAR(100),
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2) DEFAULT 25000,

    CONSTRAINT pk_emp PRIMARY KEY (emp_id),

    CONSTRAINT uq_email UNIQUE (email),

    CONSTRAINT chk_age CHECK (age >= 18),

    CONSTRAINT chk_salary CHECK (salary >= 10000)
);
	CREATE TABLE Employees1 (
     emp_id INT ,
     email VARCHAR(100),
     name VARCHAR(50),
     age INT,
     salary DECIMAL(10,2) DEFAULT 25000,
 
     CONSTRAINT pk_emp PRIMARY KEY (emp_id),
 
     CONSTRAINT uq_email UNIQUE (email),
 
     CONSTRAINT chk_age1 CHECK (age >= 18),
 
     CONSTRAINT chk_salary CHECK (salary >= 10000)
 )	;
desc employees1;

-- PRIMARY WITH FOREIGN KEY

create table parent
(corname varchar(50) primary key);

insert into parent 
values ('data'),('engg'),('ai');
select * from parent;


-- child table
create table  child
(stuid int primary key,
name varchar(40),
corsename varchar(50),
FOREIGN KEY (corsename)
 REFERENCES parent(corname)
);  -- Prevents deletion if child rows exist.


insert into child values
(11,'renu','data'),
(12,'ritu','engg'),
(13,'sahil','ai');

select * from child;
 -- CASE 1   CHILD TABLE ERROR
 
 
 select * from parent;
 -- ADD A NEW STUDENT  IN NEW COURSE JAVA
insert into child values
(14,'sneha','java');                                -- can not add new course in child  table 

insert into parent values ('java');

select * from parent;
select * from child;

-- ADDA NEW STUDENT IN OLD COURSE 
insert into child values
(15,'yuvaan','ai');  


select * from child;
select * from parent;



-- CASE 2
-- DELETE A COURSE FROM OUR INSTITUTE "DATA"


-- Try deleting a parent row (will give foreign key error)
select * from child;
DELETE FROM parent
WHERE corname = 'ai';                           # renu emrolled in data course

insert into parent values ('ml');

select * from parent;


UPDATE  parent
SET corname = 'data analyst'
where corname='data'; 
select * from child;


-- ADD ANEW COURSE IN INSTITUTE
insert into parent values ('java');


DELETE FROM parent
WHERE corname = 'data';  -- Since no student has java, it works

select * from child;
select * from parent;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,          -- Primary Key
    email VARCHAR(100) UNIQUE,      -- Unique Constraint
    name VARCHAR(50),
    salary DECIMAL(10,2)
   );
   
   
   insert into employees values
   (1,'renugoel@gmail.com','renu',1000);
   insert into employees values
   (2,'renu1goel@gmail.com','ritu',1000);
   insert into employees values
   (2,'renugoel@outlook.com','renu',1000);
   insert into employees (email,name,salary)values
   ('sahil@gmail.com','renu',1000.00);
   
   desc employees;
   select * from employees;
   
INSERT INTO employees VALUES
(1, 'rohit@gmail.com', 'Rohit', 50000),
(2, 'priya@gmail.com', 'Priya', 60000);
INSERT INTO employees VALUES
(3, 'rohit@gmail.com', 'Amit', 45000);


CREATE TABLE child (
    stuid INT PRIMARY KEY,
    name VARCHAR(40),
    corsename VARCHAR(50),

    FOREIGN KEY (corsename)
    REFERENCES parent(corname)

    ON UPDATE CASCADE
);

INSERT INTO parent VALUES
('data'),
('engg'),
('ai');

INSERT INTO child VALUES
(11, 'Renu', 'data'),
(12, 'Ritu', 'engg'),
(13, 'Sahil', 'ai');

UPDATE parent
SET corname = 'data analyst'
WHERE corname = 'data';

select * from parent;
select * from child;
