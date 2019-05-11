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

SELECT * FROM city LIMIT 10;

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
-- Craeting Columns in SLQ Query
-- --------------------------------------


SELECT NAME, COUNTRYCODE, 1 AS Numeric_Columns
FROM city;

SELECT NAME, COUNTRYCODE, 'City' AS String_Columns
FROM city;


-- --------------------------------------
-- Case Statment
-- --------------------------------------

SELECT *,
    CASE
      WHEN countrycode = 'AFG' THEN 1
      ELSE 0
    END AS Flag
FROM city

-- --------------------------------------
-- Cast Statement with Multiple Conditions
-- --------------------------------------

SELECT *,
    CASE
      WHEN countrycode = 'AFG' THEN 1
      WHEN countrycode = 'NLD' THEN 2
      ELSE 0
    END AS Flag
FROM city

-- --------------------------------------
-- Self WHERE Statment
-- --------------------------------------

SELECT * FROM city WHERE LENGTH(Name) > LENGTH(District)
