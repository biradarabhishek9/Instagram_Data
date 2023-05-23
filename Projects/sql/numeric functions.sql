use world;
select count(name) from world.country;
select sum(population) from world.country;
select min(population) from world.country;
select count(name) as countofname,sum(population) as sumpopulation,
min(population) as minpop,max(population) as maxpop,avg(population) as avgpop
from world.country;

/*ceiling and floor function*/
select ceil(12.3);
select ceil(lifeexpectancy) as life from world.country;
-- it gives next integer

select floor(12.4);
-- it gives last integer
select floor(lifeexpectancy) as life from world.country;

/*round and truncate function*/
select round(12.357,1);
select name,round(lifeexpectncy,0) from world.country;
select truncate(12.357,2);

-- mod function to find the reminder
select mod(10,3);

-- power function
select power(3,4);
select pow(3,4);


-- find the greatest and least value from multiple columns
select greatest(10,2,34,56,76);
select greatest(population,lifeexpectancy,surfacearea) as bigger from world.country;
select least(23,2,65,78,5);
select least(10,2,24,16,16);
select least(population,lifeexpectancy,surfacearea) as bigger from world.country;
###########################################################################
#################### string function ################################

select concat(continent," :: ",name) AS continent_ctry
from world.country;

select continent,name, concat(continent,"_",name) 
from world.country;
select concat_ws("++ ",continent,name,governmentform) as combinedfields
 from world.country;
select *from world.country;
/* from n position,replace x characters with "***" */
select continent,insert(continent,2,3,"***")from world.country;
select continent,insert(continent,2,3,"***") from world.country;
/*search america in continent and return position*/
select continent,instr(continent,"america") as position from world.country;

create database rr;
/*create table called stu*/
create table rr.stu
(
id int primary key auto_increment,
name varchar(20)
);

/*insert data into stu table*/
insert into  rr.stu
(name) values
('jim'),
('kim'),
('lim');



create table rr.new_stu
(
id int primary key auto_increment,
name varchar(20)
);

/*insert data into stu table*/
insert into  rr.new_stu
(id,name) values
(1,'jim'),
(2,'kim'),
(11,'tom'),
(12,'john');


select *from rr.new_stu;
/*append new_stu data into output of stu*/
/*use union to append unique records*/

select *from rr.stu
union 
select *from rr.new_stu;

#############################
-- use union all to include duplicate value and union for unique values
select id,name from abc.emp;
select id from abc.compensation where salary=300;
##################################################
drop database www;

create database ll;
create table emp
(id int primary key auto_increment,
name varchar(20)
);
insert into emp
(name) values
('lim'),
('kim'),
('him'),
('sim');

create table emp1
(id int primary key auto_increment,
name varchar(20)
);
insert into emp1
(id,name) values
(1,'lim'),
(2,'kim'),
(11,'him'),
(12,'sim');


select id,name from ll.emp
union
select id,name from ll.emp1;

drop database ww;
create database ww; 
use ww;
create table emp
(id int primary key,
fname varchar(20) not null,
mname varchar(20),
lname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default "bangalore"
);
create database emp;
create table emp.salary
(id int ,fname varchar(67),lname varchar(234),age int ,salary int ,location varchar(230));
insert into emp.salary
 values
(1,"kim","kimm",23,20000,"lucknow"),
(2,"lim","limm",24,10000,"surat"),
(3,"yim","yim",28,18000,"orissia");
select *from salary;
use emp;
select salary,  from salary
order by salary desc
limit 1,1;
select id,salary,
row_number over  (order by salary desc) as 


desc emp;
select *from ww.emp;

select *from emp;

#########################################
####### to select specififc columns 

select fname,lname from emp;

##################
-- to find age greater then 20
-- where clause is used to filter condition
select *from emp where age >20;
select *from emp where location="lucknow";

select location from emp where location="orissa";
select *from emp where age >20;
select location,age,salary,mname from emp;

