class Author < ApplicationRecord
    has_many :books

    def self.group_by_country(country_name = "")
        country_name = country_name.length < 1 ? "" : country_name.downcase
        _query = """
        SELECT json_agg(t) AS custom
        FROM(
            SELECT authors.name, 
                authors.country,
                COUNT(books.author_id) AS number_of_books
            FROM authors
            JOIN books ON books.author_id = authors.id
            GROUP BY authors.country, authors.name
        """
        _query_having = "\tHAVING LOWER(authors.country) LIKE '%#{country_name}' \n"
        _query_ending = """
            ORDER BY COUNT(books.author_id) DESC
        )t;
        """
        _query += _query_having + _query_ending
        res = self.find_by_sql _query
        res.first.custom
    end
    
    
end
