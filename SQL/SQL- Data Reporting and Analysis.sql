# After completd Lynda's SQL: Data Reporting and Analysis course. 
# I have logged some cool queries I saw in the course

# Between Query
SELECT * FROM actor
WHERE actor_id BETWEEN 1 AND 5;

# Wildcard Query
SELECT * FROM actor
WHERE first_name LIKE 'JA%NE';

# Wildcard Query II
SELECT * FROM actor
WHERE first_name LIKE 'JOHN%';

# Concat Query
SELECT CONCAT(first_name, ' ', last_name)
FROM actor

# Concat with || Query
SELECT first_name || ' ' || last_name
FROM actor

# Locate Query
SELECT LOCATE('lope', first_name) FROM actor

# Table Schema Query
DESCRIBE actor

# Date Format Query
SELECT DATE_FORMAT(last_update, '%m-%d-%y')
FROM actor
WHERE DATE(last_update) = '2006-02-15'

# Date Format Query II
SELECT DATE_FORMAT(last_update, '%D %M %Y')
FROM actor

# SubQuery Assignment Query
SELECT f.fn from
(SELECT first_name as fn from actors) as f

# Group Names in List Query (Orginally a Subquery)
SELECT GROUP CONCAT(f.title ORDER BY f.title ASC SEPERATOR ', ') 
FROM ((film r INNER JOIN film_category fc on ((f.film_id = fc.film_id)))
INNER JOIN film_actor fa ON ((f.film_id = fa.film_id))) 