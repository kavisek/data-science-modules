-- Query the average population of all cities in CITY where District is California.

SELECT AVG(Population)
FROM CITY
WHERE DISTRICT LIKE 'California';
