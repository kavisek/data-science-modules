-- onsider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
--
-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

MIN(LAT_N) -- a
MIN(LONG_W) -- b
MAX(LAT_N) -- c
MAX(LONG_W) -- d


SELECT ROUND(
    SQRT(
            POWER(
                MIN(LAT_N) - MAX(LAT_N),2
            ) +
            POWER(
                MIN(LONG_W) - MAX(Long_W)
            ,2)
    )
,4) FROM STATION
