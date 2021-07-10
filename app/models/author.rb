class Author < ApplicationRecord
    has_many :books

    def self.name_and_country
        _query = """
        SELECT id, name, 
            country
        FROM authors
        LIMIT 10;
        """
        self.find_by_sql _query
    end
    
    
end
