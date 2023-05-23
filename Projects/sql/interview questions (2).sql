use interview_questions;

/* create table teams */
create database country;
use country;
create table teams(country varchar(30));

/* insert the values */

insert into teams
values('India'),
	  ('Sri Lanka'),
      ('Bangladesh'),
      ('Pakistan'),
      ('Afghanistan');
      
      select * from teams;
      
      
/* write a sql query to generate fixtures for Asia Cup */

with cte as ( select country,
(case when country = 'India' then 1
      when country = 'Sri Lanka' then 2
      when country = 'Bangladesh' then 3
      when country = 'Pakistan' then 4
      else 5 
      end ) as id
      from teams)
  select t1.country team1,t2.country team2
  from cte t1,cte t2
  where t1.country != t2.country and t1.id < t2.id
  order by t1.id ;
-----------------------------------------------------------------
  
/* create table amazon */
create database amazon;
create table amazon(txnmonth varchar(50),dept varchar(50),txnamount int);

/* insert the values into amazon table */

insert into amazon values('Jan','Grocery',100);
insert into amazon values('Feb','Grocery',300);
insert into amazon values('Mar','Grocery',200);
insert into amazon values('Jan','Clothes',700);
insert into amazon values('Feb','Clothes',500);
insert into amazon values('Mar','Clothes',200);

/* print the table */

select * from amazon;

/* ouput : 

dept	txnmonth	txnamount
clothes		feb		500
clothes		jan		700
clothes		mar		200
clothes		Total_txnamount clothes		500
grocery		feb		300	
grocery		jan		100	
grocery		mar		200	
grocery		Total_txnamount	grocery		600	
-           Total_txnamount      2000

*/ 

/* solution */

select dept,(case when txnmonth is null and dept = 'clothes' then 'Total_txnamount clothes'
			      when txnmonth is null and dept = 'grocery' then 'Total_txnamount grocery'
                  when txnmonth is null and dept is null then 'Total_txnamount'
                  else txnmonth end)
                  ,sum(txnmonth)
from amazon a
group by rollup (dept,txnmonth)
order by dept;

----------------------------------------------------------------------------------------
/* create table duplicates */
create database db;
Create table duplicates(empid int, employeename varchar(20),Gender varchar(5));

/* insert values into table */

insert into duplicates values(1,'Bilal','M');
insert into duplicates values(1,'Bilal','M');
insert into duplicates values(2,'Suresh','M');



/*   Write an SQL query to delete duplicate records from the below table without using any window functions or cte expression.
*/

delete from duplicates a
where a.rowid not in ( select min(b.rowid) from duplicates b where a.empid = b.empid);


delete from duplicates 
where rowid not in (select min(rowid) from duplicates group by employeename);
-----------------------------------------------------------------------

/* create table student */
create table student(studid int,studname varchar(50),semester int, marks int);

/* insert values into student */

insert into student values(1,'A',1,120);
insert into student values(2,'B',1,140);
insert into student values(3,'C',1,160);

/* what will be the output of the below query */

update student 
set marks in (select marks from student where studid = 1)
where studid = 2;


/* "in" operators won't work with update and set */


/* create table monthly_revenue */
create database rt;
create table rt.monthly_revenue(order_id int,channel varchar(30),date date, month int,revenue int);

/* insert values into monthly_revenue */

insert into rt.monthly_revenue
values(1,'online','2018-09-01',09,100),
	  (2,'online','2018-09-03',09,125),
      (3,'in-store','2018-10-11',10,200),
      (4,'in-store','2018-08-21',08,80),
      (5,'online','2018-08-13',08,200);
      
/* calculate monthly revenue growth in sql 
revenue growth = current month's revenue - prior month's revenue / prior month's revenue
*/
use rt;
select * from monthly_revenue;


with cte as(
select *,lag(total_sum) over(order by month) as lag_total_sum
from (
select month,sum(revenue) total_sum
from monthly_revenue
group by month) a) 
select *, (total_sum - lag_total_sum) / lag_total_sum   as revenue_increase
from cte;


/* create table emp */
create database dd;
create table emp(id int,name varchar(20),salary int, dept varchar(20));

 /* insert values into emp */
 
 insert into emp
 values(1,'jeo',70000,'IT'),
	   (2,'Jim',90000,'IT'),
       (3,'Henry',80000,'HR'),
       (4,'Sam',60000,'HR'),
       (5,'Max',90000,'IT'),
	   (6,'Jerry',50000,'HR');
    insert into emp
 values(1,'jeo',70000,'IT');
   select *from emp
   order by salary desc
   limit 2,1;
 -- 1. Third highest salary dept wise 
 select * from (select *,row_number() over (order by salary desc) rn from emp) a where a.rn=3;
 
 -- 2. why we use group by clause 
 
 select dept,sum(salary)
 from emp
 group by dept;
 
 -- 3. write a query to create new table whose structure copied from the another table
 

 create table emp_copy like emp; -- to copy the structure

