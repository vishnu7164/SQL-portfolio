show tables;


CREATE TABLE departments(
departmentid int primary key,
departmentname varchar(20)
);

CREATE TABLE employees (
employeeid int primary key,
firstname varchar(20),
lastname varchar(20),
departmentid int,
salary bigint,
datehired date,
foreign key (departmentid) references departments (departmentid));

Insert into departments values
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales');

Insert into employees values
(1, 'Alice', 'Smith', 1, 50000, '2020-01-15'),
(2, 'Bob', 'JOhnson', 1, 60000, '2018-03-22'),
(3, 'Charlie', 'Williams', 2, 70000, '2019-07-30'),
(4, 'David', 'Brown', 2, 80000, '2017-11-11'),
(5, 'Eve', 'Davis', 3, 90000, '2021-02-15'),
(6, 'Frank', 'Miller', 3, 55000, '2020-09-10'),
(7, 'Grave', 'Wilson', 2, 75000, '2016-04-05'),
(8, 'Henry', 'Moore', 1, 65000, '2022-06-17');

update employees
set lastname = 'Johnson'
where lastname = 'JOhnson';

Select * from employees;

-- Find top 3 salaries per department
WITH 
employeetable AS (
SELECT e.employeeid, e.firstname, e.lastname, e.salary, e.datehired, d.departmentname
FROM employees e
JOIN departments d ON e.departmentid = d.departmentid),

rankedtable as (
SELECT *, DENSE_RANK() OVER(PARTITION BY departmentname ORDER BY salary DESC) as rnk
FROM employeetable)

SELECT firstname, lastname, departmentname, salary
FROM rankedtable
WHERE rnk<=3;

-- Find employees hired with average salary more than average salary of employees hired in last five years

WITH 
employeetable AS (
SELECT e.employeeid, e.firstname, e.lastname, e.salary, e.datehired, d.departmentname
FROM employees e
JOIN departments d ON e.departmentid = d.departmentid)

SELECT firstname, lastname, salary
FROM employeetable
WHERE salary >= (
				  SELECT avg(salary)
				  from employeetable);



