/*
9)Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
*/
Select
    Count(CITY) - Count(distinct CITY)
From
    STATION ; 
GO   