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

#