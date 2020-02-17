-- Consider  and  to be two points on a 2D plane.
--
--  happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the minimum value in Western Longitude (LONG_W in STATION).
--  happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

MIN(LAT_N) -- a
MIN(LONG_W) -- b
MAX(LAT_N) -- c
MAX(LONG_W) -- d


SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(Long_W)),4) FROM STATION
