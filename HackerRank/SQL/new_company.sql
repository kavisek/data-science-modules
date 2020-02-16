-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.


SELECT * FROM COMPANY
SELECT * FROM LEAD_MANAGER
SELECT * FROM SENIOR_MANAGER
SELECT * FROM MANAGER
SELECT * FROM EMPLOYEE


SELECT EMPLOYEE.company_code
  , founder
  , COUNT(DISTINCT lead_manager_code)
  , COUNT(DISTINCT senior_manager_code)
  , COUNT(DISTINCT manger_code)
  , COUNT(DISTINCT employee_code)
FROM EMPLOYEE
LEFT JOIN COMPANY ON COMPANY.company_code = EMPLOYEE.company_code
GROUP BY company_code, founder
ORDER BY company_code ASC;


-- founder name
-- total lead managers
-- total number of senior managers
-- total number of mangers
-- totla number employees

-- order by ascenidng company code
