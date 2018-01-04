
eslect
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

