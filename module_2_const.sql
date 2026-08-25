create database empc;
use empc;

CREATE TABLE employee_const (
    emp_id INT PRIMARY KEY, -- 
    name VARCHAR(15) not null,   --  compulsory 
    email VARCHAR(30) UNIQUE  ,
    phone_number CHAR(10) UNIQUE,
    age INT CHECK (age BETWEEN 18 AND 60),
gender ENUM('Male', 'Female', 'Other')  DEFAULT 'Other', -- notdefined
    status VARCHAR(10) DEFAULT 'Active',  -- 'notmentioned'
    department VARCHAR(15) NOT NULL  -- compulsory 
);
 
-- desc keyword muje mere table ke sturcture ke bare mei btati hai 
-- it give the datatype of my columns
desc employee_const;

insert into employee_const (emp_id,name,age,gender,department)
values (1,'renu',37,'female','it');

insert into employee_const (emp_id,department,age,name)
values (2,'renu',37,'it');

insert into employee_const (emp_id,age,name,department)
values (3,37,'neha','it');

select * from employee_const;

-- ALTER CONSTRAINTS comment ignore 
-- modify  use krna
-- default,not null,auto_increment

-- 1.default change other ->not defined 
alter table employee_const
modify gender  varchar(10) default 'notdefined';

insert into employee_const (emp_id,age,name,department) values 
(4,34,'jatin','it');desc employee_const;

alter table employee_const
modify status  varchar(10) default 'notmention';


ALTER TABLE employee_const
ALTER COLUMN status SET DEFAULT 'notmention'; -- leave 

-- remove notnull cons

alter table employee_const
modify department varchar(20) null;

desc employee_const;

-- remove and add  primary key 
alter table employee_const
drop primary key;

alter table employee_const
add primary key (name);

alter table employee_const
add primary key (age);  -- error 

alter table employee_const
drop primary key;

desc  employee_const;

alter table employee_const
add primary key (emp_id);

select * from employee_const;

-- unique
alter table employee_const
add unique (name);

alter table employee_const
drop index email;

-- 
select * from employee_const;
insert into employee_const (name,email,phone_number,age,gender,status,department)
values ('neha3','renu@gmail.com',1234,34,'female','active','it');

alter table employee_const
modify emp_id int auto_increment; 
-- constraints finish

-- other imp concept  starts
-- change the table name
ALTER TABLE employee_const RENAME TO tuesday_work;

select * from tuesday_work;

-- change the database name
create database empc1;

 -- to copy the old database table to new database table 
rename table empc.tuesday_work
to empc1.tuesday_work;

use empc1;
drop database empc;

select * from tuesday_work;
CREATE TABLE new_table  AS
SELECT *
FROM tuesday_work;

select * from new_table;
select * from tuesday_work;




-- Copy data into an existing table  -- col must match
INSERT INTO new_table_name
SELECT *
FROM old_table_name;


-- second option

INSERT INTO new_table_name (emp_id, name, email)  
SELECT emp_id, name, email
FROM old_table_name;

-- third option 

CREATE TABLE company_database.employee AS
SELECT *
FROM company_db.employee;
-- ⚠️ Note: This copies the data and column structure,
--  but usually does not copy constraints such as PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, etc

-- or complete table structure with constraints + data
CREATE TABLE company_database.employee 
LIKE company_db.employee;

INSERT INTO company_database.employee
SELECT *
FROM company_db.employee;

