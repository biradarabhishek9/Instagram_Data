-- employee table 
-- you prefer to hire from bangalore
drop database abc;
create database abc;
create table abc.emp
(
fname varchar(20),
mname varchar(20),
lname varchar(20),
age int,
salary int,
location varchar(20)
);

-- this is ddl command (above)
use abc;
insert into abc.emp
 values
('rim','rimm','rimmm',20,3567,'bangalore'),
('tim','timm','timmm',26,2728,'delhi'),
('lim','limm','limmm',23,2227,'jodhpur'),
('fim','limm','limmm',23,2227,'jodhpur'),
('lim','limmm','ghfj',23,2227,'jodhpur'),
('tim','timm','timmm',26,2728,'delhi'),
('lim','limm','limmm',23,2227,'jodhpur'),
('fim','limm','limmm',23,2227,'jodhpur');


select fname,lname,age,salary,location,
row_number() over (partition by fname,lname,age,salary,location) as rn from abc.emp;

select distinct*from abc.emp 
order by salary desc
limit 1,1;
select *from (select *,row_number() over (order by salary desc)as rn
from abc.emp) as a where a.rn=4;

set sql_safe_updates=0;
update  abc.emp
set salary=6000 where fname="fim";

-- 2nd salary
use abc;

select distinct(salary) from abc.emp
order by salary desc
limit 1,1;
select * from emp
order by salary desc;
select max(salary) from emp where salary< (select max(salary) from emp);

select salary from emp order by salary desc limit 2,1;

select *from (select fname,salary,dense_rank() over (order by salary desc)as
 salary_rank from emp) as temp where salary_rank=3;

select concat(empname," ",emplname)as fullnmae
from emp;
select substring(fullnmae,0,charindex(" ",fullname))
from emp;

select fname,
mname ,
lname ,
age ,
salary ,
location,count(*) from abc.emp
group by fname,mname ,
lname ,
age ,
salary 
having count(*)>1;

select fname,count(*) from abc.emp
group by fname
having count(fname)>1
;

delete from emp 
where emp.fname in(select fname from emp group by dept having count(*)>1;
-- table with same structure
select * into swiggy2 into swiggy from oldtable where 1=0;


