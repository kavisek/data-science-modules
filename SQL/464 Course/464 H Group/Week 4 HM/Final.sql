#Database: ‘employees’. Copy/paste your answers to the queries below after testing that they work. See the Appendix next page for further instructions.



#1a) Find employee (pairs) who have been posted in the same department at the same time (with atleast 1 day of overlap). (2 pts)
 

use employees;
select A.dept_no, A.emp_no, e1.first_name, e1.last_name,  A.from_date, 
B.dept_no,B.emp_no, e2.first_name, e2.last_name,  B.from_date
from dept_emp A
inner join employees e1
on A.emp_no = e1.emp_no,
dept_emp B 
inner join employees e2
on B.emp_no = e2.emp_no
where (A.from_date = B.from_date or A.from_date = B.from_date + 1 or A.from_date = B.from_date - 1)
and A.dept_no = B.dept_no
and A.emp_no < B.emp_no
order by A.dept_no, A.from_date, A.emp_no asc;
#find pairs that have the same from date =/- 1 , and are in the same deparment

 
#1b) Find the supervisor (dept_manager) who has had the most number of employees reporting to him/her (2 pts).
 
 
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
order by NumberOfEmployees desc;


#1c) Identify three different queries that you would want to ask as a manager using the employees data (including the salaries table). You do not need to write the actual queries – just the business context surrounding them. (2 pts)


	# 1) We are hiring a new Department Manager and need to know what the range of salaries that we offered our current department managers, so we can anchor our offered salary for the new manager
	# 2) We are moving forward with layoffs and need to know which departments have the largest salary cost, please rank them from highest to lowest
	# 3) Please provide a report with the average salary for all our job positions (use "title")


#Copy the necessary tables from ‘sakila’ database to db_<yoursfuusername> database. Understand the data model by examining the referential integrity constraints. Copy/paste your answers to the queries below after testing that they work.

#2a) Identify the movies that have never been rented. (2 pts)

use db_vphan;
create table rental 
as select * from sakila.rental;

create table inventory 
as select * from sakila.inventory;

create table film
as select * from sakila.film;

select
	film_id,
	title
from film 
where film_id not in 
	(select 
	distinct (film_id)
	from inventory as i
	inner join rental as r
	on i.inventory_id = r.inventory_id);


#2b) Write a query that finds, for each customer, other customers who have rented atleast one movie in common with X. Order the results by the number of overlapping movies (2 pts).


create table customer 
as select * from sakila.customer;

# Step 1: Answer in Progesss


use sakila;
select c.customer_id, first_name, last_name, f.film_id, f.title
from customer c
inner join rental r
on c.customer_id = r.customer_id
inner join inventory i
on r.inventory_id = i.inventory_id
inner join film f
on i.film_id = f.film_id, 
(select c.customer_id, f.film_id, f.title
from customer c
inner join rental r
on c.customer_id = r.customer_id
inner join inventory i
on r.inventory_id = i.inventory_id
inner join film f
on i.film_id = f.film_id) as x
where x.film_id = f.film_id;

# Step 2: [Final Answer]  Order the results by the number of overlapping movies

select f.film_id, f.title, count(f.film_id) as NumofOverlapping
from customer c
inner join rental r
on c.customer_id = r.customer_id
inner join inventory i
on r.inventory_id = i.inventory_id
inner join film f
on i.film_id = f.film_id, 
(select c.customer_id, f.film_id, f.title
from customer c
inner join rental r
on c.customer_id = r.customer_id
inner join inventory i
on r.inventory_id = i.inventory_id
inner join film f
on i.film_id = f.film_id) as x
where x.film_id = f.film_id
group by f.title
order by NumofOverlapping desc;




















