 # Select Statement 
SELECT *  FROM Country:

-- 
SELECT *  FROM Country AS 'Life Expectancy' ORDER BY Name:

-- 
SELECT 'Hello World';

--
SELECT 1 + 2;

-- 
SELECT Count(*) FROM Country;

# Selecting Rows
SELECT Name, Continent, Region FROM Country;

-- 
SELECT Name, Continent, Region FROM Country
WHERE Continent='Europe'
LIMIT 5;

# Selecting columns
SELECT * FROM Country ORDER BY Code LIMIT 5;

--
SELECT Name AS Country, Continent AS ISO, Region, Population AS Pop FROM Country ORDER BY Code LIMIT 5;

--
SELECT Name Country, Continent ISO, Region, Population Pop FROM Country ORDER BY Code LIMIT 5;

# Counting Row
SELECT Count(*) FROM Country;

--
SELECT Count(*) FROM Country WHERE Population > 100000000 AND Continent = 'Europe';

# Inserting Data
INSERT INTO Customer (Name, address, city, state, zip) VALUES ('Fred Flinstone','123 Cobblestone Way', 'Bedrock','CA','91234');
SELECT * FROM Customer;

--
INSERT INTO Customer (Name, city, state) VALUES ('Jimi Hendrix','Renton','WA');
SELECT * FROM Customer

# Updating data
UPDATE Customer SET address = '123 Music Avenue', Zip ='98056' WHERE id = 5;
SELECT * FROM Customer;

-- 
UPDATE Customer SET address = '2603 S Washington Street', Zip ='98056' WHERE id = 5;
SELECT * FROM Customer;

--
UPDATE Customer SET address = '2603 S Washington Street', Zip = Null  WHERE id = 5;
SELECT * FROM Customer;

# Deleting Rows in the Table
DELETE * FROM Customer WHERE id=4;
SELECT * FROM Customer;

--
DELETE * FROM Customer WHERE id=5;
SELECT * FROM Customer;

##### Chapter 2

# Creating Tables
CREATE TABLE test (
	a INTEGER
	b TEXT
);

INSERT INTO test VALUES (1, 'a');
INSERT INTO test VALUES (2, 'b');
INSERT INTO test VALUES (3, 'c');

SELECT * FROM test;

# Deleting a table with DROP TABLE
CREATE TABLE test (a TEXT, b TEXT);
INSERT INTO test VALUES ('one','two');

DROP TABLE test;

SELECT * FRom test; #Select table will fail

--
CREATE TABLE test (a TEXT, b TEXT);
INSERT INTO test VALUES ('one','two');

DROP TABLE test;
DROP TABLE IF EXISTS test;

SELECT * FRom test; #Select table will fail


# Inserting rows into a table
CREATE TABLE test (a INTEGER, b TEXT, c TEXT);
SELECT * FROM test;

INSERT INTO test VALUES (1, 'This', 'Right Here');
SELECT * FROM test;

-- 
CREATE TABLE test (a INTEGER, b TEXT, c TEXT);
SELECT * FROM test;

INSERT INTO test (b, c)VALUES ('This', 'Right Here');
SELECT * FROM test;

-- 
CREATE TABLE test (a INTEGER, b TEXT, c TEXT);
SELECT * FROM test;

INSERT INTO test (a, b, c) SELECT id, Name, description FROM item;
SELECT * FROM test;

# Deleting rows from table
DELETE FROM test WHERE a =3;
SELECT * FROM test;

# Understanding Null
SELECT * FROM test WHERE a IS NULL;

-- 
SELECT * FROM test WHERE a IS NOT NULL

--
DROP TABLE IF EXISTS test;
CREATE TABLE test (
	a INTEGER NOT NULL,
	b INTEGER NOT Null,
	c TEXT)
);

INSERT INTO test (b ,c ) VALUES (1, 'two');
SELECT * FROm test;

-- 
DROP TABLE test;

# Controlling column behaviours with constraints
CREATE TABLE test( a TEXT, b TEXT, c TEXT );
INSERT INTO test (a, b) VALUES ('one','two');
SELECT * FROM test;

--
CREATE TABLE test( a TEXT, b TEXT, c TEXT DEFAULT 'panda');
INSERT INTO test (a, b) VALUES ('one','two');
SELECT * FROM test;

