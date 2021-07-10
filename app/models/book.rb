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
  
end