create table emp_copies as select * from emp; -- to copy structure as well as the data

-- 4. write a query to  retrieve first 4 characters of name from given table

select name,left(name,4)
from emp;

select name,substr(name,1,4)
from emp;

-- 5.write a query to fetch data of employee whose name ends with an alphabet Y ans contains 5  alphabets

select * 
from emp
where name like '____y';

-- 6. how to find the duplicates in given table
select *
from (select id,count(*) cnt
from emp
group by id) a
where a.cnt >= 2;

-- 7. how to delete duplicates
create table emp_copy like emp;


insert into emp_copy
select distinct * from emp;

drop table emp;

alter table emp_copy rename as emp;

select * from emp;


-- 8. Difference between rank(),dense_rank(),row_number()

select *,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) as d_rnk,
row_number() over(order by salary desc) as rowno
from emp;
 
       
-- 10. difference between lead() and lag()

select *,lead(salary) over(order by salary desc) as lead_,
lag(salary) over(order by salary desc) as lag_
from emp;

-- 11. find the max salary, min salary and avg salary dept wise

select dept,max(salary),min(salary), avg(salary)
from emp
group by dept;

-- 12. difference between union and union all

create table city(name varchar(30),city varchar(30)) ;

insert into city
values('A','Delhi'),
      ('B','Jaipur'),
      ('C','Pune'),
      ('D','Geo');

      
create table city2(name varchar(20), city varchar(30));

insert into city2
values('E','Raj'),
      ('B','Japiur'),
      ('C','Pune'),
      ('F','Shimla');                     


select * from city
union                    -- union will oly give us the uniques values
select * from city2; 

select * from city
union  all              -- union all will all the records including duplicates
select * from city2; 

--  How to find the duplicate name in any table

select name
from emp
group by name
having count(name) > 1;

-- write a query to count the employee name where dept is HR

select count(name)
from emp
where dept = 'HR';

-- write a query where employee name ends with 'n' and having 5 character

select *
from emp
where name like '____y';

-- find the details of the employees whose salary lies between 20000 to 50000

select *
from emp
where salary between 20000 and 50000;

-- write a query to find the 2nd highest salary without limit function

select *
from(select *,dense_rank() over(order by salary desc) rnk
from emp)a
where a.rnk = 2;

select max(salary) 
from emp
where salary < (select max(salary) from emp);

select *
from emp
order by salary desc
limit 1,1;

-- difference between char and varchar
/*
char - static memory allocation, used to store fixed length characters
varchar - dynamic memory allocation, used to store variable length characters
*/
-- top 3 highest salary's

select *
from emp
order by salary desc
limit 3;

select *
from (select *,dense_rank() over(order by salary desc) rnk
from emp) a
where a.rnk <= 3;

-- name shouldn't start with vowels and shouldn't end with vowel

select *
from emp
where name not  like( '^([aeiouAEIOU].*[aeiouAEIOU])$'); 

-- query  an alphabetically ordered list of all the names in occupations,
-- immediately followed by th first letter of each profession as a parenthetical(i.e.: enclosed in parentheses)
--  output like this Jania(D),Lanny(S)
create database e;
create table e.occ(name varchar(30), occupation varchar(30));

insert into e.occ
values('Jania','Doctor'),
	  ('Lanny','Singer'),
      ('Norina','Lawyer');
      
      
 select concat(name,'(',left(occupation,1),')')
 from e.occ;
      
/* create table matches */

create table matches(team1 varchar(30),team2 varchar(30),winner varchar(30));

/* insert values into matches table */

insert into matches
values('India','SL','India'),
	  ('SL','Aus','Aus'),
      ('SA','Eng','Eng'),
      ('Eng','NZ','NZ'),
      ('Aus','India','India');

/* We have list of teams who have played the match and of course one of them won.
What we need is a score board which includes each team , no. of matches played, matches won and matches lost.
*/

select count(winner)
from matches
where winner = 'India';

select a.teams,count(a.teams) matches_played,sum(a.win_flag) won_matches,(count(a.teams)-sum(a.win_flag)) Lost_matches
from (select team1 as teams,(case when team1 = winner then 1 else 0 end ) as win_flag
from matches
union all
select team2 as teams,(case when team2 = winner then 1 else 0 end) as win_flag
from matches) a
group by teams;

----------------------------------------------------------




 
  
  

