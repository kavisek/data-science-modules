-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.
--
-- Input Format
--
-- The STATION table is described as follows:
--
-- Station.jpg
--
-- where LAT_N is the northern latitude and LONG_W is the western longitude.


select round(long_w,4)
from station
group by lat_n asc, long_w
having lat_n > 38.778
limit 1
