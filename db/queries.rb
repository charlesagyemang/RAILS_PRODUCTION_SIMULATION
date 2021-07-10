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




=end

