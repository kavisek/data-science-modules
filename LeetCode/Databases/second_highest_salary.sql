# Write a SQL query to get the second highest salary from the Employee table.
# Write your MySQL query statement below


# My Original Solutions
SELECT IF(MIN(Salary) != MAX(Salary), MIN(Salary), NULL) AS SecondHighestSalary FROM(
    SELECT Salary
    FROm Employee
    ORDER BY Salary DESC
    LIMIT 2) dataset

# Best  Solution
SELECT COALESCE(MAX(Salary), NULL) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)
ORDER BY Salary DESC
