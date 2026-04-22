create database con;
use con;
drop table employees;
truncate table employees;
 
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,              -- PRIMARY KEY,notnull,unique
    email VARCHAR(100) UNIQUE,            -- UNIQUE,null allowed,unique
    name VARCHAR(50) NOT NULL,             -- NOT NULL
    age INT CHECK (age >= 18),             -- CHECK
    salary DECIMAL(10,2) DEFAULT 25000,    -- DEFAULT
    status ENUM('Active', 'Inactive')      -- ENUM (constraint-like)
);

select * from employees;
 show create table employees;



INSERT INTO Employees (emp_id,name, age, status)
VALUES (11, 'Amit', 25, 'inActive');   -- valid

-- Duplicate email (UNIQUE fails)
INSERT INTO Employees (email, name, age, status)VALUES
('a4@company.com', 'sahil jindal', 30, 30000, 'Active');

-- Age below 18 (CHECK fails)
INSERT INTO Employees VALUES
(3, 'b@company.com', 'Neha', 16, 20000, 'Active');

-- NULL name (NOT NULL fails)
INSERT INTO Employees VALUES
(4, 'c@company.com', NULL, 28, 28000, 'Inactive');



-- FOREIGN KEY

-- now lets create another table with fk reference
-- idea_course1
-- parent table

create table parent
(corname varchar(50) primary key);
insert into parent 
values ('data'),('engg'),('ai');



-- child table
create table child 
(stuid int primary key,name varchar(40),
corsename varchar(50),
FOREIGN KEY (corsename)
 REFERENCES parent(corname)
);  -- Prevents deletion if child rows exist.


insert into child values
(11,'renu','data'),
(12,'ritu','engg'),
(13,'sahil','ai');


 -- CASE 1   CHILD TABLE ERROR
 
 
 -- ADD A NEW STUDENT  IN NEW COURSE JAVA
insert into child values
(14,'sneha','java');  -- can not add new course in child  table 

insert into parent values ('java');

select * from parent;
select * from child;

-- ADDA NEW STUDENT IN OLD COURSE 
insert into child values
(15,'yuvaan','ai');  -- no issue


select * from child;
select * from parent;



-- CASE 2
-- DELETE A COURSE FROM OUR INSTITUTE "DATA"


-- Try deleting a parent row (will give foreign key error)
DELETE FROM parent
WHERE corname = 'data';  # renu emrolled in data course

UPDATE  parent
SET corname = 'data analyst'
where corname='data'; 


-- ADD ANEW COURSE IN INSTITUTE
insert into parent values ('java');


DELETE FROM parent
WHERE corname = 'data';  -- Since no student has java, it works

select * from child;
select * from parent;




