#1a) Find the products which use the maximum quantity of materials in terms of quantity required (list only the top 3). (use tables: product_t, uses_t, rawmaterial_t).

use bigpvfc;
select 
	product_t.productid,
	productdescription,
	sum(quantityRequired) as maxiumQuantityRequired
from product_t
inner join uses_t
	on product_t.productid = uses_t.prodid
inner join rawmaterial_t
	on uses_t.materialid = rawmaterial_t.materialid
group by product_t.productid 
order by maxiumQuantityRequired desc
limit 3;

#1b) Find all the customers who have either ordered “Cherry” or “Birch” finish (Hint: set operations). (use tables: customer_t, order_t, orderline_t, product_t)

use bigpvfc;
select
	customer_t.customerid, 
	customername, 
	productfinish
from customer_t
inner join order_t
	on customer_t.customerid = order_t.customerid
inner join orderline_t
	on order_t.orderid = orderline_t.orderid
inner join product_t
	on orderline_t.productid = product_t.productid
where productfinish regexp 'cherry' or productfinish regexp 'birch'
group by customer_t.customerid


#Assuming you want output based on each product order, becaure each firm is able to ordes multigple products with the finishes


#1c) Find customers who have ordered “Birch” and also where among the top 3 in terms of purchase volume ($)

use bigpvfc;
select
	customer_t.customerid, 
	customername, 
	productfinish,
	sum(ProductStandardPrice*orderedQuantity) as PuchaseVolume
from customer_t
inner join order_t
	on customer_t.customerid = order_t.customerid
inner join orderline_t
	on order_t.orderid = orderline_t.orderid
inner join product_t
	on orderline_t.productid = product_t.productid
where productfinish regexp 'birch'
group by customer_t.customerid
order by PuchaseVolume desc
limit 3;

#2a) Find the top 3 actors who have acted in the most number of film categories. (use tables: actor, film_actor, film_category)


use sakila;
select
	actor.actor_id,
	actor.first_name, 
	actor.last_name,
	count(distinct category_id) as numberOfCategories
from actor
inner join film_actor
	on actor.actor_id = film_actor.actor_id
inner join film_category
	on film_actor.film_id = film_category.film_id
group by actor.actor_id
order by numberOfCategories desc
limit 3;


#2b) Calculate the total amount ($) of all transactions for each of the top 100 customers in terms of the total amount (tables: customer, payment).

use sakila;
select
	customer.customer_id,
	first_name,
	last_name,
	sum(payment.amount) as TotalAmount
from sakila.customer
inner join payment
	on customer.customer_id = payment.customer_id
group by customer.customer_id
order by TotalAmount desc
limit 100;

#2c) Compute the total number of rentals for movies that have the following words in its description ‘cat’, ‘boy’, ‘drama’. Which of these three categories have the highest rental volume? (tables: rental, film, inventory).

--> We have included 2 queries to show the steps to our answer

---> Partial Answer

use sakila;
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

# ----> Complete Answer


use sakila;
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


#this query lists the number of times the 3 categories appear and thier correspondint categories, and 3 additional categories where the 2 out of the 3 orginal categories are shown in diffent combinations.
#drama shows up the most with 1459 exclusive results and 1631 total results






