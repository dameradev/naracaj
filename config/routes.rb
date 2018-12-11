Rails.application.routes.draw do

  devise_for :users
  root to: 'firms#index'
  resources :users

  resources :firms do
    resources :products, only:[:index]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get 'cart/checkout', to: 'orders#new', as: :checkout
  patch 'cart/checkout', to: 'orders#create'

  resources :addresses

  # get "addresses/new_address", to: 'addresses#new_address', :as => :new_address
  # post "addresses/new", to: 'addresses#create'


end
