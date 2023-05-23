################# to find highest and lowest salary#######################################
drop database abhi;
create database abhi;
create table abhi.emp
(id int primary key,
name varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) 
);
use abhi;

insert into abhi.emp
 values
(1,"kim",23,20000,"lucknow"),
(2,"lim",24,10000,"surat"),
(3,"yim",28,18000,"orissia"),
(4,"pim",23,14000,"lucknow"),
(5,"uim",24,10000,"surat"),
(6,"aim",28,18000,"orissia");

-- name and ages of top 3 oldest student

select *from 
(select id,age,
dense_rank() over (order by age desc) as rnk
from abhi.emp)as t
where rnk<=3;

select *from 
(select id,age,
dense_rank() over (order by age desc) as rnk
from abhi.emp) as tt
where rnk<=2;

select *from abhi.emp
order by age desc
limit 3;
select *from 
(select id,age,
dense_rank() over (order by age desc) as rnk
from abhi.emp) as rr
where rnk<=3;
select id,age from abhi.emp
group by id
order by age desc
limit 3;
select id,age from abhi.emp where
(select max(age) from abhi.emp);


select max(salary) from abhi.emp;

select *from abhi.emp;
############################################# use distinct to aviod same salary values
select distinct(salary) from abhi.emp
order by salary desc 
limit 2,1;
select * from abhi.emp
where salary=(select max(salary) from abhi.emp);
############ to find 2nd lowest salary#############################
select distinct(salary) from abhi.emp
order by salary asc
limit 1,1;

########### using dense rank
select name,salary,
dense_rank() over (partition by name order by salary desc)
as salary_rank
from emp;
select *from (
select name,salary,
dense_rank() over(
order by salary desc)
as salary_rank
from emp)
as temp
where salary_rank=4;
#####################
-- using not in ,not = to find 2 highest salary
select max(salary) from abhi.emp
where salary not in (select max(salary)
from emp);
select *from abhi.emp;
--------------------------------------------------------

# quet 2
##############retreive all the infodata from emp whose name begins with "k"
select *from abhi.emp
where name like "k%";
#######################################################################
# quet 3
-- show salary of emp ranging between 
select *from abhi.emp
where not salary between 14000 and 20000;
-- can also use in operators
################################################
#quet 4
-- create new table with the help of existing table data and structure
use abhi;
create table emp2 as 
select *from abhi.emp;
select *from abhi.emp2;

########################################
#quet 5
-- delete mulitpe values using delete 
set sql_safe_updates=0;
delete from emp where 
salary>30000;
select *from abhi.emp;

#############practice note##########################
select max(salary) from abhi.emp
where salary<(select max( salary ) from abhi.emp);
select  distinct(salary) from abhi.emp
order by salary desc
limit 1,1;

########### find the number of employees working in dept abc#######################################
select count(*) from abc.emp 
having dept=abc;

/*select *from abc.emp
where name  like "_____a";*/

######################################3 to find duplicate values###################################
-- duplicate values in a table 
-- finding same age in table or duplicate age 
select  age from abhi.emp
group by age
having count(age)>1;
####### select column name from table and gropu by cloumn name and count>1####################

######################################################################################################
#######################################################################################################
##########################################################################################################
-- row number
drop database abhi;
create database abhi;
create table abhi.emp
(
fname varchar(20),
lname varchar(20),
age int,
salary int,
location varchar(20) 
);

insert into abhi.emp
 values
("kim","kimm",23,20000,"lucknow"),
("lim","limm",24,10000,"surat"),
("yim","yimm",28,18000,"orissia"),
("pim","pimm",23,14000,"lucknow"),
("uim","uimm",24,10000,"surat"),
("aim","aimm",28,18000,"orissia");

select *from abhi.emp;
select fname,lname,salary, 
row_number() over 
(order by salary desc)
from abhi.emp;

select fname,lname,salary,
row_number() over 
(order by salary desc)
from abhi.emp;

-- find the 5th highest salary

select *from (select fname,lname,salary,
row_number() over
(order by salary desc) as rownum 
from abhi.emp) temptable where rownum=4;

