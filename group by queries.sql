create table students (
sname varchar(20),
sid varchar(20),
marks int);

drop table students;

select * from students;

insert into students 
values 
('A','Y',75),
('A','Z',80),
('B','X',90),
('B','Y',91),
('B','Z',75);

-- aggregated sum of marks of different groups
select sname, sum(marks)
from students
group by(sname);

-- Good query 1
--  counting individual categories and dispalying in a seperate columns
select sum(sname = 'A') as onegroup, sum(sname= 'B') as anothergroup
from students;

-- Good query 2
-- Query to fetch sum of top two marks scored by student
With cte as(
select *, row_number() over(partition by sname order by marks desc) as rnk
from students)

select sname, sum(marks)
from cte 
where rnk<=2
group by sname;
