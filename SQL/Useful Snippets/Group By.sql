select customer_t.CustomerName, customer_t.CustomerAddress, Count(orderid) as NumberOrdered
from order_t
inner join customer_t on Order_t.CustomerID=Customer_t.CustomerID
group By CustomerName;


select customer_t.CustomerName, customer_t.CustomerAddress, Count(orderid) as NumberOrdered
from order_t
inner join customer_t on Order_t.CustomerID=Customer_t.CustomerID
group by CustomerName
having count(orderid) >2;


set @runningtotal :=0;
select ordernew.Orderdate,
(@runningtotal := @runningtotal + ordernew.count) as Running_Total
From
	(select count(orderid) as count, Orderdate
	from order_t group by orderdate) as ordernew
	order by orderdate;


#Grouping By Experssions

select
	film.film_id, 
	title, 
	description, 
	count(distinct rental_id) as TimesRented
from film
inner join inventory
	on film.film_id = inventory.film_id
inner join rental
	on inventory.inventory_id = rental.inventory_id
where description regexp 'cat' or description regexp 'boy' or description regexp 'drama' 
group by description regexp 'cat', description regexp 'boy', description regexp 'drama' 
order by TimesRented desc


select
	film.film_id, 
	title, 
	description, 
	count(distinct rental_id) as TimesRented
from film
inner join inventory
	on film.film_id = inventory.film_id
inner join rental
	on inventory.inventory_id = rental.inventory_id
where description regexp 'cat' or description regexp 'boy' or description regexp 'drama' 
group by film. film_id
order by TimesRented desc