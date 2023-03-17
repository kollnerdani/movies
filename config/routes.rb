Rails.application.routes.draw do
  get 'home/search'
  root to: 'home#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
