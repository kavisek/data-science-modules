# After completd Lynda's SQL For Data Science course. 
# I have logged some cool queries I saw in the course
# Some queries may be PostgresSQL specific

# Sum Query
SELECT orderDate, SUM(SalesAmount)
FROM FactInternetSales
GROUP BY orderDate;

# Like Wildcard Query
SELECT department, SUM(salary)
FROM staff
WHERE department LIKE 'B%y'
GROUP BY department;

# Similiar To, Wildcard Query 2
SELECT job_title
FROM staff
WHERE job_title SIMILAR TO '%Assistant%(III|IV)'

# Select * from only one table
SELECT s.*, cd.company_division
FROM staff s
LEFT JOIN company_division cd
	ON s.department = cd.department

# Rollup Query
SELECT company_region, country, count(*)
FROM staff_div_reg_country
GROUP BY ROLLUP (country, company_region)
ORDER BY country, regions

# Cube Query
SELECT company_region, country, count(*)
FROM staff_div_reg_country
GROUP BY CUBE (country, company_region)
ORDER BY country, regions

# Fetch Query Aggregation at the Order by Level
SELECT last_name, job_title, salary
FROM staff
ORDER BY salary DESC
FETCH FIRST
	10 ROWS ONLY


# Over, Partition, Sum Query
SELECT 
	department, 
	last_name, 
	salary,
	MAX(salary) OVER (PARTITION BY department)
FROM
	staff

# Over, Partition, First Value Query
SELECT 
	department, 
	last_name, 
	salary,
	FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY last_name)
FROM
	staff


# Lag Query
SELECT 
	department, 
	last_name, 
	salary,
	LAG(salary) OVER (PARTITION BY department ORDER BY salary DESC)
FROM
	staff

# Lead Query
SELECT 
	department, 
	last_name, 
	salary,
	LAG(salary) OVER (PARTITION BY department ORDER BY salary DESC)
FROM
	staff

# NTile Query
SELECT 
	department, 
	last_name, 
	salary,
	NTILE(4) OVER (PARTITION BY department ORDER BY salary DESC)
FROM
	staff