-- assign row number for partitiins based on each location
select fname,lname,salary,
row_number() over  (partition by location order by salary desc)
from emp;


select continent,name,population,
rank() over (partition by continent
order by population desc) as part
from world.country;



select continent,name,population,
rank() over (partition by continent
order by population desc) as partrow
from world.country;


select continent,name,population,
rank() over (partition by continent
order by population desc) as partrow
from world.country;

-------------------------------------------------------

-- where city name should not start with a,e,i,o,u and end with a,e,i,o,u
create database nac;
create table nac.city
(loca varchar(20));

insert into nac.city
values
("lucknow"),("pune"),("mumbai"),("assam"),("asa"),("ese");
select *from nac.city
where not loca like "%a" or "%e" or "%i" and "a%" or "e%" or "i%";


/*select 
where 
group 
having 
order*/
-- dont use count* and none is used to fill null 
select count(coalesce(fruit,none)) as total from fruits ;

 
-- find 3rd highest population
select continent,name,population 
from (select *,dense_rank() over (partition by population 
order by continent) as rnk from world.country) as ab
where rnk=3;
 

select *from world.country
order by population desc
limit 2,1;

#########################################
/*find the id and name from emp table,whose salary is 300 in comp table 
-- nested query*/

/*select id,name from abc.emp
where id=(select id from abc.comp where salary=300);*/





select id,name from abc,emp where
id=(select id from comp where salary=300;

-- 3 highest salary

ALTER TABLE sales.customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
    
    SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');
    
    
-- if null values then print dept name not provided
   /* select deptno
    ifnull(deptname,dept name not provided) as dept_name
    from dept_dup*/
    -- if null only one parameter
    
-- coalesce takes more then 2 parameters
    
    SELECT 
    dept_no,
    COALESCE(dept_name, 
            'Department name not provided') AS dept_name;
            
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC; 


SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
- LECTURE: Stored Procedures with an Output Parameter

DROP procedure IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
BEGIN
SELECT 
    AVG(s.salary)
INTO p_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

-- EXERCISE 1: Stored Procedures with an Output Parameter
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN

	SELECT 
		e.emp_no
	INTO p_emp_no FROM
		employees e
	WHERE
		e.first_name = p_first_name
			AND e.last_name = p_last_name;
END$$
DELIMITER ;


###########
-- LECTURE: Variables

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;

-- EXERCISE 1: Variables
set @v_emp_no = 0;
call emp_info('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;


###########
-- LECTURE: User-Defined Functions in MySQL

USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;


SELECT f_emp_avg_salary(11300);

-- EXERCISE 1: User-Defined Functions in MySQL
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
BEGIN
	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);

	SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;

	SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
            
	RETURN v_salary;
END$$
DELIMITER ;

SELECT emp_info('Aruna', 'Journel');


###########
-- LECTURE: Stored Routines - Conclusion

SET @v_emp_no = 11300; 

SELECT 
    emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM
    employees
WHERE
    emp_no = @v_emp_no;



##########################################################
##########################################################

-- SECTION: Advanced SQL Tools

##########################################################
########################################################## 


###########
-- LECTURE: Types of MySQL Variables - Local Variables

-- v_avg_salary
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no integer) RETURNS decimal(10,2)
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;

SELECT v_avg_salary;

-- v_avg_salary_2 (ERROR)
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no integer) RETURNS decimal(10,2)
BEGIN

DECLARE v_avg_salary decimal(10,2);

BEGIN
	DECLARE v_avg_salary_2 decimal(10,2);
END;


SELECT 
    AVG(s.salary)
INTO v_avg_salary_2 FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary_2;
END$$

DELIMITER ;


###########
-- LECTURE: Session Variables

set @s_var1 = 3;
select @s_var1;


###########
-- LECTURE: Global Variables

SET GLOBAL max_connections = 1000;
/*
SET @@global.max_connections = 1000;
*/

create view world.country1
as 
select name from world.country;
select *from world.country;
create view world.country121
as 
select code,name,region from world.country;

create view world.country00
as
select population from world.country;

select top 1 salary from (select distinct top 2 from emp
order by salary desc;
select max(salary) from emp.abc
where salary<(select max(salary) from abc.emp);









