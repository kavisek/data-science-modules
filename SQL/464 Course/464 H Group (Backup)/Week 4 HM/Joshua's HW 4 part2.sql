#2a

SELECT title, film_id from film 
WHERE film_id NOT IN
(SELECT distinct(film_id) FROM inventory, 
rental where inventory.inventory_id = rental.inventory_id);

#b)	Write a query that finds, for each customer, 
#other customers who have rented atleast one movie in common with X. 
#Order the results by the number of overlapping movies (2 pts).

