/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal 4 places.
*/

select 
    Round(max(LAT_N),4)
from 
    STATION
where 
    LAT_N < 137.2345;
 GO
