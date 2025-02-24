SELECT * FROM interviewpractice.employee;

SELECT * FROM employee;
/*
id	name		dept	salary
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

SELECT id, concat_ws(':', name, dept) as info, salary
FROM employee;

/*
id	info			salary
1	Alexander:Admin	6500
2	Leo:Finance		7000
3	Robin:IT		2000
4	Ali:IT			4000
5	Maria:IT		6000
6	Alice:Admin		5000
7	Sebastian:HR	3000
8	Emma:Finance	4000
9	John:HR			4500
10	Kabir:IT		8000
*/

SELECT id, concat(name, '-', dept, ':', salary) as employee_details
FROM employee;

/*
id	employee_details
1	Alexander-Admin:6500
2	Leo-Finance:7000
3	Robin-IT:2000
4	Ali-IT:4000
5	Maria-IT:6000
6	Alice-Admin:5000
7	Sebastian-HR:3000
8	Emma-Finance:4000
9	John-HR:4500
10	Kabir-IT:8000

*/