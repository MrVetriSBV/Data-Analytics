create	database	sbvco;
use	sbvco;
create	table	department
(
Dept_ID int not null,
Dept_Name varchar(50),
MGR_No	int,
Location varchar(20)
);

create	table	employee
(
Emp_ID int not null,
Emp_Name varchar(100),
Gender varchar(20),
Mob_Num	bigint,
City varchar(40),
Hiredate	date,
Salary	decimal(8,2),
Dept_Id int
);

alter	table	department
add	constraint	pk_Dept_ID	primary key(Dept_ID);

alter	table	employee
add	constraint	fk_balaji	foreign key(Dept_Id)	references	department(Dept_ID);

insert	into	department	values(100,"Accounting",20101,"Newyork"),(200,"Sales",20102,"Mexico"),(300,"Purchase",20103,"Germany"),(400,"Production",20104,"London"),(500,"Design",20105,"Italy"),(600,"Research and Development",20106,"Canada");

insert into	employee values(411,"Vetrivel","Male",8870657615,"Coimbatore","2025-06-03","500000.00",100),(412,"Balaj","Male",9677806505,"Erode","2024-12-12","400000.00",300),(413,"Dhinakaran","Male",6374072123,"Coimbatore","2024-12-03","150000.00",400);
insert into	employee values(414,"Keerthana","Female",8867234560,"Coimbatore","2023-05-09","700000.00",500),(415,"Saishree","Female",7790342897,"Coimbatore","2023-06-10","800000.00",600),(416,"Soundharya","Female",6435689102,"Chennai","2022-01-16","900000.00",400);
insert into	employee values(417,"Vikash","Male",8778484762,"Vellore","2024-07-01","400000.00",600),(418,"Vignesh","Male",9856456123,"Salem","2023-10-09","250000.00",300),(419,"Lathamani","Female",7896754538,"Erode","2022-12-07","300000.00",500);
insert into	employee values(420,"Praveen","Male",6789545630,"Erode","2022-10-10",780000.00,200),(421,"Rishikesh","Male",8891234560,"Erode","2024-04-17","200000.00",600),(422,"Ashwin","Male",8909853415,"Chennai","2022-11-06","550505.00",200);
insert into	employee values(423,"Ajay","Male",9976065068,"Vellore","2025-04-21","950000.00",400),(424,"Kural","Male",7698712345,"Chennai","2023-12-08","670005.00",300),(425,"Rajasekar","Male",9487721234,"Chennai","2025-03-28","180000.00",500);

select	*	from department;

select	*	from employee;

select	Emp_ID,
Emp_Name,
Gender,
Mob_Num,
City,
Hiredate,
Salary/30 Daily_Salary,
Salary Monthly_Salary,
Salary*12 Annual_Salary
from employee	order by Annual_Salary	asc;

select	substring("Vetrivel",2,5)	from employee;
select	Emp_Name from employee	where City in ("Coimbatore");
select	Emp_Name from employee	where City not in ("Coimbatore");

select *	from employee
where Emp_ID between 414 and 423;

select	* from employee
where Emp_ID not between 411 and 415;

select	*	from employee	where Emp_ID is null;
select	* from employee where Emp_ID is not null;

select	*	from employee
where	Emp_Name like "V%";

select	*	from employee
where Emp_Name	not like "V%";

select	max(Salary)
Emp_Name,City	from employee
group by	City
order by	max(Salary) desc;

select	count(Salary)
City	from employee
group by	City
having	count(Salary) > 1;

select	min(Salary)
City from employee
group by	City
having	min(Salary) > 1;

select	Salary,rank() over(order by	Salary desc)	from employee;

select	Salary,dense_rank() over(order by Salary desc) from employee;

select	Salary,percent_rank() over(order by Salary desc) from employee;

select	Salary,rank() over(order by	Salary asc)	from employee;

select	Salary,dense_rank() over(order by	Salary asc)	from employee;

select	Salary,percent_rank() over(order by	Salary asc)	from employee;

select	lead(Salary) over(order by	Salary desc)	from employee;

select	lead(Salary) over(order by	Salary asc)	from employee;

select	lag(Salary) over(order by	Salary asc)	from employee;

select	lag(Salary) over(order by	Salary desc)	from employee;

select	Salary,ntile(5) over(order by Salary asc)	from employee;

select	Salary,ntile(5) over(order by Salary desc)	from employee;

select	* from department;

select	*	from employee;
select	Emp_Name	from employee
where not exists(select	Emp_Name	from employee where Emp_Name = "Bala");

select	 count(Salary)
City from employee
group by	City
order by	count(Salary)	desc;

select	count(Salary)
City from employee
group by	City
having count(Salary) < 4;

SELECT Emp_Name
FROM employee
WHERE Emp_Name LIKE 'A%';

SELECT Emp_Name
FROM employee
WHERE Emp_Name LIKE '%h';

SELECT Emp_Name
FROM employee
WHERE Emp_Name LIKE '%Vi%';

SELECT Emp_Name
FROM employee
WHERE Emp_Name LIKE "V_____";

SELECT Emp_Name
FROM employee
WHERE Emp_Name LIKE '[VI]%';

SELECT count(Emp_ID)
City FROM employee
GROUP BY City
order by count(Emp_ID) desc;

select	count(Emp_ID)
City from employee
group by City
having count(Emp_ID) > 1;

SELECT department.Dept_ID, employee.Dept_Id
FROM department
INNER JOIN employee
ON department.Dept_ID = employee.Dept_Id;

SELECT employee.Emp_Name, department.Location
FROM employee
LEFT JOIN department
ON employee.Dept_ID = department.Dept_ID;

SELECT employee.Emp_Name, department.Dept_Name
FROM employee
RIGHT JOIN department
ON employee.Dept_Id = department.Dept_ID;

select	* from employee;
select	* from department;


update	employee	set	Hiredate = "2024-01-18" where Emp_Name = "Vikash";
select	* from employee;

select	Emp_ID
from department d	inner join	employee e
on	d.Dept_ID = e.Dept_Id
Where City = "Vellore";

select	*	from department;
select	* from employee;

alter	table	employee
add	column	Commission int;

insert	into employee values(426,"Ragul","Male","9342061694","Coimbatore","2022-07-09","678315.00",100,5000);

UPDATE employee
SET Salary = Salary + 1000
WHERE Dept_ID = 100;

COMMIT;

Delete	from employee
where Emp_ID = 426;

select	* from employee;

insert	into employee values(426,"Ragul","Male","9342061694","Coimbatore","2022-07-09","678315.00",100,5000);

DELETE FROM employee WHERE Emp_ID = 426;
ROLLBACK;

select	Emp_Name from employee
order by	Emp_Name	asc;

select	* from employee
order by	salary asc
limit 5;

select	max(Salary) from employee;

select	distinct	salary
from employee
where Salary is not null
order by	Salary desc
limit 3;

select	Emp_Name
from	employee e inner join department d
on e.Dept_Id = d.Dept_ID;

SELECT Emp_Name
FROM employee
WHERE Dept_ID = (
    SELECT Dept_ID
    FROM department
    WHERE Location = 'Chennai'
);

select	* from employee;

select	* from department;

SELECT Emp_ID
FROM employee
WHERE Dept_Id= (
    SELECT Dept_ID
    FROM department
    WHERE Location = "Newyork"
);

select	Emp_Name
from employee
where Dept_Id in (
select	Dept_ID 
from department 
where MGR_No in (20101,20102) 
);