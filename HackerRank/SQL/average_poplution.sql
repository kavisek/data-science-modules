-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(Population), 0)
FROM City
