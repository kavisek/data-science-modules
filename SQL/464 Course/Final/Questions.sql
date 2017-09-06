
<------------------------------- Chapeter 7 --------------------------->

#7-1) What is data modeling?

Data modeling is both a technique for modeling data and its relationships and a graphical representation of a database. It is a method for determining what data and relationships should be stored in the database. The data model is not concerned with how the data should be stored.

#7-3) When do you label relationships?

Typically, relationship arcs should not be labeled. Only when there are two relationships between two entities or if the relationship is not easily inferred should you label the arc.

#7-5) How do you handle exceptions when data modeling?

Exceptions should be handled by the data model. Actually, it is recommended to go "hunting for exceptions" to avoid a low-fidelity data model. One should ask the client questions such as:

		- Is it always like that?
		- Would there be any situations where this could be an m:m relationship?
		- Have there ever been any exceptions?
		- Are things likely to change in the future?

#7-7) Why might a data model grow?

A data model might grow as you expand the boundaries of the application. Some 1:m relationships will become m:m relationships and you will add entities, attributes, and relationships to faithfully describe the real world.

#7-9) How do you indicate ordering of instances in a data model?

To handle ordering of the instances in a database, create a new attribute which contains the order of the entity. This way one does not have to store the rows in order and it is also possible to create two or more orders for each entity. The SQL clause ORDER BY can be used to print out the rows in order.

#7-E1) The president of a book wholesaler has told you that she wants information about publishers, authors, and books.

#7-E3) Kids'n'Vans retails minivans for a number of manufacturers. Each manufacturer offers several models of its minivan (e.g., SE, LE, GT). Each model comes with a standard set of equipment (e.g., the Acme SE comes with wheels, seats, and an engine). Minivans can have a variety of additional equipment or accessories (radio, air conditioning, automatic transmission, airbag, etc.), but not all accessories are available for all minivans (e.g., not all manufacturers offer a driver's side airbag). Some sets of accessories are sold as packages (e.g., the luxury package might include stereo, six speakers, cocktail bar, and twin overhead foxtails)

#7-E5) A university gymnastics team can have as many as 10 gymnasts. The team competes many times during the season. A meet can have one or more opponents and consists of four events: vault, uneven bars, beam, and floor routine. A gymnast can participate in all or some of these events though the team is limited to five participants in any event.

#7-E7) A medical center employs several physicians. A physician can see many patients, and a patient can be seen by many physicians though not always on the one visit. On any particular visit, a patient may be diagnosed to have one or more illnesses.

#7-E9) Global Trading (GT), Inc. is a conglomerate. It buys and sells businesses frequently and has difficulty keeping track of what strategic business units (SBUs) it owns, in what nations it operates, and what markets it serves. For example, the CEO was recently surprised to find that GT owns 25 percent of Dundee's Wild Adventures, headquartered in Zaire, that has subsidiaries operating tours of Australia, Zaire, and New York. You have been commissioned to design a database to keep track of GT's businesses. The CEO has provided you with the following information: SBUs are headquartered in one country, not necessarily the United States. Each SBU has subsidiaries or foreign agents, depending on local legal requirements, in a number of countries. Each subsidiary or foreign agent operates in only one country but can operate in more than one market. GT uses the standard industrial code (SIC) to identify a market (e.g., newspaper publishing). The SIC is a unique four-digit code. While foreign agents operate as separate legal entities, GT needs to know in what countries and markets they operate. On the other hand, subsidiaries are fully or partly-owned by GT, and it is important for GT to know who are the other owners of any subsidiary and what percentage of the subsidiary they own. It is not unusual for a corporation to have shares in several of GT's subsidiary companies and for several corporations to own a portion of a subsidiary. Multiple ownership can also occur at the SBU level.


