Rails.application.routes.draw do
  root "pages#home"

  # Session and registration routes
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }

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
  post "/clients" => "clients#create"

  # Category and product routes
  resources :categories

  resources :products

  get "up" => "rails/health#show", as: :rails_health_check
end
