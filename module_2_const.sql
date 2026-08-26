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

-- copy data from one table to another table
-- ⚠️ Note: This copies the data and column structure,
--  but usually does not copy constraints such as PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, etc
CREATE TABLE new_table  AS
SELECT *
FROM tuesday_work;

select * from new_table;
select * from tuesday_work;




-- Copy data into an existing table  -- col must match
INSERT INTO new_table
SELECT *
FROM tuesday_work;


-- second option copy only selected column

INSERT INTO new_table (emp_id, name, email)  
SELECT emp_id, name, email
FROM old_table_name;

-- third option 


-- or complete table structure with constraints + data
CREATE TABLE company_database.employee 
LIKE company_db.employee;

INSERT INTO company_database.employee
SELECT *
FROM company_db.employee;


-- 5. Change CHECK Constraint

desc employee_const;
SHOW CREATE TABLE employee_const;

ALTER TABLE employee_const
DROP CHECK chk_age;

ALTER TABLE employee_const
ADD CONSTRAINT chk_age2
CHECK (age between 18 and 40);


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
);

show create table Employees1;

create table parent_course(course_name varchar(10) primary key);
insert into parent_course values ('sql'),('python'),('bi');
select * from parent_course;
create table child_stu
(stuname varchar(20),course_name varchar(10) ,
foreign key (course_name) 
references parent_course(course_name));

desc child_stu;

desc employee_const;

insert into child_stu values ('vanshika','sql');
select * from child_stu;
select * from parent_course;
insert into child_stu values ('yuvraj','ai');
insert into child_stu values ('renu','java');
insert into child_stu values ('neha','bi');
insert into parent_course values ('java');

-- delete
delete from parent_course
where course_name='sql';

-- python delete
delete from parent_course
where course_name='python';

select * from parent_course;

-- updation in parent table
update parent_course
set course_name = 'bisiness'
where course_name='bi';

drop table child_stu;

create table child_stu (stuname varchar(10),course_name varchar(20),
foreign key (course_name) references parent_course(course_name)
on delete cascade
on update cascade);
insert into child_stu values ('yuvraj','bi');
insert into child_stu values ('renu','java');
insert into child_stu values ('neha','bi');
insert into child_stu values('vanshika','sql');




select * from parent_course;
select * from child_stu;


delete from parent_course
where course_name='sql';

update parent_course
set course_name = 'bisiness'
where course_name='bi';

drop table child_stu;

create table child_stu (stuname varchar(10),course_name varchar(20),
foreign key (course_name) references parent_course(course_name)
on delete set null
on update cascade);



insert into child_stu values ('yuvraj','bisiness');
insert into child_stu values ('renu','java');
insert into child_stu values ('neha','bisiness');

select * from child_stu;
select * from parent_course;

delete from parent_course
where course_name='java';

-- finished





