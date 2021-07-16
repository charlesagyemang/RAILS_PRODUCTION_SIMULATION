# .all.sample vrs .take

=begin

Author.all 
SELECT * 
FROM authors;

User.take
SELECT * 
FROM authors
LIMIT 1;

=end

=begin

===================================================

#HOW MANY BOOKS DO YOU HAVE ?

SQL = SELECT COUNT(id) FROM books;
AR  = Book.count

===================================================



===================================================

#HOW MANY AUTHORS DO WE HAVE ?

SQL = SELECT COUNT(id) FROM authors;
AR  = Author.count

===================================================



===================================================

-- HOW MANY BOOKS DO WE HAVE IN EACH TOPIC BEGIN --

SELECT topic,
	COUNT(topic)
FROM books
GROUP BY topic;

-- HOW MANY BOOKS DO WE HAVE IN EACH TOPIC END ----

AR = Book.group(:topic).count(:topic)

===================================================




===================================================
--- HOW MANY BOOKS DO WE HAVE IN EACH TOPIC ? -----
--- FIND MIN, MAX AND MEAN OF THE NUMBER OF PAGES ? 
---- IN EACH TOPIC 
--- BEGIN -----------------------------------------

SELECT topic,
	COUNT(topic) AS topic_count,
	MIN(CAST(pages AS INT)) AS min_pg,
	MAX(CAST(pages AS INT)) AS max_pg,
	ROUND ( AVG(CAST(pages AS INT)), 2) AS avg_pages
FROM books
GROUP BY topic;

--- HOW MANY BOOKS DO WE HAVE IN EACH TOPIC ? -----
--- MIN, MAX AND MEAN PAGE COUNT BY TOPIC ? -------
--- END   -----------------------------------------

AR=
===================================================


===================================================

-- HOW MANY AUTHORS HAVE WRITTEN 5 OR MORE BOOKS 
ON A TOPIC ? -----

SELECT authors.name, 
	   topic, 
	   COUNT(books.id) AS books_written
FROM authors
	JOIN books ON books.author_id = authors.id
GROUP BY authors.name, topic
HAVING COUNT(books.id) > 5
ORDER BY COUNT(books.id) DESC;

-- HOW MANY AUTHORS HAVE WRITTEN 5 OR MORE BOOKS 
ON A TOPIC ? -----


===================================================






=================================================


SELECT cars."modelName" as car,
	   drivers."fullName" as driver,
	   COUNT(sales."driverId") as number_of_sales
FROM sales
JOIN drivers ON drivers.id = sales."driverId"
JOIN cars ON  cars.id = drivers."carId"
GROUP BY sales."driverId", drivers."fullName", cars."modelName"
ORDER BY COUNT(sales."driverId") DESC;


SELECT cars."modelName" as car,
	   drivers."fullName" as driver,
	   COUNT(sales."driverId") as number_of_sales
FROM sales
JOIN drivers ON drivers.id = sales."driverId"
JOIN cars ON  cars.id = drivers."carId"
GROUP BY sales."driverId", drivers."fullName", cars."modelName"
ORDER BY COUNT(sales."driverId") DESC;

HOW MUCH MONEY ABU HAS BROUGHT THIS MONTH

SELECT SUM( CAST(sales."amountReceived" AS INT))
FROM sales
WHERE sales."status" = 'RECEIVED_BY_KEHILLAH'
	  AND sales."dateReceived" BETWEEN '2021-07-01' AND '2021-07-31'
	  AND sales."driverId" = 's33c6i5H6xvxTTn3D'

=================================================


=end

