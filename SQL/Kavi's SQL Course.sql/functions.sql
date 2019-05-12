-- ------------------------------------------------------------------------------
-- Author: Kavi Sekhon
-- Date: May 2019
-- Purpose: Some SQL code to learn the basic of SQL
-- ------------------------------------------------------------------------------

-- --------------------------------------
-- MAX Function
-- --------------------------------------

SELECT MAX(Population) FROM city;


-- --------------------------------------
-- MIN Function
-- --------------------------------------

SELECT MIN(Population) FROM city;



-- --------------------------------------
-- AVG Function
-- --------------------------------------

SELECT AVG(Population) FROM city;


-- --------------------------------------
-- AVG Function
-- --------------------------------------

SELECT AVG(Population) FROM city;


-- --------------------------------------
-- ABS Function
-- --------------------------------------

SELECT ABS(AVG(Population) - MAX(Population)) FROM city;


-- --------------------------------------
-- Length Function
-- --------------------------------------

SELECT LENGTH(Name) FROM city;


-- --------------------------------------
-- CONCAT Function
-- --------------------------------------

SELECT CONCAT(Name, District) FROM city;



-- --------------------------------------
-- LEFT Function
-- --------------------------------------

SELECT LEFT(NAME, 3) FROM city;


-- --------------------------------------
--  Replace Function
-- --------------------------------------

-- replace whole strings
SELECT REPLACE(NAME, 'Kabul', 'Test') FROM city;
-- Replacing substring
SELECT REPLACE(NAME, 'a', 'i') FROM city;


-- --------------------------------------
-- SUBSTRING Function
-- --------------------------------------

-- SUBSTRING(FEATURE, Start Index, String Lenght)
SELECT SUBSTRING(NAME, 2, 20) FROM city;