#7 - E11) Draw a data model for the following table taken from a magazine that evaluates consumer goods. The reports follow a standard fashion of listing a brand and model, price, overall score, and then an evaluation of a series of attributes, which can vary with the product. For example, the sample table evaluates stereo systems. A table for evaluating microwave ovens would have a similar layout, but different features would be reported (e.g., cooking quality).




<------------------------------- Chapeter 8 --------------------------->


#8-1) What is normalization and what is its goal?

Normalization provides a theoretical base for defining the desirable properties of relations. It is the process for checking the quality of a database design.

#8-3) How do E-R and IDEF1X differ from the data modeling method of this text

The E-R modeling approach differs from the data modeling approach used in this text in that m:m relationships are not shown as intersection entities. There are some graphical differences: attributes are listed in ovals attached to the entity and relationships are symbolized by a diamond. Otherwise, the modeling technique is basically the same.

The IDEF1X modeling technique is also only slightly different from the modeling technique described in the text: relationships are always labeled and 1:m relationships are symbolized with a dot instead of a crows foot. Table names are written on top of the entity box, primary keys are separated from the rest of the attributes with a line, and alternate keys and inversion entries are indicated in the model.



<------------------------------- Chapeter 9 --------------------------->

#9-1) What reasons does Codd give for adopting the relational model?

Codd supports the adoption of the relational model because it is a practical tool for increasing the productivity of MIS departments. Codd has three reasons for adopting the relational model. First, other database models force the application programmer to code at a low level of structural detail. As a result, application programs are complicated and take longer to write and debug. Second, the relational model allows multiple records to be processed at one time. Third, the relational model allows users to make ad hoc queries. This means users can write and execute their queries without the help of the MIS department.

#9-3) What is a domain? Why is it useful?

A domain is a set of values that must posses the same data type. It is all the legal values of an attribute. It is useful because it defines what comparisons are permissible. Only attributes drawn from the same domain should be compared. For instance, you would not want to compare the first name of a customer to the cost of a product. A domain could also be useful in some situations (e.g. state codes) to have the DBMS automatically check data validity.

#9-5) What is a simple relational database?

A simple relational database consists of a collection of tables that may be related to one another.

#9-7) Why do we need an entity integrity rule and referential integrity rule?

Entity integrity ensures that each instance of an entity described by a relation is identifiable in some way. To ensure this, all components of a primary key of a relation must not be null. We need this rule because it would not always be possible to uniquely identify a row in a relation if the unique identifier contained nulls.

Referential integrity ensures that all foreign keys must have matching primary keys. This rule of integrity is important because it means that all relations can be determined. If there were a foreign key that did not match a primary key it would not be possible to determine the relation between the record of the foreign key and that of the primary key.

#9-9) What is meant by the term “a primitive set of operations?

A primitive set of operations is the minimal set of relational operations needed to express all eight relational operators. Only five of the eight operators are required to express all eight. They are: restrict, project, product, union, and difference.










<------------------------------- Chapeter 10 --------------------------->



#10-1) Why is it important that SQL was adopted as a standard by ANSI and ISO?

Since ISO and ANSI are two of the major international standards setting institutions, a standard that is adopted by both of them will be widely used by software manufacturers and thus, end users

#10-3) Is SQL a complete programming language? What are the implications of your answer?

SQL is not a complete programming language since it cannot be used to write computer programs and procedures. However, SQL can be embedded in standard programming languages such as COBOL and C.

#10-4) What is the difference between a base table and a view?

A base table is an autonomous, named table. It is autonomous because it exists in its own right. Views are derived from one or more base tables and actually do not exist independently of the base table. A view is also called a virtual table.

#10 - 9) Specify the data type (e.g., DECIMAL(6,2)) you would use for the following column

	a) decimal (6,2)
	c) decimal (0,2)
	e) decimal (16)
	g) vargraghic
	i) longvarchar
	k) varchar(50)
	q) Timestamp

#10-11) Give some reasons for creating a view.

A view can be created for a variety of reasons:

to restrict access to certain rows or columns
to handle derived data (data conversion)
to avoid writing common SQL queries

#10-13) Write SQL codes to create a unique index on firm name for the shr table defined in Chapter 3. Would it make sense to create a unique index for PE ratio in the same table?

use db_text;
create index x1 on share(shrcode)

No, it would not make sense to create a unique index for PE since two companies might have the same P

#10-15) What is the difference between an equijoin and a natural join?

An equijoin table contains two identical columns. If one of these two columns is dropped, the remaining table is called a natural join

#10-17) What function would you use for the following situations

	a) sum()
	c) count()
	e) month()
	g) substring(cityname,1,5)

#10-19) What are the two modes in which you can use SQL

SQL can be used as an interactive query language or embedded in an application program.

#10-21) How do procedural programming languages and SQL differ in the way they process data? How is this difference handled in an application program? What is embedded SQL?

SQL processes one table at a time while COBOL processes one record at a time. Thus, COBOL uses a loop to process each record of a table


<----------------------- SQL Reference Playbook -------------------->


#1) A slow full toss

select
	distinct itemname
from
	qemp
where deptname = 'Marketing';



#2) Skinning the cat

select
	distinct itemname
from
	qsale, qdept
where qsale.deptname = qdept.deptname
and deptfloor = 2
	



#3) Anther full Toss

select 
	distinct itemname
from
	qsale, 
	qdept
where qsale.deptname = qdept.deptname
and deptfloor <> 2

#4) Subtracting from all


select 
	distinct itemname
from 
	qsale
where itemname not in

	( 
	select
		distinct itemname
	from
		qsale, qdept
	where qsale.deptname = qdept.deptname
	and deptfloor = 2
	)



#6) At least some number

select itemname
from qsale, qdept
where qsale.deptname = qdept.deptname and deptfloor = 2
group by itemname
having count(distinct qdept.deptname) > 1


#7)A freindly IN for an SQL traveler

select empfname, empsalary
from qemp
where empno in
	(
	select bossno
	from qemp
	where empfname = "Clare"
	)
# In help compare the value in another subquery

#8) Joining a Table with itself

select 
	wrk.empno,
	wrk.empfname,
from
	qemp wrk,
	qemp boss,
where
	wrk.bossno = boss.empno
	and boss.empsalary < wrk.empsalary


#9) a combination of substraction and joining


select distinct demmptname
from qemp
where 
	deptname <> 'Management'
	and demmptname not in
		(
		select wrk.deptname
		from qemp wrk, qemp boss
		where wrk.bossno = boss.empno
		and wrk.empsalary >= boss.empsalary);
		)


#10) 


#11)
#12)
#13)
#14)
#15)
#16)
#17)
#18)
#19)
#20)
#21)
#22)
#23)
#24)
#25)



<------------------------------- Chapeter 11 --------------------------->




drop table if exists boundary;
drop table if exists political_unit;
drop table if exists city;


CREATE TABLE political_unit ( Unitname VARCHAR( 30) NOT NULL, Unitcode CHAR( 2), Unitpop DECIMAL( 6,2), PRIMARY KEY( unitcode));

CREATE TABLE boundary (Boundid INTEGER, Boundpath POLYGON NOT NULL, Unitcode CHAR( 2), PRIMARY KEY( boundid), CONSTRAINT fk_boundary_polunit FOREIGN KEY( unitcode) REFERENCES political_unit( unitcode));


CREATE TABLE city 
	(Cityname VARCHAR( 30), 
	Cityloc POINT NOT NULL, 
	Unitcode CHAR( 2), 
	PRIMARY KEY( unitcode, cityname), 
	CONSTRAINT fk_city_polunit 
	FOREIGN KEY( unitcode) 
	REFERENCES political_unit( unitcode));


#11-3

