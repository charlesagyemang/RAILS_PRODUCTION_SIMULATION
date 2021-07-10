Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :categories, only: %i[index create destroy]
      # resources :books, only: %i[all_books_by_country, all]
      get '/authors/all_books_by_country', to: 'author#all_books_by_country'
    end
  end 
end
