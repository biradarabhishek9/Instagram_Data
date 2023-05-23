-- collection of data and holds the data in form  a tables , DATABSE ISONE THAT STORES THE DATA ANMD INTERACTS WITH DATA
-- table holds the data in form of rows and columns 
--  why sql then excel fast and easy to look and manage 
-- database provides us the capability to access and manipulate this data
/* 2 type of database relational databse HAS COLUMN AND ROWS   ((have common cells to interactive btw themselves) and nosql or 
nrdbms dtabase HAS NO COLUMN AND ROWS( no relational column) key value ,document ,graph*/

-- rdbms mysql,oracle,sql server ,sqlite (sql is common lang, 99 same santanx sql)
-- nosql  hbase,mongodb,cassandra (own lang)
-- MYSQL IS A DATABSE AND SQL IS A WAY TO INTERACT WITH IT ***************** IMP
 -- structured query lang sql is where you will be interacting with databses
 -- sequel(sql) is way to interact with mysql databse
 -- mysql vs sql
 -- mysql  is realtional database 
 -- goormide use it to quicl sql query writing without installing sql
 
show databases;
CREATE DATABASE TRENDYTECH;
DROP DATABASE TRENDYTECH;
SHOW DATABASES;
CREATE DATABASE TRENDYTECH;
USE DDD;
USE TRENDYTECH;
-- TO KNOW WHICH DATABASE YOU ARE INN
SELECT DATABASE();
-- CRETAE TABLE EMPLOYEE
CREATE TABLE TRENDYTECH.EMPLOYEE
(
ID INT ,
NAME VARCHAR(10),
SALARY INT
);
-- TO SHOW TABLES 
SHOW TABLES;
-- TO DESC STRUCTURE 
DESC EMPLOYEE;
DROP TABLE EMPLOYEE;
SHOW TABLES;
DROP DATABASE TRENDYTECH;
SELECT DATABASE();
CREATE DATABASE TT;
SHOW DATABASES;
SELECT DATABASE();
SELECT DATABASE();

DROP DATABASE TT;
CREATE DATABASE TRENDYTECH;
CREATE TABLE TRENDYTECH.EMPLOYEE
(
ID INT ,
NAME VARCHAR(10),
SALARY INT
);

-------------------------------------------------------------------------
create database rrr;
use rrr;
create table emp
(
firstname varchar(20),
middlename varchar(20),
lastname varchar(20),
age int,
salary int
);
select *from rrr.emp; # show entire structure
show tables;
desc emp; 
drop database rrr;
create database rrr;
use rrr;
create table emp
(firstname varchar(20),
middlename varchar(20),
lastname varchar(20),
age int,
salary int
);
show tables;
select *from rrr.emp;
insert into rrr.emp
(firstname,middlename,lastname,age,salary) values
 ("gim","gimm","gimmm",34,10000),
 ("jim","jimm","jimmm",45,13000),
 ("lim","limm","limmm",26,17000),
 ("fim","fimm","fimmm",24,12000);
 select database(); # to see in which databse we are
 show tables;
 desc emp;
 desc rrr.emp;
 select *from emp;
 
 -- null is unknown
alter table rrr.emp
add location varchar(20) after salary;
select *from emp;
drop table emp;
----------------------------------------------------------------------------------------
-- session 4 

drop database trendytech;
drop database rrr;
drop database tt;
drop database ddd;
drop database abc;

create database ddd;
use ddd;
create table emp
(
id int primary key,
firstname varchar(20) not null,
middlename varchar(20),
lastname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) default ("bangalore")
);
show tables;
select *from ddd.emp;
 insert into ddd.emp
(id,firstname,middlename,lastname,age,salary) values
 (1,"pim","pimm","pimmm",23,10000),
 (2,"him",null,"himm",27,12000),
 (3,"kim","kimm","kimmm",28,18000);
 -- selecting all columns 
 select *FROM ddd.emp;
-- selecting specific columns 
use ddd;
select firstname,lastname from emp;
select *from emp where age >29;
-- select by applying a where clause(filter condition) 

select *from emp where firstname="pim";

-- by default it is case insensitive
select *from emp where binary firstname="Him";
-- USE binary to make it case sensitive

-- the above statement will match the exact case and is case sensitive

select firstname,lastname from emp;
select firstname as name,lastname as surname from emp;

-- alias

select *from emp;
set sql_safe_updates=0;
update emp 
set lastname="yim" where firstname="him";
select *from ddd.emp;

update emp 
set location="hyd" where firstname="him";
select *from ddd.emp;
update emp set location="hyd";

update emp
set salary=salary+5000;
select *from ddd.emp;
update emp
set location="bangalore" where firstname="pim" and lastname="pimmm";
select *from ddd.emp;
------------------------------------------------------------------------
-- delete
select *from emp;
delete from emp where id=3;
select *from emp;
delete from emp;

-- crud operations create read update delete
desc emp;

alter table emp
add column jobtitle varchar(50);
select *from emp;
alter table emp drop jobtitle;
select *from emp;
alter table emp 
modify column firstname varchar(30);

alter table emp
drop primary key;
select *from emp;

alter table emp
add primary key(id);

-- ddl vs dml
-- data defination lang deals w2ith table structure and  data manipualtion lang - here we deal with data directly

 -- cad create alter drop ddl commands
 -- iud insert update delete dml commands 
 
 select *from emp;
 use ddd;
select *from ddd.emp;

-------------------------------------------------------------------------------
-- foreign key constraint 
 create database tt;
 use tt;
 create table tt.emp
 (student_id int primary key auto_increment,
 student_fname varchar(20) not null,
 student_lname varchar(20) not null,
 student_mname varchar(20),
student_email varchar(30) not null,
student_phone varchar(20) not null unique,
student_alternate_phone varchar(20),
enrollment_date timestamp not null,
years_of_exp int not null,
student_company varchar(30),
batch_date varchar(30),
source_of_joining varchar(30),
location varchar(30));
desc emp;
select *from tt.emp;
show tables;
 use tt;
 set sql_safe_updates=0;
 update emp
 set student_company=0 where student_company is not null;
desc emp;
update emp
 set batch_date=0 where batch_date is not null;
update emp
 set source_of_joining=0 where source_of_joining is not null;
 desc emp;
use tt;
insert into emp
(student_id,student_fname,student_lname,student_mname,student_email,student_phone,
student_alternate_phone,
enrollment_date,
years_of_exp,
student_company ,
batch_date,
source_of_joining,
location) values
("fim","fimm","fimm@gmail","87698743568","3 years","koko","apr 5","online","lavos"),
("lim","limm","limm@gmail","87699743568","4 years","loko","feb 5","offline","oavos"),
("mim","mimm","mimm@gmail","87458743568","6years","koko","apr 5","online","lavos");

----------------------------------------------

select database();
show tables;
use tt;
select *from tt.emp;
 

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

