INSERT INTO political_unit VALUES ('Spain', 'es', 4.9);
INSERT INTO political_unit VALUES ('Portugal','pt', 10);
INSERT INTO political_unit VALUES ('Andorra','ad', .067);
INSERT INTO political_unit VALUES ('United Kingdom','uk', 58.79);

INSERT INTO boundary VALUES (3,ST_GeomFromText('POLYGON((12 12, 13 12, 13 11, 12 11, 12 12))'),'ad');
INSERT INTO boundary VALUES (4,ST_GeomFromText('POLYGON((1 10, 4 10, 4 9, 3 3, 1 3, 1 5, 0 5, 0 6, 1 8, 1 10))'),'pt');
INSERT INTO boundary VALUES (5,ST_GeomFromText('POLYGON((1 12, 3 13, 12 12, 12 11, 15 11, 15 11, 11 7, 11 5, 9 2, 5 1, 4 1, 3 3, 4 9, 4 10, 1 10, 1 12))'),'es');

INSERT INTO city VALUES ('Braga',ST_GeomFromText('POINT(2 10)'),'pt');
INSERT INTO city VALUES ('Porto',ST_GeomFromText('POINT(1 9)'),'pt');
INSERT INTO city VALUES ('Lisbon',ST_GeomFromText('POINT(1 5)'),'pt');
INSERT INTO city VALUES ('Santiago de Compostela',ST_GeomFromText('POINT(2 12)'),'es');
INSERT INTO city VALUES ('Oviedo',ST_GeomFromText('POINT(5 12)'),'es');
INSERT INTO city VALUES ('Santander',ST_GeomFromText('POINT(7 12)'),'es');
INSERT INTO city VALUES ('Vitori',ST_GeomFromText('POINT(8 11)'),'es');
INSERT INTO city VALUES ('Pamplona',ST_GeomFromText('POINT(9 11)'),'es');
INSERT INTO city VALUES ('Logrono',ST_GeomFromText('POINT(8 11)'),'es');
INSERT INTO city VALUES ('Valiadoti',ST_GeomFromText('POINT(6 10)'),'es');
INSERT INTO city VALUES ('Saragossa',ST_GeomFromText('POINT(10 10)'),'es');
INSERT INTO city VALUES ('Barcelona',ST_GeomFromText('POINT(13 10)'),'es');
INSERT INTO city VALUES ('Madrid',ST_GeomFromText('POINT(7 8)'),'es');
INSERT INTO city VALUES ('Toledo',ST_GeomFromText('POINT(7 7)'),'es');
INSERT INTO city VALUES ('Valencia',ST_GeomFromText('POINT(11 6)'),'es');
INSERT INTO city VALUES ('Murcia',ST_GeomFromText('POINT(10 4)'),'es');
INSERT INTO city VALUES ('Sevilla',ST_GeomFromText('POINT(4 3)'),'es');
INSERT INTO city VALUES ('Gibralta',ST_GeomFromText('POINT(5 1)'),'uk');
INSERT INTO city VALUES ('Andorra la Veila',ST_GeomFromText('POINT(12 11)'),'ad');


#11-3a) What is the direct distance, or bee line, from Lisbon to Madrid

Select 
	ST_Distance(orig.cityloc, dest.cityloc)*75 as "Distance (kms)"

from 
	city orig, 
	city dest
where 
	orig.cityname = 'Lisbon'
	and dest.cityname = "Madrid"

#11-3b) Imagine you get lost in Portugal and your geographic positioning system (GPS) indicates that your coordinates are (3,9). What is the nearest city?


SELECT cityname FROM  city 
	WHERE  ST_Distance(cityloc, ST_GeomFromText('POINT(3 9)'))
		= (SELECT MIN(ST_Distance(cityloc, ST_GeomFromText('POINT(3 9)'))) FROM city);


#11-3e) What is the area of Portugal?


Select ST_AREA(boundpath)*5625 as "Area (km^2)" 
from 
	political_unit, 
	boundary
