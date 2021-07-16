class Author < ApplicationRecord
    has_many :books

    def self.group_by_country(country_name = "")
        country_name = country_name.length < 1 ? "" : country_name.downcase
        _query = """
        SELECT json_agg(t) AS country_list
        FROM(
            SELECT authors.id, 
                authors.name, 
                authors.country,
                COUNT(books.author_id) AS number_of_books
            FROM authors
            JOIN books ON books.author_id = authors.id
            GROUP BY authors.country, authors.name, authors.id
        """
        _query_having = "\tHAVING LOWER(authors.country) LIKE '%#{country_name}' \n"
        _query_ending = """
            ORDER BY COUNT(books.author_id) DESC
        )t;
        """
        _query += _query_having + _query_ending
        res = self.find_by_sql _query
        # res.first.country_list
    end

    def self.group_by_country_two(country_name = "")
        country_name = country_name.length < 1 ? "" : country_name.downcase
        _query = """
            SELECT authors.id, 
                authors.name,
                authors.country as kumi_guitar,
                COUNT(books.author_id) AS number_of_books
            FROM authors
            JOIN books ON books.author_id = authors.id
            GROUP BY authors.country, authors.name, authors.id
        """
        _query_having = "\tHAVING LOWER(authors.country) LIKE '%#{country_name}' \n"
        _query_ending = """
            ORDER BY COUNT(books.author_id) DESC;
        """
        _query += _query_having + _query_ending
        res = self.find_by_sql _query
        # res.first.country_list
    end

    def self.group_by_country_two_deadly(country_name = "")
        country_name = country_name.length < 1 ? "" : country_name.downcase.to_s
        _query = """
            SELECT *
            FROM authors
            JOIN books ON books.author_id = authors.id
            WHERE LOWER(authors.country) = '#{country_name};
        """
        res = self.find_by_sql _query
        # Author.group_by_country_two_deadly("' OR 1=1 LIMIT 20; --")
    end
    
    
end
