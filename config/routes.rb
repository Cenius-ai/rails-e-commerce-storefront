Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Storefront
  root "products#index"
  resources :products, only: [:index, :show]

  # Cart
  get "/cart", to: "cart#show", as: :cart
  post "/cart/add/:product_id", to: "cart#add", as: :add_to_cart
  patch "/cart/update/:product_id", to: "cart#update", as: :update_cart
  delete "/cart/remove/:product_id", to: "cart#remove", as: :remove_from_cart

  # Checkout and orders
  get "/checkout", to: "orders#new", as: :checkout
  resources :orders, only: [:create, :show]

  # Admin
  namespace :admin do
    get "/login", to: "sessions#new", as: :login
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy", as: :logout
    resources :products, except: [:show]
  end
end
