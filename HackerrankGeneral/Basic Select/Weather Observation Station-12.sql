*/
16)Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/

select distinct 
    city
from 
    station  
WHERE 
    LEFT(CITY,1) NOT IN ('a','e','i','o','u','A','E','I','O','U')
    AND 
    RIGHT(CITY,1) NOT IN ('a','e','i','o','u','A','E','I','O','U');
 GO