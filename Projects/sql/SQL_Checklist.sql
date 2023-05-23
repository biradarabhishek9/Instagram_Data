-- ############################################################################################################################################################################################################################################################################################ --

-- -----------------------------------------------Aggregate functions-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- An aggregate function can be used under below 6 scenarios --
-- 1. Aggregate value applied on the table e.g. average GNP in country table (No where/having or group by keyword will be used) --
-- 2. Aggregate values on the basis of a column or more than one column e.g. region-wise average GNP, continent-wise and region-wise average GNP (group by keyword will be used) --
-- 3. Aggregate values on the basis of a particular column value e.g. average GNP of Asia (where keyword will be used) --
-- 4. Aggregate values on the basis of more than one unique column value but not all unique column values e.g. average GNP of Asia and Africa (where and group by keywords will be used) --
-- 5. Aggregate values on the basis of a column or more than one column along with condition on aggregate function e.g. region-wise average GNP whose average GNP >20000, continent-wise and region-wise average GNP whose average GNP > 20000(group by and having keywords will be used) --
-- 6. Aggregate values on the basis of more than one unique column value but not all unique column values along with condition on aggregate function e.g. average GNP of Asia,Europe and Africa whose average GNP >20000 (where,group by and having keywords will be used) --

-- ----------------------------------------------------Subqueries-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Subqueries will be used when comparision is made between a column and aggregate function or between aggregate function --
-- Comparision between a column and aggregate function e.g. Show Continent and Region name along with GNP which has the GNP > Average GNP of country table --
-- Comparision between aggregate function e.g. Show Continent along with average GNP which has the average GNP < Average GNP of Asian continent --

-- Subqueries are of two types namely: Independent subquery and correlated subquery --
-- When the inner query returns a single record/row, it is called as independent subquery --
-- When the inner query returns more than one record/row, it is called as correlated subquery --
-- Independent subquery can return more than one record/row if any primary key or foreign key column is used in select statement of inner query --

-- ############################################################################################################################################################################################################################################################################################### --

-- Average GNP in country table --
select avg(GNP) from world.country;

-- Region-wise average GNP --
select Region,avg(GNP) from world.country
group by Region;

-- Continent-wise and region-wise average GNP --
select Continent,Region,avg(GNP) from world.country
group by Continent,Region;

-- Continent-wise and region-wise average GNP and average surface area (Here average GNP and average GNP are not interdependent on each other) -- 
select Continent,Region,avg(GNP),avg(surfacearea) from world.country
group by Continent,Region;

-- Average GNP for Asian continent --
select Continent,avg(GNP) from world.country
where Continent='Asia';

-- Avergae GNP for Asian and European continents --
select Continent,avg(GNP) from world.country
where Continent in ('Asia','Europe')
group by Continent;

-- Maximum GNP for each Continent --
select Continent,max(GNP) from world.country
group by Continent;

-- Maximum GNP for each Continent and region combination --
select Continent,Region,max(GNP) from world.country
group by Continent,Region;

-- Continent and Region name having the highest average GNP --
select Continent,Region,avg(GNP) as average_GNP from world.country
group by Continent,Region
order by average_GNP desc limit 1;

-- Continent and Region name having the lowest average GNP --
select Continent,Region,avg(GNP) as average_GNP from world.country
group by Continent,Region
order by average_GNP limit 1;

-- Show number of records for each continent and region combination --
select Continent,Region,count(*) as number_of_records from world.country 
group by Continent,Region
order by Continent,Region;

-- Show number of regions for each continent --
select continent,count(distinct region) from world.country
group by continent;

-- Show number of records for each continent and region combination. Show those combinations whose number of combinations is greater than equal to 10 --
select Continent,Region,count(*) as number_of_records from world.country 
group by Continent,Region
having count(*)>=10
order by Continent,Region;

-- Show number of records for each continent and region combination of Asia and Africa continents. Show those combinations whose number of combinations is greater than equal to 10 --
select Continent,Region,count(*) as number_of_records from world.country
where continent in ('Asia','Africa') 
group by Continent,Region
having count(*)>=10
order by Continent,Region;

