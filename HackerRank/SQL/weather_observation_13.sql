-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.

SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345
