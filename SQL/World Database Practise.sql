# View Database
SHOW DATABASES LIKE '%Enviroment';

# Drop Database
DROP DATABASE Enviroment;

# List the number of language spoken in each conutry
SELECT
	c.name,
	GROUP_CONCAT(l.Language)
	FROM country c
		LEFT JOIN countrylanguage l
		ON l.CountryCode = c.Code
	GROUP BY c.Code;

# Count the number of language spoken in each conutry
SELECT
	c.name,
	COUNT(l.Language)
	FROM country c
		LEFT JOIN countrylanguage l
		ON l.CountryCode = c.Code
	GROUP BY c.Code;

# Added on your count of langauges to the data from the country table

SELECT
	c.*,
	COUNT(l.Language)
	FROM country c
		LEFT JOIN countrylanguage l
		ON l.CountryCode = c.Code
	GROUP BY c.Code;

# Group BY Summation Query
SELECT Continent, SUM(Population)
FROM country
GROUP BY Continent

# Starting with E and ending in e, wildcard query
SELECT *
FROM country
WHERE Continent LIKE 'E%e'

# Simple Rollup Query on population via continent


SELECT Continent, SUM(Population) FROM country
GROUP BY Continent WITH ROLLUP

# More complex rollup query on population via continent and region

SELECT Continent, Region, SUM(Population) FROM country
GROUP BY Continent, Region WITH ROLLUP
















