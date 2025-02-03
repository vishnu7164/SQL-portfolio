use sqlpractice;

CREATE TABLE hikeinfo (
empid int,
salarycomponent varchar(40), 
val int
);

Insert into hikeinfo values
(1, 'salary', 10000),
(1, 'bonus', 5000),
(1, 'hikepercent', 10),
(2, 'salary', 15000),
(2, 'bonus', 7000),
(2, 'hikepercent', 8),
(3, 'salary', 12000),
(3, 'bonus', 6000),
(3, 'hikepercent', 7);

Select empid, 
	   sum(Case When salarycomponent = 'salary' Then val END) as salary,
       sum(Case When salarycomponent = 'bonus' Then val END) as bonus,
       sum(Case When salarycomponent = 'hikepercent' Then val END) as hikepercent
From hikeinfo
group by empid;

-- An aggregation function is used to get the values avoiding repetition of employee id and null values in rows



