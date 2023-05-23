-- Single line  comment
# Single line comment
/*
 single/multiple line comments
*/

-- Print the list of available database

show  databases;
-- get into sys database
use sys; /* to active database */
-- check avaliable tables
show tables;
-- create a new database
create database dspro;
-- print the list of databases
show databases;
-- get into dspro
use dspro;
-- create  a table in dspro db
create table dspro.emp
(id int ,
name varchar(10)
);
-- print list of tables from dspro
show tables;

-- print the table structure
desc dspro.emp;
describe dspro.emp;

-- insert data into emp table
insert	 into dspro.emp
(id,name) 
values
(1,"Jim"),
(2,"Ram"),
(3,"Sam"),
(4,"Kim"),
(5,"Lim");

-- Print data from emp table
select * from dspro.emp;

-- add age column in emp table
alter table dspro.emp	
add column age int; 

select * from dspro.emp	;

desc dspro.emp;

set sql_safe_updates = 0; -- disable safe update security;
-- Update age column
update dspro.emp
set age = 25;

update dspro.emp	
set age = 29 where id = 3;
-----------------------------------------------------------------------------------------------------------------------
-- drop dspro database
drop database dspro;

-- create dspro database again
create database dspro;
drop database dspro;
use dspro;

-- create stu table(id,name,gender,age)
create table dspro.stu(
id int,
name varchar(10),
gender varchar(10),
age int);

-- insert 10 records in stu table

insert into stu 
values( 1,"chanakya","M",24),
	  ( 2,"Ram","M",21),
      ( 3,"seetha","F",26),
      ( 4,"kim","M",28),
      ( 5,"Jim","M",23),
      ( 6,"Rim","M",27),
      ( 7,"Tim","M",31),
      ( 8,"Reema","F",28),
      ( 9,"Tina","F",33),
      ( 10,"Meena","F",19);
select concat ("han"," " ,"lam") as gajh from prok;
select * from stu;
-- add city column in stu
alter table stu add city varchar(20);
set sql_safe_updates=0;
desc stu;
-- update city column (1-5 "blr" and 6-10 "chn")
update stu set city = "blr" where id between 1 and	 5 ;
update stu set city = "chn" where  id between 6 and 10;
 select * from stu;
 update stu 
 set city="blr" where id between 1 and 5;
-- update age column by adding 1 to the age
update stu
set age=age+1;
update stu set age = age+1;
select * from stu;

-- create a copy of stu table as stu2
create table stu2 
as select * from stu;
select * from stu2;

-- delete gender column
alter table stu drop gender;
select * from stu;

-- delete the records of students from "blr"
delete  from stu where city = "blr";
select * from stu;

-- delete all the records from the table
delete from stu;
truncate stu;
select * from stu;
-- delete stu table
 drop table stu;

-- get data from stu2
select * from stu2;

-- rename stu2 as stu;
alter table stu2 rename stu;
rename table stu2 to stu;
drop table emp;
use dspro;

/* -----------------------------------day 3------------------------------ */

/* create table emp */
create table emp(
id int primary key,
name varchar(10) not null,
mobile_no int unique,
age int check(age > 20),
dept varchar(10) default "HQ"
);

/* describe table */
desc emp;

/* populate values into table */

insert into dspro.emp(id,name,mobile_no,age,dept)
values(1,"Jim",11,25,"IT"),
	  (2,"kim",12,22,"FIN"),
      (3,"Rim",13,33,"HR");

/* get the values from table */
select * from emp;


/* populate values into table */
insert into dspro.emp(id,name,mobile_no,age,dept)
values(4,"Lim",14,25,"MKT");

insert into dspro.emp(id,name,mobile_no,age)
values(5,"Tim",15,25);

/*  drop emp table */

drop table emp;

/* working on world database */
/* use world database */
use world;

/* select country from world */
select * from world.country;

/*view is a virtual table that refers to the main table,it is use to hide the information from unauthorized access */
/* create a view with only "asia" data from country table */
create view dspro.asia as 
select * from world.country
where continent = "asia";

create view dspro.id as 
select name from world.country;
/* select the table asia */
select * from dspro.asia;

/* temporary table is table/object is use to temporarily store the data it remains as long as the session is active and 
automatically gets deleted upon session termination */

create temporary table dspro.europe as
select * from world.country
where Continent = "europe";

/* select the temp table */

select * from dspro.europe;

/* ------------------------------- day 4 ---------------------------------- */

/* get the country table */

select * from world.country;

 /* print continent,country_name and population */
 
select continent,name,population
from world.country;

/* print frist 10 records */

select continent,name,population
from world.country
limit 10;

/* print the count of records */
select count(*)
from world.country;

