# Create Database

CREATE DATABASE books;

# Select Database 

USE books;

# Import the Data

CREATE TABLE booksales ( 
  country VARCHAR(35), genre ENUM('fiction','non-fiction'), year YEAR, sales INT);

INSERT INTO booksales VALUES
  ('Senegal','fiction',2014,12234), ('Senegal','fiction',2015,15647),
  ('Senegal','non-fiction',2014,64980), ('Senegal','non-fiction',2015,78901),
  ('Paraguay','fiction',2014,87970), ('Paraguay','fiction',2015,76940),
  ('Paraguay','non-fiction',2014,8760), ('Paraguay','non-fiction',2015,9030);

 # Sample 1

 SELECT year, SUM(sales) FROM booksales GROUP BY year;

# Sample Rollup 1

SELECT year, SUM(sales) FROM booksales GROUP BY year WITH ROLLUP;

# Sample 2
SELECT country, year, genre, SUM(sales) 
  FROM booksales GROUP BY country, year, genre;

# Sample Rollup 2

SELECT country, year, genre, SUM(sales) 
  FROM booksales GROUP BY country, year, genre WITH ROLLUP;
