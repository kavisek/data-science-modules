-- ------------------------------------------------------------------------------
-- Author: Kavi Sekhon
-- Date: May 2019
-- Purpose: Some SQL code to learn the basic of SQL
-- ------------------------------------------------------------------------------



-- -------------------l-------------------
-- Left JOIN
-- --------------------------------------

SELECT city.Name, country.Name FROM city
INNER JOIN country ON city.countrycode = country.code


-- --------------------------------------
-- UNION STATMENT
-- --------------------------------------

SELECT * FROM city LIMIT 10;

UNION

SELECT * FROM city LIMIT 10;

-- --------------------------------------
-- Nested Queries
-- --------------------------------------


SELECT * FROM (SELECT * FROM city LIMIT 10) t1

SELECT Name FROM (SELECT * FROM city LIMIT 10) t1
