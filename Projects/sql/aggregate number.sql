-- distinct and order by dont work together
-- to find the students joined in feb
#count
select count(*) from students where batch_date like "%-02-%";
select count(*) from students where batch_date like "19-%";

#group by 
select source_of_joining,count(*) from students group by source_of_joining;

-- to find count of students from diff location
select location,count(*) from students group by location;
-- this will not work bcoz soureof joing not ment in select
select location,count(*) from students group by source_of_joining;
select location,source_joining,count(*) from students
group by location,source_joining;
-- find no of ppl from each course
select source_of_joining,count(*) from students
group by source_of_joining;
select batch_date,selected_course,count(*) from students group by batch_date,ed_course;
-- each batch how many batches are sold

-- min,max
-- this wont work
select min(yearofexp),studentname from students;

select students from student 
order by yearexp limit 1 ;

select students,max(yearexp),course from student
group by course;

/*select *from students where year <8 and source join ="link" and loca="bang";



select *from stuebwfjb
whrer comp in(IRUH,HFWEBG.WUEFI);
select stud,idf,
(case 
when course >4 then masters p
else diploma end)as co
from stu

when prodcut in ("walmart",'filpkart') then "product based"
else service based end) as kldfnfrom jf*/

drop database ShowRoom;
CREATE Database ShowRoom;

USE ShowRoom;

CREATE TABLE Cars
(
id INT,
name VARCHAR(50) NOT NULL,
company VARCHAR(50) NOT NULL,
power INT NOT NULL
);


USE ShowRoom;
INSERT INTO Cars
VALUES
(1, 'Corrolla', 'Toyota', 1800),
(2, 'City', 'Honda', 1500),
(3, 'C200', 'Mercedez', 2000),
(4, 'Vitz', 'Toyota', 1300),
(5, 'Baleno', 'Suzuki', 1500),
(6, 'C500', 'Mercedez', 5000),
(7, '800', 'BMW', 8000),
(8, 'Mustang', 'Ford', 5000),
(9, '208', 'Peugeot', 5400),
(10, 'Prius', 'Toyota', 3200),
(11, 'Atlas', 'Volkswagen', 5000),
(12, '110', 'Bugatti', 8000),
(13, 'Landcruiser', 'Toyota', 3000),
(14, 'Civic', 'Honda', 1800),
(15, 'Accord', 'Honda', 2000);


select name,company,power,
rank() over ( order by power desc) as  rn
from ShowRoom.cars 
limit 3
;
SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM Cars;
SELECT name,company, power,
DENSE_RANK() OVER( ORDER BY power DESC) AS DensePowerRank
FROM Cars;

SELECT name,company, power,
DENSE_RANK() OVER( ORDER BY power DESC) AS DensePowerRank
FROM Cars;
SELECT name,company, power,
ROW_NUMBER() OVER(ORDER BY power DESC) AS RowRank
FROM Cars;
SELECT name, company, power,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS RowRank
FROM Cars;

SELECT name, company, power,
RANK() OVER(ORDER BY power DESC) AS "Rank",
DENSE_RANK() OVER(ORDER BY power DESC) AS "DenseRank",
ROW_NUMBER() OVER(ORDER BY power DESC) AS "RowNumber"
FROM Cars;
 
 -- joins 
 -- course
 -- students
 -- want to know in which course has enrolled
 -- know course name 
# students
 -- students_fname,selected_course
 -- rahul,1
 #courses
 -- course_id,course_name
-- 1,big_data

 select course_name from courses where course_id=(
 select selected_course from students where student_fname="rahul");
 drop database h;
 create database h;
 create table h.students
 ( name varchar(34),
 id int not null,
 selected_course varchar(34));
 
 insert into h.students
 values
 ("rohit",2,null),
 ("virat",1,null),
 ("shikhar",3,null),
 ("rahul",1,null),
 ("kapil",1,null),
 ("brian",1,null),
 ("carl",1,null),
 ("saurabh",1,null);
select *from h.students where selected_course in (select selected_course from h.students where  name="rahul");
create database h;
 
 create table h.courses
(course_id int,
course_name varchar(45),
course_duration_months int,
course_fee int);
 
 insert into h.courses
 values
 (1,"big data",6,50000),
 (2,"web development",3,20000),
 (3,"data science",6,40000),
 (4,"datastructures",4,20000);
 
select *from h.students;
select course_name from h.courses where course_id=(
 select id from h.students where name="rahul");
select *from h.student;
use h;
 select course_name from h.courses where course_id=(select id from h.students where name="rahul");
 select a.name,a.name,b.course_name from students a join courses b on a.id=b.course_id;
 -- by default it is a inner join
 
 select course_id,count(*) as total from courses
 group by course_id having total>1;
 
 
 -- how many people are from each location and avg salary  at each location
 select location,count(location),avg(salary) from employee group by location;
 
-- select location ,count(location,avg(salary) from employees group by location;

select fname,lname,location, count(location) over (partition by location) as total,avg(salary) 
over (partition by location) as average from employee;

 
 select name,lname,location,
 count(location) over (partition by location) as total,
 avg(salary) over (partition by salary) as avg
 from employee;
 
 -- to find 5th highest salary
 select *from (select name,lname,salary, 
 row_number() over (order by salary desc) as rownum from emp)as
 temtable where temtable.rownum=5;
 
 select *from (select name ,salry,
 row_number() over (order by salary desc) as rownum from emp)temtable where rownum=5;
 
 use h;
 -- highest salary getter by each locaion'
select * from  (select course_id,course_fee,
 row_number() over (partition by course_id order by course_fee desc) as rownum
 from courses) temptable where rownum=1;
 
 -- top salary
 select *from
(select course_id,course_fee,
 row_number() over (order by course_fee desc) as rownum
 from h.courses) as tempt  where rownum=1;
 

 -- if therr are no dupliates then row number ,rank and demse rank lesad to similar resullts
 -- onyly diff comes when there are duplicates
 
 -- rank for duplicates same rank is assigned and for the next entry it skips ranks .
 -- dense rank it does not skip any no
 -- no duplicates then use row_number
 
 
 -- cte 
 -- this is to simplify complex queries
 -- it improves the readability of a query
 
 
 
 create database  HumanResources;
 
 SELECT FirstName, LastName, Department  
FROM HumanResources.vEmployeeDepartmentHistory  
WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 