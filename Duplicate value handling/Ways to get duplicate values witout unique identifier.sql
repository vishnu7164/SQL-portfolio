SELECT * FROM sqlpractice.employeesalary;

-- Adding some duplicate values into the query to filter duplicate values and delete them
INSERT INTO employeesalary VALUES
(9,'Sharad', 'Pune', 23400),
(10,'Mohan', 'Karnataka', 126000),
(11, 'Mamatha', 'Kolkata', 12000),
(12, 'Rahul', 'Pune', 123400);

-- (1). give name of employee details that are duplicated in the table
SELECT employee_name, city 
FROM employeesalary
GROUP BY employee_name, city
having count(*)>1; 

-- (2). Filter duplicate values using row numer
SELECT *
FROM(
	SELECT employee_name, city, row_number() over(partition by employee_name, city) as rnk
	FROM employeesalary) temp
where rnk= 1; 

-- (3). Filter duplicate values using self join
-- Eventhough empid column is present it doesn't have unique values so a temptable is created with an additional column for ranking duplicate values

With temptable as (
SELECT employee_name, city, row_number() over(partition by employee_name, city) as rnk
	FROM employeesalary)
SELECT t2.* 
FROM temptable t1
JOIN temptable t2 on t1.employee_name = t2.employee_name and t1.city = t2.city
where t1.rnk < t2.rnk   


SELECT employee_name, min(rnk)
FROM(
	SELECT employee_name, city, row_number() over(partition by employee_name, city) as rnk
	FROM employeesalary) temp
where rnk > 1;

-- It is difficult to delete duplicate values in MySQL without unique identifier in the table unlike Postgre SQL where it has ctid method
-- to give unique id to each row







