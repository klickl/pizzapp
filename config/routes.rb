Rails.application.routes.draw do
  resources :likes
  resources :composition_pizzas
  resources :ingredients
  resources :pizzas
  resources :orders
  resources :users
  resources :groups
  resources :restaurants

  get '/ingredients/page/:page' => 'ingredients#index'

  get '/login/' => 'login#login'
  get '/unauthorized' => 'home#banned'
  get '/' => 'home#index'
  post 'likes/user/:user_id/pizza/:pizza_id' => 'likes#like'
end
