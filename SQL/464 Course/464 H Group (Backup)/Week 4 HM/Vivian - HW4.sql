#1a
use employees;

select A.emp_no, e1.first_name, e1.last_name, A.dept_no, A.from_date, 
B.emp_no, e2.first_name, e2.last_name, B.dept_no, B.from_date
from dept_emp A
inner join employees e1
on A.emp_no = e1.emp_no,
dept_emp B 
inner join employees e2
on B.emp_no = e2.emp_no
where (A.from_date = B.from_date or A.from_date = B.from_date + 1 or A.from_date = B.from_date - 1)
and A.dept_no = B.dept_no
and A.emp_no > B.emp_no
order by A.dept_no, A.from_date, A.emp_no asc;



#1b Find the supervisor (dept_manager) who has had the most number of employees reporting to him/her (2 pts)

select * from dept_manager;

select m.dept_no, m.emp_no, first_name, last_name, m.from_date, count(e.emp_no - 1) as NumofEmps
from dept_manager m
inner join dept_emp d
on m.dept_no = d.dept_no
inner join employees e
on m.emp_no = e.emp_no
group by m.from_date, dept_no
order by NumofEmps desc;

#2a Identify the movies that have never been rented

use db_vphan;
create table rental 
as select * from sakila.rental;

create table inventory 
as select * from sakila.inventory;

create table film
as select * from sakila.film;

select * from film
where film_id not in (select f.film_id
from film f
inner join inventory i
on f.film_id = i.film_id
inner join rental r
on i.inventory_id = r.inventory_id)
order by film_id;

#2b Write a query that finds, for each customer,
#other customers who have rented atleast one movie in common with X

create table customer 
as select * from sakila.customer;

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

#Order the results by the number of overlapping movies

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