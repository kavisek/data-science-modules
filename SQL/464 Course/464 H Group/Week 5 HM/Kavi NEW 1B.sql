Customer(custid (PK), firstname)
Rental (rentalid (PK), invid (FK), customerid (FK), dtMonth, dtYear, dtDay)
Inventory (invid (PK), filmid (FK))
Film (filmid (PK), length, name, cost, releaseMth, releaseYr)
Film_actor(filmid (PK FK), actorid (PK FK))
Actor (actorid (PK), actorname)
ActorTweet(actorid (PK FK), numMentions, monthyear (PK FK))

  #1B) Create the query that lists the actor, the total volume of rentals (number) during a month for all the movies that actor has acted in, the number of mentions for that actor on Twitter the previous month, and the total cost of making all those films he/she has acted in. Assume no film is released in January.


----- Answer -------

 select
	​​actor.actorid,
	​​actor.actorname,
	​​count(distinct(Rental.rentalid)), #This month
	​​ActorTweet.numMentions, #Previous Month
	​​sum(distinct(Film.cost))
from Actor
inner join ActorTweet
	on Actor.actorid = ActorTweet.actorid
inner join Film_actor
	on actor.actorid = Film_actor.actorid
inner join Film
​​ 	on Film_actor.filmid = Film.filmid
inner join Inventory
​​ 	on  Film.filmid = Inventory.filmid
inner join Rental
​​ 	on Inventory.invid = Rental.invid
where ActorTweet.monthyear = (max(ActorTweet.monthyear) - 1) # Previous Month
group by
	actor.actorid,
	Rental.releaseYr, 
	Rental.dtMonth, 
	ActorTweet.monthyear
having 
	Rental.dtYear = max(Rental.dtYear) #The Current Month
	and Rental.dtMonth = max(Rental.dtMonth); #The Current Month