class AuthorHandler

    def initialize(data)
      @data = data
    end    

    def as_json(args**)
        data.map do |datum|
            {
                name:           data.topic,
                country: data.number_of_books,
                number_of_books: data.number_of_books,
            }
        end
    end

    private
    attr_reader :data
    

end