where
	unitname = "Portugal"
	and political_unit.unitcode = boundary.unitcode;



#11-5) How would you compute distance if your relational database does not have a distance function?

Distance = sqrt((x2 - x1)2 * (y2-y1)2)

#7) When might you use transaction time and when valid time?

transaction: Transaction time is used when you want to record when an event occurred.
valid: Valid time is used to specify when an items value becomes valid (e.g., a press release).

#9) A supermarket chain has asked you to record what goods customers buy during each visit. In other words, you want details of each shopping basket. It also wants to know when each purchase was made. Design the database




<------------------------------- Skills Builder 11 --------------------------->


drop table if exists boundary;
drop table if exists political_unit;
drop table if exists city;


CREATE TABLE  political_unit (
 unitname       VARCHAR(30) not null,
 unitcode       CHAR(2),
 unitpop        DECIMAL(6,2),
 PRIMARY KEY(unitcode));

CREATE TABLE boundary (
 boundid        INTEGER,
 boundpath      POLYGON NOT NULL,
 unitcode       CHAR(2),
 PRIMARY KEY(boundid),
 CONSTRAINT fk_boundary_polunit FOREIGN KEY(unitcode)
   REFERENCES political_unit(unitname)) TYPE MYISAM;

CREATE TABLE city (
 cityname       VARCHAR(30),
 cityloc        POINT NOT NULL,
 unitcode       CHAR(2),
 PRIMARY KEY(unitcode,cityname),
 CONSTRAINT fk_city_polunit FOREIGN KEY(unitcode) 
   REFERENCES political_unit(unitname)) TYPE MYISAM; 		


INSERT INTO political_unit VALUES ('Republic of Ireland','ie', 3.9);
INSERT INTO political_unit VALUES ('Northern Ireland','ni', 1.7);
INSERT INTO boundary VALUES
  (1,ST_GeomFromText('polygon((9 8, 9 3, 4 1, 2 2, 1 3, 3 5, 3 6, 2 6,
	2 9, 5 9, 5 10, 6 11, 7 11, 7 10, 6 9, 7 8, 7 9, 8 9, 8 8, 9 8))'),'ie');
INSERT INTO boundary VALUES
  (2,ST_GeomFromText('polygon((7 11, 9 11, 10 9, 10 8, 8 8, 8 9, 7 9,
	7 8, 6 9, 7 10, 7 11))'),'ni');
INSERT INTO city VALUES ('Dublin',ST_GeomFromText('POINT(9 6)'),'ie');
INSERT INTO city VALUES ('Cork',ST_GeomFromText('POINT(5 2)'),'ie');
INSERT INTO city VALUES ('Limerick',ST_GeomFromText('POINT(4 4)'),'ie');
INSERT INTO city VALUES ('Galway',ST_GeomFromText('POINT(4 6)'),'ie');
INSERT INTO city VALUES ('Sligo',ST_GeomFromText('POINT(5 8)'),'ie');
INSERT INTO city VALUES ('Tipperary',ST_GeomFromText('POINT(5 3)'),'ie');
INSERT INTO city VALUES ('Belfast',ST_GeomFromText('POINT(9 9)'),'ni');
INSERT INTO city VALUES ('Londonderry',ST_GeomFromText('POINT(7 10)'),'ni');	


#What is the are of the border of Northern Ireland? Because Northern Ireland is part of the United Kingdom and miles are still often used to measure distances, report the area in square miles.


select 
	ST_Area(boundpath)*526 as "Area (sq miles)"
from
	political_unit,
	boundary
where unitname = "Northern Ireland"
and political_unit.unitcode = boundary.unitcode;

#What is the direct distance from Belfast to Londonderry in miles?


Select
	 ST_Distance(orig.city, dest.cityloc)*23 as 'Distance (miles)'
from
	city orig, 
	city dest
where 
	orig.cityname = "Belfast"
	dest.cityname = "Londonderry"








