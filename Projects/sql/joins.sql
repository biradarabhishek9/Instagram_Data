-- left joins
/*select emp.id,emp.name,comp.salary
from abc.emp left join abc.comp
on emp.id=comp.id;

/*select a.id,a.name.b.salary
 from abc.emp a inner join abc.comp b
on a.id=b.id*/

/*select emp.id.emp.name,comp.salary 
from abc.emp left join abc.comp
on empid=comp.id;*/



select name from subjects join classes on 
/*select a.id,a.name,b.salary
from abc.emp left join abc.comp b
on a.id=b.id;

select a.id,a.name.b.salary 
from abc.emp left join abc.comp b 
on a.id=b.id;*/

select emp.id,emp.name,comp.salary
from abc.emp left join abc.comp
on empid=compid;

select a.id,a.name,b.salary
from abc.emp left join abc.comp b 
on a.id=b.id;

-- inner join 
select a.id,a.name,b.salary
from abc.emp a inner join abc.comp b
on a.id=b.id

/*select emp.id,emp.name,comp.salary
from abc.emp inner join abc.comp
on empid=compid*/

-- right join

/*select b.id,a.name,b.salary 
from abc.emp a right join abc.comp b
on a.id=b.id;*/

/*select comp.id,emp.name,comp.salary
from abc.emp a right join abc.comp b
on emp.id=comp.id*/

/* select b.id,a.name,b.salary
from abc.emp a right join abc.comp
on a.id=b.id*/

-- full outer join  or full join

/*select a.id,a.name,b.salary
from abc.emp a left join abc.comp b
on empid=compid
union 
select b.id,a.name,b.salary
from empid a right join abc.comp b
on a.id=b.id*/

/*select a.id,a.name,b.salary from abc.emp left join abc.comp on a.id=b.id
union 
select b.id,a.name,b.salary from abc.emp right join abc.comp on a.id=b.id;*/



-- cross join 

/*select *from abc.emp
cross join 
select * from abc.comp*/

/*select *from abc.emp
cross join
select *from abc.comp*/


/*select *from abc.emp 
cross join 
select *from abc.comp*/



-- cross join
/*select *from abc.emp
cross join 
select *from abc.comp*/


/*select id,name from abc.emp
where  id from abc.comp where salary=300;*/

/*select id,name from abc.emp
where id=(select id from comp where salary =3000;*/

/*drop database yy;*/
create database yy;
create table yy.emp
(id int,
age int,
gender enum("m","f"),
section varchar(30),
salary varchar(20),
primary key(id));

insert into yy.emp
values
(1,23,"f","a",1000),
(2,34,"m","b",2000),
(3,43,"m","c",4000);




create table yy.emp1
(id int,
age int,
gender enum("m","f"),
salary varchar(20),
school varchar(20),
foreign key(id) references emp(id));

insert into yy.emp
values
(6,23,"f",1000,"dbh"),
(5,34,"m",2000,"hyudfg"),
(8,43,"m",4000,"hdfsb");

desc  yy.emp1;
select *from yy.emp1;

select *from abc

-- find the id and name from emp table,whose salary is 300 in comp table 
-- nested query

/*select id,name from abc.emp
where id=(select id from abc.comp where salary=300);*/

/*select id,name from abc.emp 
where id=(select id from abc.comp where salary =300)*/

select id,name from abc.emp 
where id=(
select id from comp 
where salary=300);


select id,name from abc.emp 
where id= (
select id from abc.enmp
where salary=300);


select id,name from abc.emp
where id=(select id from abc.comp
where salary=300);

select a.id,a.name,b.salary from abc.emp a join abc.comp b on a.id=b.id where salary=300;

select e.emp,e.name,e.last,s.salary
from employee e join salaries
on e.emp=s.emp
where salary>300;


/*select a.id,a.name.b.salary
 from abc.emp a inner join abc.comp b
on a.id=b.id*/


-- to do outer join write left join union right join

-- Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”

/*select a.name,a.last,a.hire date,b.jobt
 from a.emp a join b.comp b on a.id=b.id 
 where fname=“Margareta” and last name=“Markovitch”
 order by a.emp ;*/


/* Use a CROSS JOIN to return a list with all
 possible combinations between managers from 
 the dept_manager table and department_number 9 */
 
 /*select a*,b* from abc.a cross join abc.b where b.deptno=009 
 order by deptno */
 
 /*select a*,b* from abc.a cross join abc.b where name<11 
order by a.emp = b.dept*/
 
drop database yy;
create database yy;
create table yy.emp
(id int,
age int,
gender enum("m","f"),
section varchar(30),
salary varchar(20),
primary key(id));

insert into yy.emp
values
(1,23,"f","a",1000),
(2,34,"m","b",2000),
(3,43,"m","c",4000);




create table yy.emp1
(id int,
age int,
gender enum("m","f"),
salary varchar(20),
school varchar(20),
foreign key(id) references emp(id));

insert into yy.emp
values
(6,23,"f",1000,"dbh"),
(5,34,"m",2000,"hyudfg"),
(8,43,"m",4000,"hdfsb");

desc  yy.emp1;
select *from yy.emp1;

select *from abc

-- find the id and name from emp table,whose salary is 300 in comp table 
-- nested query

/*select id,name from abc.emp
where id=(select id from abc.comp where salary=300);*/

/*select id,name from abc.emp 
where id=(select id from abc.comp where salary =300)*/

select id,name from abc.emp 
where id=(
select id from comp 
where salary=300);


select id,name from abc.emp 
where id= (
select id from abc.enmp
where salary=300);
select id,name from emp
where id in (select id from dept where salary=300

select id,name from abc.emp
where id=(
select id from abc.comp
where salary=300);


select id,name ,salary from emp where id=(
selectr id from dept where salalry=300)