-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
--
-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

-- Answer
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;


-- Breakdowns
SELECT Salary FROM Employees;
SELECT REPLACE(Salary,'0','') FROM Employees;
SELECT AVG(REPLACE(Salary,'0','')) FROM Employees;


SELECT AVG(Salary) FROM Employees;
SELECT CEIL(AVG(Salary)) FROM Employees;

SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;
