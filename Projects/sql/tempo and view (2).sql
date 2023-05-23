
drop database kk;
drop database ll;
drop database pp;
drop database vv;
use sys;
show tables;
desc sys;
select *from sys;
create database abc;
create table abc.emp
(id int primary key,
name varchar(30),
salary int,
phone varchar(20));

insert into abc.emp
(id,name,salary,phone) values
(1,'lim',3478,293487587),
(2,'fhjd',738,89327934),
(3,'khdf',738,807458700);
select *from abc.emp;
create view abc.emp1
as 
select id,name from abc.emp;
select *from abc.emp1;

select *from abc.emp;

/*show data from emp table*/
select *from abc.emp;
/*create a view using emp table*/

/* print data from emp 1view */
select *from abc.emp1;
select *from abc.emp;

#############################joins#####################################
drop database if exists abc;
drop database abc;
################# union ######################################
create database abc;
create table abc.stu
(
id int primary key auto_increment,
name varchar(20));
insert into abc.stu
(name) values
('kim'),
('lim'),
('gim');

select *from abc.stu;
create table abc.new_stu
(
id int primary key auto_increment,
name varchar(20));
insert into abc.new_stu
(id,name) values
(1,"kim"),
(2,'lim'),
(11,'dim'),
(12,"aim");

select id,name 
from abc.stu
union
select id,name from abc.new_stu;

select id,name from abc.stu
union all 
select id,name from abc.new_stu;
drop database abc;
########################## joins###############################################
drop database abc;
create database abc;
create table abc.emp
(
id int primary key,
name varchar(20));

insert into abc.emp
(id,name) values
(1,'kim'),
(2,'lim'),
(3,'gim');

select *from abc.emp;
create table abc.compensation
(
id int,
salary int);

insert into abc.compensation
(id,salary) values
(2,2000),
(3,3000),
(4,4000),
(5,5000);

-- left join


-- inner join
select emp.id,emp.name,compensation.salary
from abc.emp inner join abc.compensation
on emp.id=compensation.id;

-- inner join
select emp.id,emp.name,compensation.salary
from abc.emp inner join abc.compensation
on emp.id=compensation.id;

select a.id,a.name,b.salary
from abc.emp a inner join abc.compensation b
on a.id=b.id;

select a.id,a.name,b.salary
from abc.emp as a inner join abc.compensation as b
on a.id=b.id;

drop database cc;
create database cc;
create table cc.emp
(id int not null primary key,
name varchar(20),
email varchar(30),
payment varchar(30));

create table cc.order
(id int ,
orderdescription varchar(30),
orderdate varchar(30),
price int,
foreign key(id) references cc.emp(id)
);

insert into cc.emp
(id,name,email,payment) values
(1,"cjvd","fhvhjbad",25678);

insert into cc.emp
(id,name,email,payment) values
(2,"cjvd","fhvhjbad",25678);

select * from cc.emp;


insert into  cc.order
values (1,"sghd",42-98-67,456);
select *from cc.emp;

insert into  cc.order
values (4,"sghd",42-98-67,456);
select *from cc.order;

create database dd;
create table dd.emp
(id int not null primary key,
name varchar(20),
email varchar(30),
payment varchar(30));

create table dd.order
(id int ,
orderdescription varchar(30),
orderdate varchar(30),
price int,
foreign key(id) references dd.emp(id)
);

############################################
-- session 5

-- foreign key constraint 

select *from world.country
limit 10;
use world;
desc world.country;

select distinct(continent) from world.country;

select count(distinct continent) from world.country;
select count(continent) from world.country;

select count(*)from world.country;

select *from world.country
where continent="asia";


select name from world.country
where indepyear<1900;

select *from world.country
where indepyear<1900;

select name from world.country
where indepyear=1947;

select *from world.country
where name like "i%";

select *from world.country
where name like "united%";

select *from world.country
where name like "%land";

select *from world.country
where name not like "%land";

select *from world.country
where name not like "%states%";


select *from world.country
where name like "i____";


select *from world.country
where name like "i___a";

select *from world.country
where continent="asia" and lifeexpectancy between 72 and 75;

select *from world.country
where continent in ("asia","europe")
 and lifeexpectancy between 72 and 75;


select *from world.country
where continent not in ("asia","africa")
and lifeexpectancy not between 60 and 75;



select *from world.country
where continent not in ("asia","africa")
and lifeexpectancy not between 60 and 75
and not GovernmentForm="republic";

select *from world.country
where indepyear is null;

select *from world.country
where indepyear is not null;

-- case statement
create database abc;
create table abc.emp
(
id int primary key,
name varchar(20),
age int,
gender varchar(20),
dept varchar(10)
);

insert into abc.emp
(id,name,age,gender,dept) values
(1,'jim',23,'m','it'),
(3,'him',25,'f','it'),
(6,"kim",34,"f","it");


