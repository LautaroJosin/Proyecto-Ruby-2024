Rails.application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home"

  # Session and registration routes
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  # User routes
  resources :users, only: [ :index, :edit, :update, :show ] do
    member do
      patch :deactivate
      patch :activate
    end
  end

  # Sale routes
  resources :sales do
    member do
      patch :cancel
    end
    collection do
      get :set_products_amount
      post :set_products_amount
    end
  end


  # Product sale routes
  resources :product_sales

  # Client routes
  resources :clients, only: [ :index, :new, :create, :destroy ]

  # Category and product routes
  resources :products
  resources :categories, only: [ :index, :new, :create, :destroy ]

  get "up" => "rails/health#show", as: :rails_health_check
end
