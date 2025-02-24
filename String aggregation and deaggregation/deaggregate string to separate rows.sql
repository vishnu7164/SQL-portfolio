select *, length(skill) as string_length, length(replace(skill, ",", "")) as skill_count
from skills_table;

-------- 
with cte as (
select *, length(skill) - length(replace(skill, ",", "")) + 1 as skill_count
from skills_table)

SELECT c1.*
FROM cte c1
JOIN cte c2 on c1.skill_count>= c2.skill_count
order by c1.name;

/*
name	skill						skill_count
Mandy	Javascript,Python,SQL		3
Mandy	Javascript,Python,SQL		3
Ram		SQL,Python,Tableau,Excel	4
Ram		SQL,Python,Tableau,Excel	4
Ram		SQL,Python,Tableau,Excel	4
Uma		Tableau,Excel,SQL			3
Uma		Tableau,Excel,SQL			3

*/


-------------------------------------------------


create table num (num int);

INSERT INTO num VALUES (1), (2), (3), (4);

with cte as (
select *, length(skill) - length(replace(skill, ",", "")) + 1 as skill_count
from skills_table)

SELECT name, skill, num
FROM cte
JOIN num n on cte.skill_count >= n.num
order by cte.name;

/*
name	skill						skill_count		num
Mandy	Javascript,Python,SQL		3				1
Mandy	Javascript,Python,SQL		3				2
Mandy	Javascript,Python,SQL		3				3
Ram		SQL,Python,Tableau,Excel	4				1
Ram		SQL,Python,Tableau,Excel	4				2
Ram		SQL,Python,Tableau,Excel	4				3
Ram		SQL,Python,Tableau,Excel	4				4
Uma		Tableau,Excel,SQL			3				1
Uma		Tableau,Excel,SQL			3				2
Uma		Tableau,Excel,SQL			3				3
*/

with cte as (
select *, length(skill) - length(replace(skill, ",", "")) + 1 as skill_count
from skills_table),

numbered as (
SELECT name, skill, num
FROM cte
JOIN num n on cte.skill_count >= n.num
order by cte.name)

SELECT *, substring_index(substring_index(skill, ",", num), ",", -1) as extracted_strings
FROM numbered

/*
name	skill						num		extracted_strings
---------------------------------------------------------------
Mandy	Javascript,Python,SQL		1		Javascript
Mandy	Javascript,Python,SQL		2		Python
Mandy	Javascript,Python,SQL		3		SQL
Ram		SQL,Python,Tableau,Excel	1		SQL
Ram		SQL,Python,Tableau,Excel	2		Python
Ram		SQL,Python,Tableau,Excel	3		Tableau
Ram		SQL,Python,Tableau,Excel	4		Excel
Uma		Tableau,Excel,SQL			1		Tableau
Uma		Tableau,Excel,SQL			2		Excel
Uma		Tableau,Excel,SQL			3		SQL

*/