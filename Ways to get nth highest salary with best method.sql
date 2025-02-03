-- Before starting practice I am creating a table based on sample data in the 'sqlpractice' data base
-- employee_info table can be created in any database but I am using sql practice

use sqlpractice;
create table employee_info 
(
id int,
name varchar(40),
email varchar(40),
department varchar (40),
salary bigint,
DOB date,
gender varchar(10),
bonus bigint
);

insert into employee_info values
(1,"Karan Mehta", "karan@gmail.com", "HR", 300000, '1998-05-10', 'M', 5000),
(2,"Rohit Sharma", "rohit@gmail.com", "Admin", 75000, '1997-01-25', 'M', NULL),
(3,"Ankush Rajput", "ankush@gmail.com", "Accounts", NULL, '1998-02-09', 'M', 1000),
(4,"Priyanshi Sharma", "priyanshi@gmail.com", "HR", 500000, '1998-06-15', 'F', 2500),
(5,"Sanket Gupta Mehta", "sanket@gmail.com", "Developer", 300000, '1997-05-07', 'M', 3000),
(6,"Shruti Kapoor", "shruti@gmail.com", "Admin", 80000, '1995-11-26', 'F', NULL),
(7,"Rohit Sharma", "rohit@gmail.com", "Admin", 75000, '1997-01-25', 'M', NULL),
(8,"Sanket Gupta", "sanket@gmail.com", "Developer", NULL, '1997-05-07', 'M', 1000),
(9,"Geet Gour", "geet@gmail.com", "Tester", 17000, '1998-07-03', 'F', 1500);



-- Inner query is used to select the second highest salary but it is not reliable to find nth highest value
select * from employee_info
where salary in (
select max(salary) from employee_info
where salary< (select max(salary) from employee_info)); 


-- (1). Highest salary using LIMIT clause
select * 
from employee_info
order by salary desc
limit 1;

-- (2). Nth highest salary is easy to find using limit clause
-- Limitation of this approach is if two people have same salaries it will fetch same salary of other person instead of fetching next highest salary

select distinct(salary) -- distinct can help in excluding the repetitive result
from employee_info
order by salary desc
-- limit n-1,1 gives the nth highest salary and perfect way to get nth highest salary
limit 2,1;


--  Following gives the correlated subquery implementation for finding nth highest
--  But in example I searched for 3rd highest salary
select * 
from employee_info s1
where 3 = (select count(distinct(s2. salary))
			from employee_info s2
			where s2.salary >= s1. salary); -- correlated subquery gives the result


-- To get all values I tried inserting above query in subquery however it doesn't work and my learning is included below
-- Following logic doesn't work in getting all details reason included below
select * 
from employee_salary
where salary in (select distinct(salary) 
				from employee_info
				order by salary desc 
				limit 2,1); -- My SQL doesn't support LIMIT/ IN/ ALL/ ANY key words in subquery
                 

-- (3). Dense rank
select name, salary
 from (select *, dense_rank() over(order by salary desc) as rnk
							from employee_info) as temp
where rnk = 3;

-- (4). Employees count by department

select department, count(name)
from employee_info
group by department;

-- (5). Employees with equal salary

select s1.name, s1.department, s1.salary 
from employee_info s1, employee_info s2
where s1.salary = s2.salary and s1.name <> s2.name;