/*(id,fname,mname,lname,age,salary,location) values
(1,"kim","kimm","kimmm",23,20000,"lucknow"),
(2,"lim","limm","limmm",24,10000,"surat"),
(3,"yim","yim","yimmm",28,18000,"orissia");*/

select *from emp where lname="kimm";
select fname,mname from emp;

select *from emp where location="lucknow";

select id,fname,location from emp;
select *from emp;
select age,salary from emp;
select *from emp where location="surat";

select *from ww.emp where location="surat";
#########################################
#########################################
select age,fname from emp;
select *from emp where id=3;
#########################################
###########################################
-- USE SELECT *(ALL DATA)FROM EMP(TABLE NAME) WHERE AGE>20 (USED TO FILTER DATA) OR TO SHOW specific data
-- use select coulmn name (name,location) to show specific data or table
###############################################
##############################################
-- how to make case senstitive 
select *from emp where binary fname="kim";
-- the above statement will match the exact case ans is case sensitive
########################################
#############################################
select fname as name,lname as surname from emp;
select mname as mid,age as ageid from emp;
##############################################
###############################################
select location as loaco from emp;
select age as hase from emp;
select lname as last_name from emp;
select salary as fee from ww.emp;
select age from emp;
select *from emp where age >23;
############################################
########################################
drop database ww;
create database ww; 
use ww;
create table emp
(id int primary key,
fname varchar(20) not null,
mname varchar(20),
lname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default "bangalore"
);

insert into emp
(id,fname,mname,lname,age,salary,location) values
(1,"kim","kimm","kimmm",23,20000,"lucknow"),
(2,"lim","limm","limmm",24,10000,"surat"),
(3,"yim","yim","yimmm",28,18000,"orissia");
select *from emp;
set sql_safe_updates=0;
update emp 
set fname="fim" where fname="kim";
select *from emp;
update emp set location="ranchi" where fname="fim";


update emp
set location="ranchi" where location="surat";
select *from emp;
update emp set location="kanpur";

update emp 
set salary=salary+2000 where id=1;
######################################
########################################
update emp 
set location="usa" where fname="fim" and mname="kim";
#######################################
####################################
select *from emp;
-- update location on 2 clause ######################################
update emp 
set location="usa" where fname="fim" and mname="kimm";
select *from emp;

update emp 
set location="totor" where age>20 and location="kanpur";
select *from emp;
update emp
set age=25;
update emp 
set salary=10000 where age>20 and location="kanpur";
select *from emp;
update emp 
set salary=10000 where age>20 and location="totor";
select *from emp;
###########################################
#### delete 
select *from emp;
delete from emp 
where salary =24000;
delete from emp 
where id=1;
delete from emp;
select *from emp;
############################################################
-- alter is used to change in struture of the table ddl ,it is structure manipulation
--  update is to data manipualtion 
drop database ww;
create database ww; 
use ww;
create table emp
(id int primary key,
fname varchar(20) not null,
mname varchar(20),
lname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default "bangalore"
);

insert into emp
(id,fname,mname,lname,age,salary,location) values
(1,"kim","kimm","kimmm",23,20000,"lucknow"),
(2,"lim","limm","limmm",24,10000,"surat"),
(3,"yim","yim","yimmm",28,18000,"orissia");

alter table emp
add jobtitle varchar(20);
ALTER TABLE EMP
DROP JOBTITLE ;
alter table emp
add jobtitle varchar(20) after fname;
select 
*from emp;

alter table emp
add column gg varchar(17);

alter table emp
modify column gg varchar(25);
alter table emp
modify column gg varchar(25);

alter table emp
drop column gg;

desc emp;
show tables;
alter table emp
drop primary key;
show tables;
desc emp;
alter table emp
add primary key(id); 
/*ddl defination llang - deeals with table structure i,u,d - dml commamds 
and dml data manipulation - we deal with data directly*/ 
show  databases;
use kk;
truncate kk;
use ww;
truncate table emp;
truncate ww;
########################### truncate drops table not structure its ddl commands 






