insert into abc.emp
(id,name,age,gender) values
(2,"dim",25,"m"),
(4,"tim",28,"f"),
(5,"nim",27,"m");


drop database abc;

select *from abc.emp;

select id,name
( case		
when dept is null then "hr"
	else dept 
    end) as dept
    from abc.emp;

select name,population from world.country
order by 
population desc;


select continent,name,population from world.country
order by 
continent asc,
population desc;

select continent,name,population from world.country
order by 
1,2,
3 desc;

select continent,sum(population) as sumpop 
from world.country
group by continent
order by population desc;

select continent,name,population,
rank() over (partition by continent
order by population desc) as population_rank 
from world.country;
############################################
######################## sort by###############################
select *from world.country;
use world;
 select name,population from world.country
order by name desc,
population desc;

select name,population from world.country
order by 
population desc;

select  *from world.country
order by 
population desc;

select continent,name,population from world.country
order by continent asc,
population desc;
select continent,name,population from world.country
order by 1 asc,
2 desc;
drop database www;
create database www;
create table www.emp
(id int primary key auto_increment,
name varchar(20),
age int ,
gender varchar(20),
dept varchar(20));

insert into www.emp
values
(1,'jim',27,"m","it"),
(2,'kim',39,'f',null),
(3,'lim',23,'f','it'),
(4,'tara',35,'f',null),
(5,'vim',40,'m',null),
(6,'liz',28,'f','it');


-- find gender wise avg age summary

select gender,avg(age) as age 
from www.emp
group by gender 
order by age desc;
use world;
-- show continent wise total population,sorted in desc order of population
select continent,sum(population) as sumpopulation
from world.country 
group by continent
order by population desc;

select continent,region,sum( population) as sumpopulation
from world.country 
group by continent,region 
order by continent asc,
population desc;

select continent,region,sum(population) as sumpopulation
from world.country
group by 1,2
order by 1 asc,
3 desc;
##############################################
#################### having clause###################################

use world;
select continent,count(name) as count
from world.country
group by continent
having count<50;

select continent,count(name) as count
from world.country
group by continent
having count>50;


/*partition result set by continent and rank them in desc order of country population*/
select continent,name,population
Rank() OVER(partition by continent
order by population desc) as population_rank
from world.country;
select continent,name,population
rank() over(partition by continent
order by population desc as population_rank
from world.country;

select continent,name,population
rank() over(partition by continent
order by population desc as population_rank
from world.country;

select continent,name,population 
rank() over(partition by continent
order by population desc
from world.country;

drop database abb;
drop database abhi;
drop database abc;
desc salaries;
use employees;
select *from employees;
-- count of names 
select first_name,count(first_name) as names_count from employees
group by first_name
order by first_name ;
drop database employees;



create database ll;
drop database ll;
use ll;
create table stu
(id int primary key,
fname varchar(20) not null,
mname varchar(20) not null,
lname varchar(20) not null,
stu_phone varchar(20) unique,
years_exp int not null,
source_joining varchar(20),
location varchar(20)
);

insert into stu
(id,fname,mname,lname,stu_phone,years_exp,source_joining,location) values
(1,"lim","limm","limmm",9876543211,3,"naukri","lucknow"),
(2,"kim","kimm","kimmm",8765432199,8,"linki","mumbai"),
(3,"nim","nimm","nimmm",7654321897,5,"naukri","bang");
desc stu;
show tables;
select *from stu;
use ll;

create table courses(
course_id int not null,
course_name varchar(30) not null,
course_duration int not null,
course_fee int not null,
primary key(course_id)
);

insert into courses
(course_id,
course_name, 
course_duration,
course_fee) values
(1,"big data",5,"40000"),
(2,"web develop",3,18999),
(3,"data science",9,20000),
(4,"devops",1,10000);

drop table stu;
use ll;
create table stu
(id int primary key,
fname varchar(20) not null,
mname varchar(20) not null,
lname varchar(20) not null,
stu_phone varchar(20) unique,
selected_course int not null default 1,
years_exp int not null,
source_joining varchar(20),
location varchar(20),
foreign key(selected_course) references courses(course_id)
);

-- parent courses
-- child 
use ll;
insert into stu
(id,fname,mname,lname,stu_phone,selected_course,years_exp,source_joining,location) values
(1,"lim","limm","limmm",9876543211,2,3,"naukri","lucknow"),
(2,"kim","kimm","kimmm",8765432199,1,8,"linki","mumbai"),
(3,"nim","nimm","nimmm",7654321897,3,5,"naukri","bang");
select *from stu;
insert into stu
(id,fname,mname,lname,stu_phone,selected_course,years_exp,source_joining,location) values
(4,"lim","limm","limmm",9876543511,5,3,"naukri","lucknow");
select *from stu;








