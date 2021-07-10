class Book < ApplicationRecord
  belongs_to :author

  def self.group_by_topics
    _query = """
    SELECT topic,
      COUNT(topic) AS custom_number
    FROM books
    GROUP BY topic;
    """
    self.find_by_sql _query
  end
  
end
