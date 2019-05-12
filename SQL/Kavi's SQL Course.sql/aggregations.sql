-- ------------------------------------------------------------------------------
-- Author: Kavi Sekhon
-- Date: May 2019
-- Purpose: Aggregation Queries
-- ------------------------------------------------------------------------------



-- --------------------------------------
-- Group By (80% of queries)
-- --------------------------------------

SELECT Name, SUM(Population) FROM city
GROUP BY NAME

-- --------------------------------------
-- Having (10% of queries)
-- --------------------------------------

SELECT Name, SUM(Population) FROM city
GROUP BY NAME
HAVING SUM(Population) > 1000000

-- --------------------------------------
-- Where statment with having clause
-- --------------------------------------

SELECT Name, SUM(Population) FROM city
WHERE countrycode = 'AFG'
GROUP BY NAME
HAVING SUM(Population) > 1000000


-- --------------------------------------
-- UNION WITH GROUP BY
-- --------------------------------------

SELECT Name, SUM(Population) FROM city
WHERE countrycode = 'AFG'
GROUP BY NAME
HAVING SUM(Population) > 1000000
