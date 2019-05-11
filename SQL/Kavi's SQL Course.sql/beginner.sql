-- ------------------------------------------------------------------------------
-- Author: Kavi Sekhon
-- Date: May 2019
-- Purpose: Some SQL code to learn the basic of SQL
-- ------------------------------------------------------------------------------



-- --------------------------------------
-- SELECT Database
-- --------------------------------------

USE world;

-- --------------------------------------
-- SELECT Entire Table
-- --------------------------------------

SELECT * FROM city;

-- --------------------------------------
-- WHERE statement (99% of queries)
-- --------------------------------------

SELECT * FROM city WHERE NAME = 'Kabul'

SELECT * FROM city WHERE NAME LIKE '%Kabul%'

SELECT * FROM city WHERE Population > 10000

SELECT * FROM city WHERE Population >= 10000

SELECT * FROM city
WHERE NAME = 'Kabul'
AND Population > 10000

SELECT * FROM city
WHERE NAME = 'Loja'
OR Population > 10000

-- --------------------------------------
-- WHERE statement
-- --------------------------------------
