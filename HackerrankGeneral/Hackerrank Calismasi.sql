Hackerrank sql

/*1)Query all columns for all American cities 
in the CITY table with populations larger than 100000. 
The CountryCode for America is USA.*/

Select
    *
From
    City
Where
    COUNTRYCODE='USA' 
    AND 
    POPULATION>100000;
GO

/*
2)Query the NAME field for all American cities 
in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.*/

Select
    Name
From
    City
Where
    COUNTRYCODE='USA' 
    AND
    POPULATION>120000;
GO

/*
3)Query all columns (attributes) for every row in the CITY table.
*/

Select
    *
From
    CITY;
GO

/*
4)Query all columns for a city in CITY with the ID 1661.
*/

Select
    *
From
    CITY
Where
    ID=1661;
GO

/*
5)Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
*/

Select
    *
From
    CITY
Where
    COUNTRYCODE='JPN';
GO

/*
6)Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
*/

Select
    Name
From
    CITY
Where
    COUNTRYCODE='JPN';
GO

/*
7)Query a list of CITY and STATE from the STATION table.
*/
SELECT 
    CITY, STATE 
FROM 
    STATION;
GO

/*
8)Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.
*/

 SELECT DISTINCT 
    CITY 
FROM 
    STATION 
WHERE 
MOD(ID, 2) = 0;
GO

/*
9)Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
*/
Select
    Count(CITY) - Count(distinct CITY)
From
    STATION ; 
GO   
 
 /*
10)Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/

select 
    city c, 
    length(city) l
from   
    station
order by l desc, c asc
limit 1;
select 
    city c, 
    length(city) l
from   
    station
order by l asc, c asc
limit 1;
GO

/*
11)Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT 
    city 
FROM 
    station 
WHERE 
    city LIKE "A%" OR 
    city LIKE "E%" OR 
    city LIKE "I%" OR 
    city LIKE "O%" OR 
    city LIKE "U%";
GO

/*
12)Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT 
   city 
FROM 
    station 
WHERE 
    city LIKE "%A" OR 
    city LIKE "%E" OR 
    city LIKE "%I" OR 
    city LIKE "%O" OR 
    city LIKE "%U";
GO

/*
13)Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT 
    city 
FROM 
    station 
WHERE not 
    (city LIKE "A%" OR 
     city LIKE "E%" OR 
     city LIKE "I%" OR 
     city LIKE "O%" OR 
     city LIKE "U%");

14)Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

select distinct city
from station
where not 
    (city like '%A' or 
     city like '%E' or 
     city like '%I' or 
     city like '%O' or 
     city like '%U');

15)Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

select distinct 
    city
from station 
where not 
    (city like 'A%' or 
    city like 'E%' or 
    city like 'I%' or 
    city like 'O%' or
      city like 'U%') 
      or not 
      (city like '%a' or 
      city like '%e' or 
      city like '%i' or 
      city like '%o' or  
      city like '%u');
16)Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

select distinct 
    city
from 
    station 
where not 
(city like 'A%' or 
city like 'E%' or 
city like 'I%' or
 city like 'O%' or
   city like 'U%') and not 
   (city like '%a' or 
   city like '%e' or 
   city like '%i' or 
   city like '%o' or  
   city like '%u');
17)Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT 
    name 
FROM 
    students 
WHERE 
    marks > 75 ORDER BY SUBSTR(name, LENGTH(name)-2, 3), id;

18)Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

SELECT 
    NAME
FROM 
    EMPLOYEE
WHERE 
    SALARY > 2000 AND MONTHS < 10
ORDER BY
     EMPLOYEE_ID ASC;
19)Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

select 
    concat(name,'(',substring(Occupation,1,1),')') as Name 
from 
    occupations 
order by Name;
Select 
    concat ('There are a total of ', count(occupation),' ', lower(occupation),'s.') as totals
from 
    occupations
group by occupation
order by totals

21)set @r1=0, @r2=0, @r3=0, @r4=0;
select 
    min(Doctor), min(Professor), min(Singer), min(Actor)
from
    (select 
        case when Occupation="Doctor" then (@r1:=@r1+1) 
        when Occupation="Professor" then (@r2:=@r2+1) 
        when Occupation="Singer" then (@r3:=@r3+1) 
        when Occupation="Actor" then (@r4:=@r4+1) 
        end as RowNumber,
case 
    when Occupation="Doctor" then Name end as Doctor,
case 
    when Occupation="Professor" then Name end as Professor,
case 
    when Occupation="Singer" then Name end as Singer,
case 
    when Occupation="Actor" then Name end as Actor from OCCUPATIONS order by Name
) 
Temp group by RowNumber;

22)Query the total population of all cities in CITY where District is California.

select 
    sum(population)
from 
    city
where 
    district ='California';
23)Query the average population of all cities in CITY where District is California.


select 
    sum(population)
from 
    city
where 
    district ='California';

24)Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT 
    FLOOR(AVG(POPULATION))
FROM 
    CITY

25)Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN

select
    sum(population)
From
    city
Where 
    COUNTRYCODE='JPN'

26)Query the difference between the maximum and minimum populations in CITY.

SELECT 
    MAX(POPULATION) - MIN(POPULATION)
FROM CITY

27)Query a count of the number of cities in CITY having a Population larger than 100000.

select
    count(*)
from
    CITY
Where 
    POPULATION>100000

28)We define an employee's total earnings to be their monthly salary * month  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers

SELECT 
    MONTHS*SALARY AS earnings, 
    COUNT(*)
FROM 
    employee
GROUP BY 
    earnings 
ORDER BY 
    earnings DESC
LIMIT 1;
29)
SELECT 
    ROUND(SUM(LAT_N),2),
    ROUND(SUM(LONG_W),2)
FROM 
    STATION;
30)Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less 137.2345 than . Truncate your answer to 4 decimal places.
select 
    Round(sum(LAT_N),4)
from 
    STATION 
where 
    LAT_N > 38.7880 and LAT_N < 137.2345;
31)Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal 4 places.
select 
    Round(max(LAT_N),4)
from 
    STATION
where 
    LAT_N < 137.2345;
32)


