use bigpvfc;

SELECT
	COUNT(*) as order_number 
FROM bigpvfc.order_t 
WHERE CustomerID = 2;

SELECT 
	MAX(rental_date) as max_date, 
	MIN(rental_date) as min_date 
FROM sakila.rental

SELECT 
	AVG(amount) AS avr_amount 
FROM sakila.payment;