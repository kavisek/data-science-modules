-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
--
-- Note: CITY.CountryCode and COUNTRY.Code are matching key column

SELECT SUM(CIty.Population)
FROM CITY
LEFT JOIN COUNTRY ON COUNTRY.code = CITY.countrycode
WHERE continent LIKE 'Asia'
