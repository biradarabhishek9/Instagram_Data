alter table dspro.emp	
add column age int;

set sql_safe_updates = 0;
update dspro.emp	
set age = 29 where id = 3;

insert into stu 
values( 1,"chanakya","M",24);

alter table emp
add city varchar(10);

update stu set city="blr" where id between 1 and 5;
update stu
set city="chn" where id between 6 and 8;

update emp
set age=age+1;
update emp
set salary=salary+5000;

create table stu2 
as 
select *from stu;

-- delete gender column
alter table emp
drop gender;

delete  from stu where city = "blr";

create view dspro.asia as 
select * from world.country
where continent = "asia";

create view dspro.id as 
select name from world.country;


/* print the count of unique records */
select distinct count(*) from  world.country;

select count(distinct continent) 
from world.country;


select continent,name,population
from world.country
order by 1,3 desc
limit 10;

/* print data from asia,europe,africa where population > 20 cr. life_expetency b/w 70 and 80 , indep_year >1900 */

SELECT *FROM WORLD.COUNTRY
WHERE CONTINENT IN ("ASIA","EUROPE","AFRICA")
AND POPULATION >200000
AND LifeExpectancy BETWEEN 70 AND 80
AND IndepYear>1900;

 /* print data by excluding antarctica and south america with indepyear either before 1900 or after 1950,
 having lifeexpetancy in betweeen 50 to 80 
 and governmentform is republic ,federal republic,islamic emirate
 and population is not zero*/
 
 SELECT *FROM WORLD.COUNTRY
 WHERE NOT  CONTINENT  IN ("antarctica","south africa")
 and indepyear not between 1900 and 1950
 and lifeexpectancy between 50 and 80
 and governmentform ="republic"
 and population>0;
 
     select Continent,name,surfacearea,population,
    if(indepyear is null,2022,indepyear) as iyear
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

-- day 6 start
 
