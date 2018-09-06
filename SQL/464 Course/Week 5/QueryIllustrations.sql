## Creating a label for a row
use sakila;
select 'cat' as keyword, count(R.Rental_id) as RentalVolume
from rental R, film F, inventory I
where F.film_id=I.film_id AND R.inventory_id=I.inventory_id AND F.description LIKE '%cat%'
Union
select 'boy', count(R.Rental_id)
from rental R, film F, inventory I
where F.film_id=I.film_id AND R.inventory_id=I.inventory_id AND F.description LIKE '%boy%'
Union
select 'drama', count(R.Rental_id)
from rental R, film F, inventory I
where F.film_id=I.film_id AND R.inventory_id=I.inventory_id AND F.description LIKE '%drama%';


## Using CASE in SQL
select * from 
(
select 'cat' as Description, count(*) as NumRentals
from film f, inventory i, rental r
where f.film_id = i.film_id
and r.inventory_id = i.inventory_id 
and f.description like '% cat%'

union 
select 'boy' as Description, count(*) as NumRentals
from film f, inventory i, rental r
where f.film_id = i.film_id
and r.inventory_id = i.inventory_id 
and f.description like '% boy%'
union
select 'drama' as Description, count(*) as NumRentals
from film f, inventory i, rental r
where f.film_id = i.film_id
and r.inventory_id = i.inventory_id 
and f.description like '% drama%'
) as x
order by NumRentals desc;
#LIMIT 1;


SELECT 
    category, COUNT(*) AS count
FROM
    (SELECT 
        film.film_id,
            description,
            CASE
                WHEN description REGEXP 'cat' THEN 'cat'
                WHEN description REGEXP 'boy' THEN 'boy'
                WHEN description REGEXP 'drama' THEN 'drama'
            END AS category
    FROM
        film, inventory, rental
    WHERE
        film.film_id = inventory.film_id
            AND inventory.inventory_id = rental.inventory_id
            AND description REGEXP 'cat|boy|drama') AS RentalCount
GROUP BY category
ORDER BY count DESC;
#Highest rental volume is "Drama".






#a)	Consider the data model for data about donations. (10 pts)
#Donor: donorid (PK), dlname, dfname, dphone, dstate, dcity
#Gift: donorid (PK, FK), year (PK, FK), amount
#Year: year(PK), yeargoal

# iii.	List only those donors (last and first names) 
# who gave more in year 2000 than they did in 1999

select dfname, dlname
from gift as g1, gift as g2, donor as d
where g1.year = 2000
and g2.year = 1999 
and g1.donorno = g2.donorno
and g1.donorno = d.donorno
and g1.amount > g2.amount;


select distinct dlname, dfname
from donor as d, gift as g 
where d.donorno = g.donorno
and exists (select amount from gift as g1 where year = '2000'
and amount > 
(select amount from gift as g2 
where year = '1999' and g1.donorno = g2.donorno) and g.donorno = g1.donorno); 


## Find customers who have ordered “Birch” and 
## also where among the top 3 among all customers 
## in terms of purchase volume ($) 
use bigpvfc;
Select c.customerID, productfinish, sum(p.productstandardprice*ol.orderedquantity) as PurchaseVolume
from customer_t c, product_t p, orderline_t ol, order_t o
where c.customerID = o.CustomerID
and p.ProductID = ol.ProductID
and o.orderID = ol.OrderID
and ProductFinish REGEXP 'Birch|birch'
Group by c.CustomerID, productfinish
Order by PurchaseVolume DESC
Limit 10;

Select c.customerID, productfinish, sum(p.productstandardprice*ol.orderedquantity) as PurchaseVolume
from customer_t c, product_t p, orderline_t ol, order_t o
where c.customerID = o.CustomerID
and p.ProductID = ol.ProductID
and o.orderID = ol.OrderID
and C.customerid in (select customerid from 
product_t p1, orderline_t ol1, order_t o1  
where p1.ProductID = ol1.ProductID
and o1.orderID = ol1.OrderID
and  ProductFinish REGEXP 'Birch|birch')
Group by c.CustomerID, productfinish
Order by PurchaseVolume DESC
Limit 10;
