
-- Line aggregation of strings

SELECT * 
FROM employee;

/*
id	name		dept	salary
-------------------------------
1	Alexander	Admin	6500
2	Leo			Finance	7000
3	Robin		IT		2000
4	Ali			IT		4000
5	Maria		IT		6000
6	Alice		Admin	5000
7	Sebastian	HR		3000
8	Emma		Finance	4000
9	John		HR		4500
10	Kabir		IT		8000
			
*/

SELECT dept, group_concat(name SEPARATOR ',') as employees
FROM employee
GROUP BY dept;

/*
dept	employees
----------------------
Admin	Alexander,Alice
Finance	Leo,Emma
HR		Sebastian,John
IT		Robin,Ali,Maria,Kabir
*/