--
CREATE TABLE test( a TEXT, b TEXT UNIQUE, c TEXT DEFAULT 'panda');
INSERT INTO test (a, b) VALUES ('one','two');
INSERT INTO test (a, b) VALUES ('seven','two');
SELECT * FROM test;

--
CREATE TABLE test( a TEXT, b TEXT UNIQUE, c TEXT DEFAULT 'panda');
INSERT INTO test (a, b) VALUES (NUll, 'two');
INSERT INTO test (a, b) VALUES (NULL,'two');
SELECT * FROM test;

--
CREATE TABLE test( a TEXT, b TEXT UNIQUE NOT NULL, c TEXT DEFAULT 'panda');
INSERT INTO test (a, b) VALUES (NUll, 'two');
INSERT INTO test (a, b) VALUES (NULL,'two');
SELECT * FROM test;


#  Changing a schema with ALTER
CREATE TABLE test (a TEXT, b TEXT, c TEXT);
INSERT INTO test VALUES ('one','two','three');
INSERT INTO test VALUES ('two','three','four');
INSERT INTO test VALUES ('three','four','five');
SELECT * FROM test;

ALTER TABLE test ADD d TEXT;
SELECT * FROM test;

--
CREATE TABLE test (a TEXT, b TEXT, c TEXT);
INSERT INTO test VALUES ('one','two','three');
INSERT INTO test VALUES ('two','three','four');
INSERT INTO test VALUES ('three','four','five');
SELECT * FROM test;

ALTER TABLE test ADD d TEXT DEFAULT 'panda';

-- 
DROP TABLE test;


# CREATING an ID COLUMN
CREATE TABLE test (
	id INTEGER PRIMARY KEY, 
	a INTEGER, b TEXT
);