-- Show Continent and Region name along with GNP which has the maximum GNP -- (Independent subquery)
select GNP,Continent,Region from world.country
where GNP = (select max(GNP) from  world.country);

-- Show Continent and Region name along with GNP which has the GNP > Average GNP of country table -- (Independent subquery)
select GNP,Continent,Region from world.country
where GNP > (select avg(GNP) from  world.country);

-- Show Continent and Region name along with GNP which has the GNP > Average GNP of each continent and region combination -- (Correlated subquery)
select GNP,Continent,Region from world.country a
where GNP > (select avg(GNP) from  world.country b where a.Continent=b.Continent and a.Region=b.Region);

-- Show Continent along with average GNP which has the average GNP < Average GNP of Asian continent -- (Independent subquery)
select avg(GNP),Continent from world.country
group by Continent
having avg(GNP) < (select avg(GNP) from  world.country where Continent='Asia');

-- Show Continent along with average GNP which has the average GNP < Average GNP of Asian and African continent -- (Correlated subquery)
select avg(GNP),Continent from world.country a
where not Continent in ('Asia','Africa')
group by Continent
having avg(GNP) < (select avg(GNP) from  world.country b where Continent in ('Asia','Africa')
and a.Continent <> b.Continent);

-- Show Continent,Region along with average GNP which has the average GNP < Average GNP of Asian and African continent -- (Correlated subquery)
select avg(GNP),Continent,Region from world.country a
where not Continent in ('Asia','Africa')
group by Continent,Region
having avg(GNP)<(select avg(GNP) from world.country b
where Continent in ('Asia','Africa')
and a.Continent<>b.Continent);

-- Show Asian Continent,Region along with average GNP which has the average GNP > Average GNP of Asian continent and Middle East region -- (Correlated subquery)
select avg(GNP),Continent,Region from world.country a
where Continent ='Asia' 
and not region='Middle East'
group by Region
having avg(GNP)>(select avg(GNP) from world.country b
where Continent ='Asia' and Region='Middle East'
and a.Region<>b.Region);

-- Show number of records whose GNP > Average GNP of Asian continent -- (Independent subquery)
select count(*) from world.country 
where GNP > (select avg(GNP) from world.country 
where Continent ='Asia');

-- Show number of records whose average GNP > Average GNP of Asian continent -- (Independent subquery)
select count(*) as number_of_records from (select Continent,avg(GNP) from world.country 
where not continent = 'Asia'
group by continent
having avg(GNP) > (select avg(GNP) from world.country 
where Continent ='Asia'))temp;

-- Show number of Asian Continent & Region which has the average GNP > Average GNP of Asian continent and Middle East region (Count of records and average GNP are interdependent on each other, so temporary table is created)-- (Correlated subquery)
select count(*) as number_of_regions from (select avg(GNP),Continent,Region from world.country a
where Continent ='Asia' 
and not region='Middle East'
group by Region
having avg(GNP)>(select avg(GNP) from world.country b
where Continent ='Asia' and Region='Middle East'
and a.Region<>b.Region))temp;

-- Show number of records of each Continent and Region combination which has the GNP > Average GNP of each continent and region combination -- (Correlated subquery) 
select Continent,Region,count(*) as number_of_records from world.country a
where GNP > (select avg(GNP) from  world.country b where a.Continent=b.Continent and a.Region=b.Region)
group by Continent,Region
order by Continent,Region;

-- Show those Continents whose average GNP is greater than the average GNP of both Asia and Africa -- (Independent subquery)
select Continent,avg(GNP) from world.country
where not continent in ('Asia','Africa')
group by continent
having avg(GNP)>(select avg(GNP) from world.country where continent in ('Asia','Africa')
group by continent
order by avg(GNP) desc limit 1);

-- Show Student Id and marks for those students whose branch is CSE -- (Independent subquery)
select SId,Marks from student_performance
where SId in (select SId from student_1details where branch='CSE');

-- Show name of employees who are not managers -- (Independent subquery)
select empID,empName from selfjoinexample
where not empID in (select distinct mngrID from selfjoinexample); -- Here mngrID is the employeeID of manager







