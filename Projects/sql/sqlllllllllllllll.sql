show tables;
drop tables emp;
drop database abc;

create database mm;
use mm;
create table empl
(id int primary key,
name varchar(20),
age int, check (age<50)
);
show tables;
select *from mm.empl;
use mm;

insert into empl
(id,name,age) values
(1,"jim",24),
(2,"rim",25),
(3,"him",45);
select *from mm.empl;
drop database mm;

create database pp;
create table pp.emp
(
fname varchar(20),
mname varchar(20),
lname varchar(20),
age int,
salary int,
location varchar(20)
);
show tables;
use pp;
insert into emp
(fname,mname,lname,age,salary,location) values
("lim","limm","limmm",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
drop database pp;

create database pp;
create table pp.emp
(
fname varchar(20),
mname varchar(20),
lname varchar(20),
age int,
salary int,
location varchar(20)
);
show tables;
use pp;
insert into emp
(fname,mname,lname,age,salary,location) values


("lim","limm","limmm",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
create temporary table pp.rtl
(id int ,
name varchar(20));
select *from pp.rtl;


show tables;
select *from pp.emp;



insert into emp
(fname,mname,age,salary,location) values
("lim","limm","limmm",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
select *from pp.emp;

insert into emp
(fname,mname,age,salary,location) values
("lim",null,"limm",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
select *from pp.emp;

insert into emp
(fname,mname,age,salary,location) values
("lim",null,"lim\m",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
select *from pp.emp;


drop database pp;

create database pp;
create table pp.emp
(
fname varchar(20),
mname varchar(20),
lname varchar(20),
age int,
salary int,
location varchar(20),
primary key(fname,mname)
);
select *from pp.emp;


use pp;
insert into emp
(fname,mname,lname,age,salary,location) values
("lim","limm","limmm",23,10000,"erangal"),
("kim","kimm","kimmm",43,10900,"erangal");
drop database pp;

select *from pp.emp;
show tables;
desc emp;
desc pp.emp;
-----------------------------------------------
create database tt;
use tt;
create table emp
(
id int primary key,
fname varchar(20) not null,
mname varchar(20) ,
lname varchar(20)not null,
age int not null,
salary int not null,
location varchar(20) not null default ("bangalore")
);
drop database tt;

create database tt;
use tt;
create table emp
(
id int primary key,
fname varchar(20) not null,
mname varchar(20),
lname varchar(20)not null,
age int not null,
salary int not null,
location varchar(20) not null default ("bangalore")
);
show tables;
select *from tt.emp;
insert into tt.emp
(id,fname,mname,lname,age,salary,location) values
(1,"lim","limm","limmm",23,4500,default),
(2,"gim","gimm","gimmm",26,27600,"mangalore");
select *from tt.emp;
drop database tt;

create database tt;
use tt;
create table emp
(
id int primary key,
fname varchar(20) not null,
mname varchar(20) null,
lname varchar(20)not null,
age int not null,
salary int not null,
location varchar(20) not null default ("bangalore")
);
show tables;
select *from tt.emp;
insert into tt.emp
(id,fname,mname,lname,age,salary,location) values
(1,"lim",null,"limmm",23,4500,default),
(2,"gim","gimm","gimmm",26,27600,"mangalore");
show tables;
select *from tt.emp;

-- select is used to read data


select *from emp where age >20;
select *from emp where salary >200;
select *from emp where fname="lim";
select *from tt.emp where location="mangalore";
select *from tt.emp where id=2;
select *from tt.emp where mname="gimm";
-- use binary to match specific data
select *from tt.emp where age>20 and salary>200;
select *from tt.emp where  mname="limm" and age>20;
select *from emp where location="bangalore" and salary>100;
select fname,lname as surname from emp;
select fname as name from emp;
select *from tt.emp;


select *from emp;
update emp 
set lname="dimm" where fname="gim";
select *from emp;
update emp
set location="hyd" where fname="gim";
update emp
set location="dyh" where location="bangalore";
select *from emp;
update emp
set salary= 10000 where age=23;
update emp set location="dyh" where id=1;
update emp 
set location="lonbva";
update emp
set salary=10000 ;
update emp
set age=28;
update emp
set age=age+2;
select *from tt.emp;

update emp
set salary=salary+5000;
select *from tt.emp;

update emp 
set location="dyh" where  age>20 and salary>10000;
select *from tt.emp;
update emp
set location="lucknow" where location="dhy";
------------------------------------------------------------------------------------


------------ delete

select *from tt.emp;
delete from emp where id=2;

select *from tt.emp;
delete from emp where location="lucknow" and  id=1;
select *from tt.emp;
desc emp;
select *from tt.emp;
alter table emp
add column jobtitle varchar(20);
desc emp;
select *from tt.emp;
-- desc is used to desc table of the structure
-- select *from database is used to show whole data
alter table emp 
drop age;
alter table emp
modify column jobtitle varchar(30);

alter table emp
drop primary key;
select *from tt.emp;
desc emp;
alter table emp
add primary key(id);
alter table emp
add column age int;
alter table emp
add unique(salary);

alter table emp
add unique(salary);
desc emp;
truncate emp;
desc emp;
select *from tt.emp;

show databases;
----------------------------------------------------
-- 5 sesssion 
/*foreign isw key constraint is used to prevent actions taht would destroy links btw two tables*/
/* a foreign key is a field in ine table that refers to the primary key in another tabl selected*/
/*course is a foreign key in students table which refers to coursr_id (primary key) in courses table*/
/*table with the foreign key is called the child table*/
/*the table with foreign key is called parent or referenced table*/
-- foreign key

create database jj;
create table jj.student
(student_id int primary key auto_increment,
stu_fname varchar(20) not null,
stu_lname varchar(20) not null,
stu_mname varchar(20) not null,
stu_mail varchar(20) not null,
stu_phone int unique not null,
stu_alt_phone int,
enrollment_date timestamp not null,
years_of_joining int not null,
stu_com varchar(15),
batch_date varchar(30),
source_of_joining varchar(15),
location varchar(20) default "bangalore");

alter table jj.student
 remove column ("enrollment_date");
show tables;
select *from jj.student;
use jj;
select *from jj.student;
insert into student
(student_id,stu_fname,stu_lname,stu_mname,stu_mail,stu_phone,stu_alt_phone,enrollment_date,years_of_joining,stu_com,batch_date,source_of_joining,location) values
("dim","dimm","dmmm","ddd@mail.com",8765943234,07-08-2022,3,"locus","april","online","lucknow");
desc student;
select *from jj.student;

alter table jj.student
 remove ("enrollment_date");
drop database jj;

create database jj;
use jj;
create table jj.student
(student_id int primary key auto_increment,
stu_fname varchar(20) not null,
stu_lname varchar(20) not null,
stu_mname varchar(20) not null,
stu_mail varchar(20) not null,
stu_phone int unique not null,
years_of_joining int not null,
stu_com varchar(15),
batch_date varchar(30),
location varchar(20));
show tables;
desc student;



 -----------------------------------------------------------------------------------------------

create database bb;
use bb;
 
 create table emp
(
id int primary key,
fname varchar(20) not null,
mname varchar(20),
lname varchar(20)not null,
age int not null,
salary int not null,
location varchar(20) not null default ("bangalore")
);

show databases;

 drop database bb;
  drop database jj;
 drop database pp;
 drop database tt;


 create database ll;
 use ll;
 create table emp
 ( id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 show tables;
 desc emp;
 select *from ll.emp;
 use ll;
 insert into ll.emp
 (id,
 name,
gender,
 age,
 location) values
 (1,"rim","m",34,"banga"),
 (2,"lim","f",23,"mang");
 


CREATE DATABASE FF;
use ff;
create table emp
  ( id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 create database rt;
 use rt;
 create table emp
  ( id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 
 
 create database er;
 use er;
 create table  emp
 ( id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 create database dd;
 use dd;
 create table dd
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 create database qq;
 use qq;
 create table qq
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 create database ww;
 use ww;
 create table ww
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 
 create database dspro;
 use dspro;
 create table emp
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 create database zz;
 use zz;
 create table zz
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
create database ss;
use ss;
create table ss
(id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
  create database nn;
  use nn;
  create table nn
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 
 create database cc;
 use cc;
 create table cc
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 
 
 
 show databases;
 drop database dd;
 drop database rt;
 drop database qq;
 drop database ww;
 drop database zz;
 drop database ff;
 drop database cc;
 drop database ss;
 drop database ll;
 drop database er;
 drop database dspro;
 
  create database cc;
 use cc;
 create table cc
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 show tables;
 use cc;
 desc cc;
 select *from cc.cc;
use cc;
 insert into emp
 (id ,
gender,
 age,
 location) values
 (1,"m",23,"fsmdo");
 
 
 create database ss;
 use ss;
 create table emp
 (id int primary key,
 name varchar(20),
gender varchar(20),
 age varchar(20),
 location varchar(20) default "bangalore" );
 show tables;
 desc emp;
 select *from ss.emp;
 insert into emp
 (id,name,gender,age,location) values
 (1,"m",23,"fsmdo","ldfkjfd"),
 (2,"f",35,"limk","hdfh");
 select *from ss.emp;
 
 
 
 create database xx;
 use xx;
 create table stu
 (id int,
 age varchar(15),
 name varchar(15) 
 );
 
 show tables;
 desc stu;
 insert into stu
 (id,name,age) values
 (1,45,"eda"),
 (2,4,"fas");
 
 
 
  create database xo;
 use xo;
 create table stu
 (id int,
 age varchar(15),
 name varchar(15) 
 );
 
 insert into stu
 (id,name,age) values
 (1,45,"eda"),
 (2,4,"fas");
 
 
 
 create database ll;
 use ll;
 create table emp
(id int,
 name varchar(10),
gender varchar(15),
 age varchar(10),
 location varchar(20)
 );



 insert into emp
 (id,name,gender,age,location) values
 (1,"jdk",46,23,"mang");
 
 select name,age from ll.emp;
 
 
 select location from emp;
 
 select age from emp;
 select name,age from emp;
 select *from ll.emp;
 
 
 drop database xo;
  drop database xx;
drop database ll;

create database ll;
 use ll;
 create table emp
(id int,
 name varchar(10),
gender varchar(15),
 age varchar(10),
 location varchar(20)
 );



 insert into emp
 (id,name,gender,age,location) values
 (1,"jdk",46,23,"mang");
 
 select "name" as "dname","age" as "dage";
 select *from ll.emp;
 
 
 select age,name from ll.emp;
 
 drop database cc;
  drop database ll;
 drop database cc;
drop database hk;
drop database ss;
 
-----------------------------------------------------------------------
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

select age,location from ww.emp;
select age as age1 from ww.emp;
select age,location as locationage from ww.emp;




-- offset
-- print first five records
select *from world.country 
limit 5;
-- find tthe data of the country having highest population 

select *from world.country
order by population desc limit 1;

-- find data of the country having sec highest popualtion

select *from world.country
order by population desc limit 1,1;

-----------------------------------------------------------------

select *from world.country
order by population desc limit 3,1;
########### offset

----------------------------------------------------------
-- find the list of countries that where never ruled

-- (list of coutries that has indepyear null 

select *from world.country
where indepyear is null;


-- to count countries with not null
select  *from world.country
where indepyear is not  null;

select  count name from world.country;
 

-- window function helps us ranking/counting/summing  the data by partitioning it based on given condition

-- rank the countries based on population within each continent 

select continent,name,population,
rank() over(partition by continent order by population desc) as pppulation_rank
from world.country;

select continent,name,population,
rank() over(partition by continent order by population desc) as pppulation_rank,
dense_rank() over(partition by continent order by population desc)
as drank
from world.country;



select continent,name,population,
rank() over(partition by continent order by population desc) as pppulation_rank,
dense_rank() over(partition by continent order by population desc) as drank,
row_number() over(partition by continent order by population desc) 
as rownum
from world.country;
 
 
 
 create database vv;
 create table vv.emp_master
 (id int primary key,
 name varchar(20) not null,
 salary int,
 phone varchar(20));
 use vv;
 insert into emp_master
 (id,name,salary,phone) values
 (1,"lim",100,83479283994),
 (2,"kim",200,67528278789),
 (3,"min",300,7628791320);
 create table vv.emp_view
 (id int primary key,
 name varchar(20) not null,
 phone varchar(20));
 show tables;

select *from world.country
limit 10;

select *from world.country
order by population desc
limit 3,3;
select continent,name,population from 
world.country limit 5;

select continent from world.country;
select distinct population from world.country;

select count(distinct continent ) from world.country;
select max(distinct population) from world.country;

select count(*) from world.country;
 
 create database ff;
 create table ff.emp
 (id int primary key,
 name varchar(20),
 age int,
 dept varchar(20)
 );
 use ff;
 insert into emp
 (id,name,age,dept) values
 (1,'jim',23,"it"),
 (2,'kim',14,"hr"),
 (3,'hi,',45,'fin');
 
 -- select dept it from emp table 
 select *from ff.emp
 where dept='it';
 select *from emp
 having dept='it';
 
 /* where cluase and having clause*/
 
 /*filter data for asia contnent */
 select  *from world.country
 where continent="asia";
 /*show the data of countries that got independence in 1947*/
 select name from world.country
 where indepyear=1947;
 /*show the data of countries that got independence before 1900*/
 select name from world.country
 where indepyear<1900;
 /*show the data of countries that got independence after 1950*/
 select name from world.country
 where indepyear>1950;

-----------------------------------------------------------------------

use abc;
desc abc.emp;
select *from abc.emp;
set sql_safe_updates=0;
update emp
set name="rim";
  select *from abc.emp;            
              
    update emp
set name="rim" where id=null;
  select *from abc.emp;            
              
        update emp
set name="rin" where id=null;
  select *from abc.emp; 
  
  -- show country name starting with i
  select name from world.country
 where name like "i%";
  -- show alll the data wgere country name starting with united
   select  *from world.country
  where name like "united%";
  -- show all the data where country name ending with land 
  select  *from world.country
   where name like "%land";
 -- show all the data where country name not ending with land
  select *from world.country
  where name not like "%land"; 
  -- show all the data where country names conatains states
  select *from world.country
  where name like "%states%";
  -- show all the data where country name is starting with i and are 4 characters long
            select name from world.country
            where name like "i____%";
            
  -- show all the data awhrer country name is starting wih i and are 4 charaters long
  select *from world.country
  where name like "i____";
  select name from world.country
  where name like "i____";
              
              
select *from world.country
where name like "i___a";
use abc;
          

use ff;
alter table emp
add column gender varchar(20) after age;

update emp
set gender="male";

select *from ff.emp
where gender="male" and dept="it";


select *from ff.emp
where gender="male" and  dept="it" or dept="hr";


select *from world.country;

use world;
-- show all the data from asia continent and indepyear >1950
select * from world.country
where continent="asia" and indepyear>1950;
-- show all the data from asia continent with life expectancy between 72 and 75
select *from world.country
where continent="asia" and( lifeexpectancy>=72 and  lifeexpectancy<=75);
              
select *from world.country
where (continent="asia" or continent="europe") and (lifeexpectancy>=72 and lifeexpectancy<=75);


use ff;

select *from ff.emp;
select *from ff.emp
where age between 15 and 25;
select *from abc.emp;

 select *from abc.emp
 where gender in (f,m);

 select *from dspro.emp;
 select *from world.country
 where name in ("asia","europe");

-- show all the data from asia continent and life expectancy between 72 and 75
select *from world.country
where continent='asia' and (lifeexpectancy between 72 and 75);
-- show all the datafrom asia or europe continent and lifeexpectancy not between  72 and 75
select *from world.country
where continent in ('asia','europe') and 
(lifeexpectancy between 72 and 75);


-- show all the data from asia continent and life expectancy not between 72 and 75
select *from world.country
where continent='asia' and (lifeexpectancy not between 72 and 75);
-- show all the datafrom asia or europe continent and lifeexpectancy not between 72 and 75
select *from world.country
where continent in ('asia','europe') and 
(lifeexpectancy not between 72 and 75);



---------- not between not in not operators 
-- show all the data excluding asia and africa continent and life expectancy excluding 60 to 75 range 
select *from world.country
where continent in ('asia','africa') and (lifeexpectancy not between 60 and 75);
/*show all the data excluding asia and africa continent and life expectancy excluding 60 to 75 range and govt excluding republic
select *from world.country*/
use world;
select *from world.country
where continent not in ('asia','africa') and
 (lifeexpectancy not between 60 and 75) and 
not governmentform='republic';


-- show all the data where indepyear is null
select *from world.country
where indepyear is null;

-- show all the data where indepyear is  not null
select *from world.country
where indepyear is not null;


drop database dspro;
create database dspro;
create table emptable
(id int primary key,
name varchar(20),
age int,
gender varchar(20),
dept varchar(15)
);
use dspro;
insert into dspro.emptable  
(id,name,age,gender) values
(1,"jim",39,"f"),
(2,"lim",25,"m"),
(3,"vim",23,"f");
select *from dspro.emptable;
/*show id,name,dept such that whenever dept is null,
it should show hr in the dept column*/
select id,name
(case 
when dept is null then 'hr'
else dept
end) as dept
from abc.emptable;


select *from ff.emp;
use ff;

select id,name
(case 
when dept=hr then "mba"
else dept
end) as dept 
from emp;

create database qqq;

create table qqq.emp
(
id int primary key,
name varchar(20),
age int,
gender varchar(20),
dept varchar(15)
);

########################################################################
----------------------------------------------------------------------
-- show country name and popualtion arranged in desc order of population
select name,population from world.country
order by population desc;
/*show continent name population sort result set in ascending
 order by continent and desc order of population*/
select continent,name,population from world.country
order by continent,
population desc;
/*instead of using column names, you can also use the position of the columns from select statement */

-- instead of using column names you can also use the position of the coulmn from select stattememt

select continent,name,population from world.country
order by 1 asc, 3 desc;

------------------------------------------------------
/*show continent wise total population, 
sorted in ascending order by continent and descending order of population*/
select continent,sum(population) as population
from world.country
group by continent
order by population desc;
select *from world.country;
/* show contient wise,region wise total population,
sorted in scending order of continent and desc order of population*/
select continent,region,sum(population)as population from world.country
group by continent,region
order by continent,population desc;

/*above query can also be wriiten by giving the column position instead of column namw see 
the query below*/
select continent,region,sum(population)as population from world.country
group by 1,2
order by 1, 3 desc;


-- show continent,name,population,sort result set in ascending order of continent and des order of population

-- instead of using column names,you can also use the position of the columns from select statement
select distinct name from world.country;




select *from abc.emp;



select count(dept_no) from dept_emp;
select sum(salary) from employees;
select *from employees;
select sum(salary) from salaries
where from_date > '1997_01-01';

select max(salary) from employees;

select mix(salary) from employees;

select avg(salary) from salaries
where from_date > "1997-01-01";

select round(avg(salary)) from salaries
where from_date > "1997-01-01";

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


-- check the list of avail databases
show databases;
-- create a new database by name ddd
create database ddd;
-- check whether ddd database has been creaqted ornot 
show databases;
-- select ddd database
use ddd;
show tables;

-- list of tables in world databases
use world;
-- create emp table in ddd database
use ddd;
show tables;
create table ddd.emp
(
id int primary key,
name varchar(20),
age int check(age>20)
);
-- check whether the table has been created or not 
describe emp;
desc emp;

-- delete emp table
drop table emp;
show tables;
------------------------------------------------------------------------------

/* check the list of available databases*/
show databases;
/* if ddd database exists then drop it*/
drop database if exists ddd;
show databases;

-- create emp table in ddd database
create database ddd;
use ddd;
create table ddd.emp
(
id int primary key,
name varchar(15) not null
);
-- check whether the emp table has been created or not
use ddd;
show tables;
-- check table structure
describe emp;

-- add a new column age in emp table 
alter table ddd.emp
add age int after name;
desc ddd.emp;
-- add a new column gender in emp table
alter table ddd.emp
add gender varchar(10) after age;

-- check the table structure to confirm the addition of columns 
desc ddd.emp;   

-- drop a column from abc table
alter table ddd.emp
drop age;

-- check the table structure
desc emp;                                               # desc ddd.emp
---------------------------------------------------------------------------------
-- insert

-- drop emp table if already exists
drop table if exists ddd.emp;
-- create emp table in ddd database
create table ddd.emp
(
id int primary key,
name varchar(20)
);
-- use alter as i add age in blow row
alter table ddd.emp
add age int;
-- insert data into the emp table
insert into ddd.emp
(id,name,age) values
(1,"ilm",23),
(2,"pim",26),
(3,"lim",27);

-- show data from emp table
select *from ddd.emp;

---------------------------------------------------------------------
-- update
-- update the name of id 
update ddd.emp
set name="john" where id=1;

select *from ddd.emp;

-- update age column by adding 2 yearsin everyone age 
set sql_safe_updates=0;
update ddd.emp
set age=age+2;
select *from ddd.emp; 
show databases;
use ddd;
select database();
create table emp
(
id int primary key);
select *from emp;
drop table ddd.emp;
------------------------------------------------------------------
-- rename 
-- copy data from a table to xyz table
create table ddd.xyz
as 
select *from ddd.emp;

select *from ddd.xyz;

-- rename xyz table to employee
rename table ddd.xyz to ddd.employee;
select *from ddd.employee;
------------------------------------------------------------------------
-- drop delete truncate 
-- delete the record of empid 2 
delete from ddd.emp where id=2; -- (set sql_safe_updates=0;) us if any error
select *from ddd.emp;
-- delete all data from the table (leave the table )
truncate ddd.emp;
select *from ddd.emp;
-- drop table (delete the data and structure, both)
drop table ddd.emp;
select *from ddd.emp; -- table deleted so it show error
-----------------------------------------------------------------------------
select *from world.country;
use world;
select *from country;





























































































































































































































































































































































































































































































































































































































































































































































              
              