module Api
    module V1
        class AuthorController < ApplicationController
            #GET ALL BOOKS
            def all_books_by_country
                country = params[:country] ? params[:country] : ""
                res = Author.group_by_country(country)
                render json: res
            end
            

        end
    end
end