/* print the count of unique records */
select distinct count(*) from  world.country;

/* print unique continent names */

select distinct continent
from world.country;


/* print the count of unique continents */

select count(distinct continent) 
from world.country;

/* sort the data by population */

select * 
from world.country
order by Population desc; -- for descending order

/* print continent(asc),country_name,population(desc) */
SELECT 
    continent, name, population
FROM
    world.country
ORDER BY Continent ASC , Population DESC;

SELECT 
    continent, name, population
FROM
    world.country
ORDER BY 1, 3 desc
limit 10 ;

/* filter data */
/* print only asia data */

select * 
from world.country
where Continent = "asia";

/* print asia and africa data */

select * 
from world.country
where Continent = "asia" and "africa"; -- it will give null buz there are no countries with has contient both asia and africa

select * 
from world.country
where Continent = "asia" or Continent =  "africa";

SELECT * FROM 
    world.country
WHERE
    Continent IN ('asia' , 'africa');
    
 /* exclude asia and africa data */
 
 SELECT 
    *
FROM
    world.country
WHERE
    Continent NOT IN ('asia' , 'africa');
    
    SELECT *FROM WORLD.COUNTRY
    WHERE CONTINENT NOT IN ("ASIA","AFRICA");

/* exclude asia data */

select * 
from world.country
where not Continent = 'asia';

select * 
from world.country
where Continent != 'asia';

SELECT 
    *
FROM
    world.country
WHERE
    Continent <> 'asia';
    
    /* my strenths include the fact i am a very fast learner, i am enthusiastic and hungry
    to learn, and i am good in dealing with people */
	/* i am good in dealing with people like i socialise with people, and work together with the people */
    
    /* one of strenghts is attentive listening which helps in understanding the stakeholders  problem 
	and providing the relevant solution.
	*/
    
    /* undoubtedly,my weakness is the fact i am a work in progress. But my hunger to learn 
    will help me to learn new things faster */
    
/* although my weakness is that i am still working on learning new skills, my eagerness to 
learn new skills will allow me to do so at a faster pace */



/* -------------------------------------- day 5 ------------------------------ */


/* print data from asia,europe,africa where population > 20 cr. life_expetency b/w 70 and 80 , indep_year >1900 */
select *from world.country
where continent in ("asia","europe","africa")
and population >2000000
and lifeexpectancy BETWEEN  70 AND 80
and indepyear >1900;

SELECT 
    *
FROM
    world.country
WHERE
    continent IN ('asia' , 'europe', 'africa')
        AND population > 2000000
        AND lifeexpectancy BETWEEN 70 AND 80
        AND indepyear > 1900; 
                
 /* print data by excluding countries having indepyear from 1900 to 1950 */
 
 select *
 from	 world.country
 where IndepYear not between 1900 and 1950;
 
 /* print data by excluding antatica and south america with indepyear either before 1900 or after 1950,
 having lifeexpetancy in betweeen 50 to 80 
 and governmentform is republic ,federal republic,islamic emirate
 and population is not zero*/
 select *from world.country 
 where not continent in ("Antarctica","south america") and 
 indepyear not between 1900 and 1950
 and lifeexpectancy between 50 and 80
 and governmentform="republic" and population >0;
 
 SELECT 
    *
FROM
    world.country
WHERE
    Continent NOT IN ('antarctica' , 'south america')
        AND IndepYear NOT BETWEEN 1900 AND 1950
        AND LifeExpectancy BETWEEN 50 AND 80
        AND GovernmentForm IN ('republic' , 'federal republic', 'islamic emirate')
        AND population != 0;
        
        
/* wildcard characters 
% -> any character and any number of character
_ -> single character
wildcards doesn't support '=' operaters
*/
/*   country name start with 'I' */

select *
from world.country
where name like 'i%';

/*   country name ends with 'I' */
select Name
from world.country
where name like '%i';

/*   country name contains with 'I' */     

 select name
 from world.country
 where name like '%i%';
 
 /* country name start with 'I' has 'l' in the middle and ends with 'd' */   

 select name
 from world.country
 where name like 'i%l%d';
 
  /* country name start with 'I' has exactly 4 character */   

 select name
 from world.country
 where name like 'i___';
 
   /* country name start with 'I' has  4th char is 'o' end with 'a' */   
 select *from world.country
 where name like "i_o%a";
 select name 
 from world.country
 where name like 'i__o%a';
 select *from world.country;
 /* print continent, name, surfacearea, population, area_per_person */

 select *from world.country;
 SELECT 
    continent,
    name,
    surfacearea,
    population,
    ROUND((surfacearea / population), 2) AS area_per_person
