Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/product" => "products#index"
  get "/product/first" => "products#first"
  get "/product/:id" => "products#show"
  post "/product" => "products#create"
  patch "/product/:id" => "products#update"
  delete "/product/:id" => "products#destroy"
  
end
