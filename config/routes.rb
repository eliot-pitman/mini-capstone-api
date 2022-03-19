Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  ### User Login

  # root 'sessions#home'

  # resources :users, only: [:new,:create,:edit,:update,:show,:destroy]

  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'sessions#destroy'


  # Defines the root path route ("/")
  # root "articles#index"
  get "/products" => "products#index"
  get "/products/first" => "products#first"
  get "/products/:id" => "products#show"

  get "suppliers" => "suppliers#index"
  get "suppliers/:id" => "suppliers#show"

  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  



  
end
