/*
1)Query a count of the number of cities in CITY having a Population larger than 100,000.
*/
SELECT 
    count (*)
FROM 
    CITY
WHERE 
    POPULATION > 100000;