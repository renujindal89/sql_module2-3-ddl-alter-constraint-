
LOAD DATA does not create a table; it only inserts data into an existing one.

🔥 Quick Checklist
✅ Table exists
✅ Column count matches
✅ Datatypes correct
✅ File path correct
✅ local_infile = ON

use company;

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

CREATE TABLE sales10 (
    sale_date DATE,
    year INT,
    quarter VARCHAR(2),
    month_name VARCHAR(10)
);
 LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Date.csv'
INTO TABLE sales10
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@sale_date, year, quarter, month_name)
SET sale_date = STR_TO_DATE(@sale_date, '%d-%m-%Y');

select * from sales10;


