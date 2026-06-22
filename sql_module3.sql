create database update_3;
drop database update_3;

use update_3;
select now();
select * from date;  -- text
select * from date1; -- datetime
select * from date;
desc date;


-- DML (INSERT,UPDATE,DELETE,SELECT)
create database module_3;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(101, 'Amit', 'Sharma', 'IT', 75000.00, '2020-03-15'),
(102, 'Neha', 'Verma', 'HR', 62000.00, '2019-07-01'),
(103, 'Raj', 'Singh', 'Finance', 68000.00, '2021-01-10'),
(104, 'Priya', 'Mehta', 'Marketing', 71000.00, '2022-06-25'),
(105, 'Karan', 'Patel', 'IT', 80000.00, '2018-11-30');
 select * from Employees;
 
delete from employees where employeeid=105; 
truncate table employees;
desc employees;
insert into employees values (1,'renu','jindal','it',123456,'2024-08-23');
drop table employees;
 
 
 
 INSERT INTO Employees ( FirstName, LastName,EmployeeID, Department, Salary, HireDate)
VALUES
 ('Karan', 'Patel',107, 'IT', 80000.00, '2018-11-30');
 

UPDATE Employees
SET Salary = salary+Salary *0.1
WHERE department='it' and firstname='amit';


SET sql_safe_updates = 0;
select * from Employees;


DELETE FROM Employees
WHERE EmployeeID = 104;


select salary from Employees
where department='it';


SELECT FirstName, LastName, Department,salary
FROM Employees
WHERE Salary > 70000;





CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    CourseName VARCHAR(100),
    Semester VARCHAR(10),
    Grade CHAR(2)
);
INSERT INTO Enrollments VALUES
(401, 'Rahul Jain', 'Data Structures', 'Final', 'A'),
(402, 'Sneha Kapoor', 'Operating Systems', 'Final', 'B'),
(403, 'Aman Bhatia', 'Database Systems', 'second', 'A'),
(404, 'Isha Malhotra', 'Computer Networks', 'Second', 'C'),
(405, 'Nikhil Arora', 'Machine Learning', 'Final', NULL);
select * from Enrollments;
UPDATE Enrollments
SET Grade = 'A'
WHERE StudentName = 'Isha Malhotra' AND CourseName = 'Computer Networks';

select * from Enrollments;

UPDATE Orders
SET Status = 'Delivered'
WHERE OrderID = 1002;


-- CRUD OPERATION
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmployeeID, Name, Position, Salary)
VALUES 
(1, 'John Doe', 'Manager', 75000.00),
(2, 'Jane Smith', 'Developer', 60000.00),
(3, 'Sam Wilson', 'Designer', 55000.00);

-- Retrieve all employees
SELECT * FROM Employees;

-- Retrieve specific columns
SELECT Name, Position FROM Employees WHERE Salary > 55000;

-- Update salary for a specific employee
UPDATE Employees
SET Salary = 80000.00
WHERE EmployeeID = 1;

-- Update position for all employees earning less than 60000
UPDATE Employees
SET Position = 'Junior Designer'
WHERE Salary < 60000;

-- Delete a specific employee
DELETE FROM Employees
WHERE EmployeeID = 3;

-- Delete all employees with a salary below 60000
DELETE FROM Employees
WHERE Salary < 60000;







-- load infile
 LOAD DATA does not create a table; it only inserts data into an existing one.

🔥 Quick Checklist
✅ Table exists
✅ Column count matches
✅ Datatypes correct
✅ File path correct
✅ local_infile = ON

use company;

SET GLOBAL local_infile = 1; -- is used to enable the LOAD DATA LOCAL INFILE feature in MySQL.
SHOW VARIABLES LIKE 'local_infile';
drop table sale;
CREATE TABLE sale (
    sale_date varchar(10),
    year INT,
    quarter VARCHAR(2),
    month_name VARCHAR(10)
);
 LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Date.csv' -- csv,tab,txt
INTO TABLE sale
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from sale;

-- steps to follow Check in MySQL Workbench
Go to Database → Manage Connections.
Select your connection.
Click Advanced.
In the Others field, add:
OPT_LOCAL_INFILE=1
Save the connection.
Disconnect and reconnect.

CREATE TABLE sale2 (
    sale_date date,
    year INT,
    quarter VARCHAR(2),
    month_name VARCHAR(10)
);
LOAD DATA LOCAL INFILE 'E:/file/Date.csv'
INTO TABLE sale1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1; -- is used to enable the LOAD DATA LOCAL INFILE feature in MySQL.
SHOW GLOBAL VARIABLES LIKE 'local_infile';  -- to verify

SELECT @@local_infile;
select * from sale1;

Case 2: Date format is DD-MM-YYYY  --->yyyy-mm-dd

CSV:

id,name,sale_date
1,Renu,18-06-2026
2,Amit,19-06-2026

Use a user variable and STR_TO_DATE():

LOAD DATA LOCAL INFILE 'E:/file/Date.csv'
INTO TABLE sale2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@sale_date,year,quarter,month_name)  -- Read CSV columns  (@sale_date (temporary variable))
SET sale_date = STR_TO_DATE(@sale_date, '%d-%m-%Y'); -- Third CSV column (date_of_joining) → temporary variable @join_date
                                                      -- Then @join_date is converted and stored into table column join_date
   select *,year(sale_date),month(sale_date),monthname(sale_date) from sale2;  
   desc sale2;
   desc sale1;
   
   select * from sale1;
-- CASE 2

id,name,salary
1,Renu,50000
2,,60000
3,Amit,
4,NULL,70000
Table
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
1. Convert empty fields to NULL
LOAD DATA LOCAL INFILE 'E:/file/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(id, @name, @salary)
SET
    name = NULLIF(@name, ''),
    salary = NULLIF(@salary, '');
    
    -- OR
    LOAD DATA LOCAL INFILE 'E:/file/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(id, @name)
SET 
name = IF(@name = '', NULL, @name),
salary = IF(@salary = '', NULL, @salary);

-- CASE 3
Handle both empty string and "NULL"
SET name = IF(@name = '' OR @name = 'NULL', NULL, @name);