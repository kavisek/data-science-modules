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


# Date and Time Functions 
-- All Time are in UTC

SELECT DATETIME('now');

--
SELECT DATE('now');

--
SELECT TIME('now');

--
SELECT DATETIME('now', '+1 day');

--
SELECT DATETIME('now', '+3 days');

--
SELECT DATETIME('now', '-1 month');

--
SELECT DATETIME('now', '+3 hours','+27 minutes', '-1 day', '+3 years');

#### Aggerate Datay

# Aggerate Data
SELECT COUNT(*) FROM Country;

--
SELECT Region, Count(*) FROM Country
GROUP BY Region;

--
SELECT Region, Count(*) AS COUNT FROM Country
GROUP BY Region
ORDER BY Count DESC, Region;

--
SELECT 
	a.title AS Album,
	 COUNT(t.track_number) as Tracks
FROM trakcs as t
INNER JOIN album as a
	ON a.id = t.ablum_id
GROUP BY a.id
ORDER BY Tracks DESC, Album	

--
SELECT 
	a.title AS Album,
	 COUNT(t.track_number) as Tracks
FROM trakcs as t
INNER JOIN album as a
	ON a.id = t.ablum_id
GROUP BY a.id
HAVING Tracks >= 10
ORDER BY Tracks DESC, Album	

--
SELECT 
	a.title AS Album,
	 COUNT(t.track_number) as Tracks
FROM trakcs as t
INNER JOIN album as a
	ON a.id = t.ablum_id
WHERE a.artist = 'The Beatles'
GROUP BY a.id
HAVING Tracks >= 10
ORDER BY Tracks DESC, Album	

--
SELECT COUNT(*) FROM Country;

--
SELECT COUNT(Population) FROM Country; #!! Counts only Not null values

-- 
SELECT AVG(Population) FROM Country;

--
SELECT AVG(Population) FROM Country GROUP BY Region;

--
SELECT MIN(Population), MAX(Population) FROM Country GROUP BY Region;

--
SELECT SUM(Population) FROM Country GROUP BY Region;

# Distinct Aggregation
SELECT COUNT(HeadofState) FROM Country ORDER BY HeadofState;

--
SELECT COUNT(DISTINCT(HeadofState)) FROM Country ORDER BY HeadofState;

#### Transactions 

# Using Transactions
BEGIN TRANSACTION;
	INSERT INTO widegtSales(inv_id, quan, price) VALUES (1, 5, 500);
	UPDATE widegtInventory SET onhand = (onhand - 5) WHERE id = 1;
END TRANSACTION

SELECT * FROM widegtInventory;
SELECT * FROM widegtSales

--
BEGIN TRANSACTION;
	INSERT INTO widegtInventory( description, onhand) VALUES ('toy', 25);
ROLLBACK;


SELECT * FROM widegtInventory;
SELECT * FROM widegtSales

--
DROP TABLE widegtInventory;
DROP TABLE widegtSales


-- Using Transaction clauses for a shit ton of inserts are way faster

#### Triggers

# Understanding a table of triggers
CREATE TRIGGER newWigetsSale AFTER INSERT ON widegtSales
	BEGIN
		UPDATE widegtCustomer SET last_order_id = NEW.id WHERE widegtCustomer.id = NEW.customer_id;
	END;


# Preventing automatic updates with a trigger
CREATE TRIGGER updateWigetSale BEFORE UPDATE ON widegtSales;
	BEGIN
		SELECT RAISE(ROLLBACK, 'cannot update table "widegtSale"' FROM widegtSale
			WHERE id = NEW.id AND reconciled = 1;
	END
;


--
BEGIN TRANSACTION;
UPDATE widegtSale SET quan = 9 WHERE id = 2;
END TRANSACTION;
SELECT * FROM widegtSale;

# Creating Timestamps via Trigger 
CREATE TRIGGER stampSale AFTER INSERT on widegtSale;
	BEGIN
		UPDATE widegtSale SET stamp = DATETIME('now') WHERE id=NEW.id;
		UPDATE widegtCustomer SET last_order_id = NEW.id, stamp = DATETIME('now')
			WHERE widegtCustomer.id = NEW.customer_id;
		INSERT INTO widegtLog (stamp, event, username, tablename, table_id)
			VALUES (DATETIME('now'), 'INSERT','TRIGGER','widegtSale',NEW.id);
	END
 
#### Subselects and Views

# A simple subselect
SELECT 
	SUBSTR(a, 1, 2) AS State, 
	SUBSTR(a, 3) AS SCode,
	SUBSTR(b, 1, 2) AS Country, 
	SUBSTR(b, 3) AS CCode
FROM t


--
SELECT co.Name, ss.CCode FROM(
			(SELECT 
				SUBSTR(a, 1, 2) AS State, 
				SUBSTR(a, 3) AS SCode,
				SUBSTR(b, 1, 2) AS Country, 
				SUBSTR(b, 3) AS CCode
			FROM t) AS ss
	INNER JOIN Country AS co ON co.Code2 = ss.Country

--
DROP TABLE t;

# Searching within a result set
SELECT album_id FROM track WHERE duration <= 90;
	SELECT DISTINCT album_id FROM track WHERE duration <= 90
);

--
SELECT a.title AS album, a.artist, t.track_number AS Seq, t.title, t.duration AS secs
	FROM album AS a
	INNER JOIN as t
		ON t.album_id = a.id
	WHERE a.id IN (SELECT DISTINCT ablum_id FROM track WHERE duration <= 90)
	ORDER BY a.title, t.track_number
;

# Creating a view
SELECT id, ablum_id, title, track_number, duration / 60 AS m

--
CREATE VIEW trackView 
SELECT id, ablum_id, title, track_number, duration / 60 AS m


--
SELECT a.title AS album, artist, t.track_number AS seq, t.title, t.m, t.s
FROM album as a
INNER JOIN trackView as t
	ON t.album_id = a.id
ORDER BY a.title, t.track_number
;
--
DROP VIEW trackView;

# Creating a joined view
SELECT a.artist AS artist,
	a.title as album,
	t.title as track, 
	t.track_number as trackno,
	t.duration / 60 AS m,
	t.duration  % 60 AS s
FROM track as t
	INNER JOIN album as a
		ON a.id = t.album_id
;
SELECT * FROM joinedAlbum WHERE artist = 'Jimi Hendrix';


--
SELECT artist, album, track, trackno,
	m|| ':' || CASE WHEN s < 10 THEN "0" || s ELSE s END AS duration
	FROM joinedAlbum;

--
DROP VIEW joinedAlbum;

#### CRUD Applications
-- create, read, update, delete






















































