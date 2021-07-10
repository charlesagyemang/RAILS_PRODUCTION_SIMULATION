class Book < ApplicationRecord
  belongs_to :author

  def self.group_by_topics
    _query = """
    SELECT json_agg(t) AS custom
    FROM(
      SELECT topic,
        COUNT(topic) As number_of_boos
      FROM books
      GROUP BY topic
    )t;
    """
    res = self.find_by_sql _query
    res.first.custom
  end


  def self.topics_stats
    _query = """
    SELECT json_agg(t) AS custom
    FROM(
      SELECT topic,
        COUNT(topic) AS topic_count,
        MIN(CAST(pages AS INT)) AS min_pg,
        MAX(CAST(pages AS INT)) AS max_pg,
        ROUND ( AVG(CAST(pages AS INT)), 2) AS avg_pages
      FROM books
      GROUP BY topic
    )t;
    """
    res = self.find_by_sql _query
    res.first.custom
  end

  def self.topics_stats_having
    puts "================== START TIME:  #{Time.now()}  ====================="
    _query = """
    SELECT json_agg(t) AS custom
    FROM(
      SELECT authors.name, 
        topic, 
        COUNT(books.id) AS books_written
      FROM authors
          JOIN books ON books.author_id = authors.id
      GROUP BY authors.name, topic
      HAVING COUNT(books.id) > 5
      ORDER BY COUNT(books.id) DESC
    )t;
    """
    res = self.find_by_sql _query
    puts "================== END TIME: #{Time.now()}  ====================="
    res.first.custom
  end
  
end
