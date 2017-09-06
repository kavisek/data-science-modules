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