INSERT INTO test VALUES (10, 'a';
INSERT INTO test VALUES (11, 'b';

# Filtering Data with WHERE, LIKE, and IN
SELECT Name, Continent, Population
FROM Country
WHERE Population < 100000 
ORDER BY Population DESC;

-- 
SELECT Name, Continent, Population
FROM Country
WHERE Population < 100000  OR Population IS NULL
ORDER BY Population DESC;

--
SELECT Name, Continent, Population
FROM Country
WHERE Population < 100000  AND Continent = 'Oceania'
ORDER BY Population DESC;

--
SELECT Name, Continent, Population
FROM Country
WHERE Name LIKE '%island%' # All the records with island in their Name
ORDER BY Name

--
SELECT Name, Continent, Population
FROM Country
WHERE Name LIKE '%island' # All the records with island as the last word in the string
ORDER BY Name

--
SELECT Name, Continent, Population
FROM Country
WHERE Name LIKE '%island' # All the records that start with island


--
SELECT Name, Continent, Population
FROM Country
WHERE Name LIKE '_a%' # Match by, anything as the first character, an 'a' as the Second character, and then the rest of the string

--
SELECT Name, Continent, Population
FROM Country
WHERE Continent IN {'Europe','Asia'} # IN Matches valuse in a list or sub selects
ORDER BY Continent

# Selecting Duplicates with SELECT DISTINCT
SELECT Continent from Country;

--
SELECT DISTINCT Continent from Country;

--
CREATE TABLE test(
	a INTEGER
	b INT);
INSERT INTO test VALUES (1,1);
INSERT INTO test VALUES (2,1);
INSERT INTO test VALUES (3,1);
INSERT INTO test VALUES (4,1);
INSERT INTO test VALUES (5,1);
INSERT INTO test VALUES (1,2);
INSERT INTO test VALUES (1,2);
INSERT INTO test VALUES (1,2);
INSERT INTO test VALUES (1,2);
INSERT INTO test VALUES (1,2);

SELECT DISTINCT a FROM tset;
SELECT * FROM test;

--
SELECT DISTINCT b FROM tset;
SELECT * FROM test;

--
SELECT DISTINCT a,b FROM tset;
SELECT * FROM test;

--
DROP TABLE test;

# Sorting by ORDER BY
SELECT Name from Country;

--
SELECT Name from Country ORDER BY Name;

-- 
SELECT Name from Country ORDER BY Name DESC;

-- 
SELECT Name from Country ORDER BY Name ASC;

--
SELECT Name, Continent from Country ORDER BY Continent;

--
SELECT Name, Continent from Country ORDER BY Continent, Name;

--
SELECT Name, Continent, Region from Country ORDER BY Continent DESC, Region, Name;

# Conditional Experssions with CASE

CREATE TABLE  booltest (a INTEGER, b INTEGER);
INSERT INTO booltest (1,0);
SELECT * FROM booltest;

--
SELECT * FROM booltest;
SELECT
	CASE WHEN a Then 'true' ELSE 'false' END AS boolA,
	CASE WHEN b Then 'true' ELSE 'false' END AS boolB,
	FROM booltest;

--
SELECT * FROM booltest;
SELECT
	CASE a WHEN 1 Then 'true' ELSE 'false' END AS boolA,
	CASE b WHEN 1 Then 'true' ELSE 'false' END AS boolB,
	FROM booltest;v


--
DROP TABLE test

# Accessting related Table with Join (Missing)
SELECT * FROM left;
SELECT * FROM right;

-- 
SELECT l.description as left, r.description as right
	FROM left as l
	JOIN right as r
		ON l.id - r.id;

--
SELECT l.description as left, r.description as right
	LEFT FROM left as l
	JOIN right as r
		ON l.id - r.id;

--
DROP TABLE left;
DROP TABLE right;

#Using Related Tables
SELECT * FROM Customers;
SELECT * FROM item;
SELECT * FROM sales;


-- 
SELECT 
	c.name AS Cust, 
	i.name AS Item, 
	s.price as Price 
FROM Customers AS c
INNER JOIN sale AS s 
	ON s.customer_id = c.id
INNER JOIN item as i
	ON s.item_id = i.id
ORDER BY Cust, Item
;

-- 
INSERT INTO customer (name) VALUES ('Jane Smith')
SELECT 
	c.name AS Cust, 
	i.name AS Item, 
	s.price as Price 
FROM Customers AS c
LEFT JOIN sale AS s 
	ON s.customer_id = c.id
LEFT JOIN item as i
	ON s.item_id = i.id
ORDER BY Cust, Item
;


--
SELECT * FROM customer

--
DELETE FROM customer WHERE id = 4

#### Strings

# Finding the length of a string
SELECT LENGTH('string');

-- 
SELECT Name, LENGTH(Name) AS Len FROM CITY BY Len DESC, Names;
 
# Selecting a Part of String
SELECT SUBSTR('this string',6);

--
SELECT * FROM album;

-- 
SELECT 
	released, 
	SUBSTR(released, 1, 4, ) AS year,
	SUBSTR(released, 6, 2, ) AS month,
	SUBSTR(released, 9, 2) AS day, 
FROM album
ORDER BY released;

# Trim Function
SELECT '	string    ';


--
SELECT TRIM('   string   ');

--
SELECT LTRIM('    string    ');

--
SELECT RTRIM('    string    ');

--
SELECT TRIM('...string ...', '.');


# Upper and Lower Case
SELECT 'StRiNG' = 'string'; #This will be false

--
SELECT Lower('StRiNG') = 'string'; #True

--
SELECT Lower('StRiNG') = Lower('string'); #True

--
SELECT Upper('StRiNG') = Upper'string'); #True

--
SELECT Upper(Name) FROM City ORDER BY Name;

--
SELECT Lower(Name) FROM City ORDER BY Name;

# Finding Type of Value
SELECT (1 + 1.0);

--
SELECT TYPEOF(1 + 1.0);

--
SELECT TYPEOF(1);

--
SELECT TYPEOF('string');

--
SELECT TYPEOF('string' + 'pandas'); #This is an integar

--
SELECT 1 / 2;

--
SELECT 1.0 / 2;

--
SELECT CAST(1 AS REAL) / 2;

-- 
SELECT 17/5;

--  
SELECT 17/5, 17 % 5;

# Round Function
SELECT ROUND (2.55555);

--
SELECT ROUND (2.55555, 3);

--
SELECT ROUND (2.55555, 6);


# Date and Times
# All datebase times are in UTC

# 































































