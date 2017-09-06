Database: ‘employees’. Copy/paste your answers to the queries below after testing that they work. See the Appendix next page for further instructions.

a) Find employee (pairs) who have been posted in the same department at the same time (with atleast 1 day of overlap). (2 pts)
 

use employees;
select
	A.dept_no,
	A.emp_no,
	A.from_date,
	B.dept_no,
    B.emp_no,
    B.from_date
from dept_emp as A, dept_emp as B
where 
	(A.from_date = B.from_date 
	or A.from_date = B.from_date + 1
	or A.from_date = B.from_date - 1)
and A.dept_no = B.dept_no
and  A.emp_no < B.emp_no
order by A.dept_no, A.emp_no 

#find pairs that have the same from date =/- 1 , and are in the same deparment

 
b) Find the supervisor (dept_manager) who has had the most number of employees reporting to him/her (2 pts).
 
 
use employees;
select 
	M.from_date,
	M.dept_no,
    M.emp_no,
    N.first_name,
    N.last_name,
	count( E.emp_no - 1) as NumberOfEmployees
from dept_manager as M
inner join dept_emp as E
on M.dept_no = E.dept_no
inner join employees as N
on M.emp_no = N.emp_no 
group by M.from_date, dept_no





c) Identify three different queries that you would want to ask as a manager using the employees data (including the salaries table). You do not need to write the actual queries – just the business context surrounding them. (2 pts)


-
-
- 


Copy the necessary tables from ‘sakila’ database to db_<yoursfuusername> database. Understand the data model by examining the referential integrity constraints. Copy/paste your answers to the queries below after testing that they work.

a) Identify the movies that have never been rented. (2 pts)
 
select
	i.inventory_id = r.inventory_id
from inventory as i
inner join rental as r
	on i.inventory_id  = r.inventory_id


b) Write a query that finds, for each customer, other customers who have rented atleast one movie in common with X. Order the results by the number of overlapping movies (2 pts).

