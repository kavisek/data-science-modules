-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(Population)
FROM CITY
WHERE COUNTRYCODE LIKE 'JPN'