FROM
    world.country;
 
 /* print continent, name, surfacearea, population, area_per_person and where the  */
 
 SELECT 
    continent,
    name,
    surfacearea,
    population,
    if (round( surfacearea / population=0,2),999,surfacearea / population) as area_per_person
FROM
    world.country;
    
/* where the indepyear is null print 2022 */

 SELECT 
    continent,
    name,
    surfacearea,
    population, 
    if (indepyear is null,2022,indepyear) as iyear
FROM
    world.country;
    
    select Continent,name,surfacearea,population,
    if(indepyear is null,2022,indepyear) as iyear
    from world.country;

/* create geo column */

select distinct continent
from world.country;

select continent,name,
(case when continent in ('africa','europe') then 'emea'
      when Continent in ('north america', 'south america') then 'ams'
      when continent in ('asia') then 'apac'
else 'row'
end  ) as geo,
population,
(case when	Population > 100000000   then 'high'
	  when population > 1000000    then 'medium'
      else 'low'
      end
      ) as population_type
from world.country;

/* ------------------- day 6 ---------------------------------- */

/* grouping and aggregation 
aggregate function are sum(),count(),min(),max(),avg()
*/

/* find continet wise total population */

SELECT 
    continent, SUM(population) AS Total_population
FROM
    world.country
GROUP BY continent
ORDER BY total_population desc;

SELECT 
    continent, SUM(population) AS Total_population
FROM
    world.country
GROUP BY 1
ORDER BY 2 desc;

/* print continent wise total population and exclude the data if a continent has zero and negative population */

SELECT 
    continent, SUM(population) AS Total_population
FROM
    world.country
GROUP BY 1
HAVING total_population > 0
ORDER BY 2 DESC;

/* print continent wise summary to show total population.
remove the continent if population is <= zero
remove the continent if the continent contains americas  (if the question contains the we need to use '%america%')
*/


select continent,sum(population) as total_population
from world.country
where not continent like '%america%'
group by 1
having total_population > 0
order by 2 desc
limit 3;

/* print continent wise region wise total population,avg() population,count of countries,min() population, max()  population 
*/

select continent,region,sum(population) total_population,avg(population) avg_population,count(name) countries_count,min(population) min_population,max(population) max_population
from world.country
group by Continent,region
order by 1,2;

/*  */

create table dspro.emp(id int,product varchar(30), margin varchar(20));

insert into dspro.emp
values(1,'milk','20%'),
	  (2,'bread','22%'),
      (3,'biscuit','200%'),
      (4,'chocolate','30%'),
      (5,'basen','2%');
     
 truncate dspro.emp;    
      
 select * from dspro.emp
 where margin like'2_' ;
 
/* ------------------------ day 7 ----------------------------- */

/* Offset */

/* print first 5 records */

select * 
from world.country
limit 5;

/* find the data of country having highest population */

select * 
from world.country
order by population desc
limit 1;

/* find the data of country having second highest population */

select * 
from world.country
order by population desc
limit 1,1; -- limit (n-1), n   limit (position),(no of rows)

/* find the data of country with 4th highest population */
#############################################################################################################################################################
select *
from world.country
order by population desc
limit 3,1;


/* null keyword to filter */
/* find the list of countries that were never ruled */
########################################################################33
select * 
from world.country
where IndepYear is null	;


/* count of countries who's indepyear is null */

select *,count(*)
from world.country
where IndepYear is null;
#########################################################################################
/* count of countries who's indepyear is available */
SELECT 
    COUNT(*)
FROM
    world.country
WHERE
    IndepYear IS NOT NULL;

/* find the unique records in the table */
select distinct *
from world.country;

select *,count(*)
from world.country
group by  name
having count(*) = 1;



##################################################################################################################3
/* find the records having duplicate entries */
select *,count(*)
from world.country
group by name
having count(*) > 1;


/* windows funtions - it helps us ranking the data by partitioning it based on given condition 
/* rank the countries based on population within each contitnent */

select 
continent,
name,
population,
rank() over(partition by continent order by population desc) as population_rank,
dense_rank() over(partition by Continent order by Population desc) as d_rank,
row_number() over(partition by Continent order by Population desc) as row_no
from world.country;

/* ------------- day 8 ----------- */

/* create emp and fin table in dspro */

create table dspro.emp(id int primary key,name varchar(20));

drop table dspro.emp;
insert into dspro.emp
values(1,'Jim'),
	  (2,'Kim'),
      (3,'Lim');
      
select * from dspro.emp;

create table dspro.fin(id int,salary int);

insert into dspro.fin
values(2,200),
	  (3,300),
      (4,400);
 
select * from dspro.fin;


