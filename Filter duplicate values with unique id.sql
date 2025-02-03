use sqlpractice;

Show tables;

select* from employees;

-- Some duplicate values were added into the dataset

INSERT INTO employees VALUES
(9, 'Bob', 'Johnson', 1, 60000, '2018-03-22'),
(10,'David', 'Brown', 2, 80000, '2017-11-11'),
(11, 'Frank', 'Miller', 3, 55000, '2020-09-10'),
(12, 'Henry', 'Moore', 1, 65000, '2022-06-17'),
(13, 'David', 'Brown', 2, 80000, '2017-11-11');

-- (1). Identify list of duplicate entries

SELECT firstname, lastname, datehired
FROM employees
GROUP BY firstname, lastname, datehired
having count(*)>1;

-- (2). Self join helps to identify duplicate values in the table that can be deleted
SELECT e1.*
FROM employees e1
JOIN employees e2 on e1.firstname = e2.firstname and e1.lastname = e2.lastname
WHERE e1.employeeid < e2. employeeid;

-- My SQL is throwing an error 1093 saying it is incorrectly used table but working fine for Postgre SQL


-- (3). Duplicate by filtering id with max() function

select firstname, lastname, datehired, max(employeeid)
from employees
GROUP BY firstname, lastname, datehired;

-- There is a limitation for this query as it might not delete when there are more than two duplicate values
delete from employees
Where employeeid not in (
					select min(employeeid)
					from employees
					GROUP BY firstname, lastname, datehired);
        
-- My SQL is throwing an error 1093 saying it is incorrectly used table but working fine for Postgre SQL

-- (3). Duplicate by filtering id with min() function
delete from employees
Where employeeid not in (
					select min(employeeid)
					from employees
					GROUP BY firstname, lastname, datehired);
 
 -- My SQL is throwing an error 1093 saying it is incorrectly used table but working fine for Postgre SQL
 
 
 
					-- Solution to delete duplicate information in My SQL
 
 -- Only way for My SQL to delete data is to create new table and copy data from existing table to it 
 
CREATE table temptable like employees;
select * from temptable;

Insert into temptable
select * from employees;

delete from temptable
where employeeid not in (
					select min(employeeid)
					from employees
					GROUP BY firstname, lastname, datehired);

DROP table employees;

ALTER table temptable rename employees;
        
		


