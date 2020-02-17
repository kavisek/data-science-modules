-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
--
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT CITY.NAME
FROM CITY
LEFT JOIN COUNTRY ON COUNTRY.code = CITY.countrycode
WHERE continent LIKE 'Africa'