/* Left join */

 use dspro;
 
SELECT 
    emp.*, fin.salary
FROM
    dspro.emp
        LEFT JOIN
    dspro.fin ON emp.id = fin.id;
    
    
 select a.id,a.name,b.salary
 from dspro.emp a
 left join dspro.fin b on a.id = b.id;
 
 /* right join */
 
 select b.id,a.name,b.salary
 from dspro.emp a
 right join dspro.fin b on a.id = b.id;
 
 /* inner join */
 
 select a.*,b.salary
 from dspro.emp a
 inner join dspro.fin b on a.id = b.id ;
 
 
/* full outer join */

select a.*,b.salary
from dspro.emp a
left join dspro.fin b on a.id = b.id

 
 union  
 
 select b.id,a.name,b.salary
 from dspro.emp a
 right join dspro.fin b on a.id = b.id;
 
 
 /* ------------ day 9 ------------ */
 
 /*  create table team */
 
 create table dspro.team(id int,dept varchar(20));
 
 insert into dspro.team
 values(1,'IT'),
	   (2,'Fin'),
       (3,'HR'),
	   (4,'OPS'),
       (5,'IT');
 
 select * from dspro.team;

 /* cross join */
 
 select * 
 from dspro.emp 
 cross join dspro.fin ;
 
/* combine data from more than 2 table */

create table dd1 
select a.id,a.name,b.salary,c.dept
from dspro.emp a
left join dspro.fin b on  a.id = b.id
left join dspro.team c on a.id = c.id ; 
 
 /* create a table project */
 
 create table dspro.project( id int,name varchar(20),mgr_id int);
 
 insert into dspro.project 
 values(1,'Jim',5),
	   (2,'Kim',5),
       (3,'Lim',5),
       (4,'Tim',5),
       (5,'Ram',9),
       (6,'ken',9),
       (7,'Tom',9),
       (8,'Rim',9),
       (9,'Sam',10);
       
 select * from dspro.project ;
 
 /* print manager wise team name */
 
select a.name as manager,b.name as team
from dspro.project a
inner join dspro.project b on a.id = b.mgr_id ;

 /* nested query */
 #####################################################################################################################3
 /*  find the country with highest population */
 
 select * 
 from world.country
 where population = (select max(population) from world.country);
 select *from world.country where population in(select max(population)from world.country);
 select *
 from world.country
 where population = (select max(population) from world.country where continent = 'Africa');
 
  /*  find the country greater than avg population where country starts with "a" */
  
select *
 from world.country
 where population > (select avg(population) from world.country where name like 'a%' ) ;
 
  /*  find the country with highest population */
 
 from world.country
 where population > (select avg(population) from world.country ) and name like 'a%' ;

 select avg(population) from world.country where name like 'a%';
 select round(avg(population)) from world.country ;
 
 
 
 select * from dspro.project ;
 select * from dspro.team;
 
 /* from project table print the data of employees whose dept is "IT" */ 
 
 select *
 from dspro.project
 where id in (select id from dspro.team where dept = "IT");
 
 
 /* Why should we hire You */
 
 /* I have the skills you are looking for  and i'm really passionate about the industry and problem solving 
 this type of work really excites me */ 
 

-- find the middle row in the record
 select *
 from swiggy.swiggy_data;
 
 select * from
 (select *,row_number() over() as rn
 from swiggy.swiggy_data) a
 having a.rn = round(max(a.rn)/2);
 

 select *,round(max(rn)/2)  mx from 
 (select *,row_number() over() as rn
 from swiggy.swiggy_data) a
limit mx,1;	
 
 select *,row_number() over() as rn
 from swiggy.swiggy_data
 limit round((max(rn)/2)),1;
 
 select * from
 (select *,count(*) as cnt,row_number() over() rn
 from swiggy.swiggy_data)a
 where  rn = round((max(cnt)/2));
 
 
 -- what keep you motivated
 
 
 -- top 10 country by population

select *
from world.country
order by population desc
limit 10;
########################################################################################
select * from
(select *,row_number() over(order by population desc) as rn
from world.country)a 
where a.rn <=10;


select *from (select *,row_number() over (order by population desc)  pop
from world.country) a where a.pop=5;

select *from(select *,
row_number() over (order by population desc) rn
from world.country)a  where a.rn=3;
select *from world.country
order by population desc
limit 9,1;
select *
 from world.country
 where population > (select avg(population) from world.country where name like 'a%' ) ;
 
 select *
 from dspro.project
 where id in (select id from dspro.team where dept = "IT");
 
 select * 
 from world.country
 where population = (select max(population) from world.country);

create view abc.emp1
as 
select id,name from abc.emp;


