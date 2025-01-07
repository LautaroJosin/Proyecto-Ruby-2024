Rails.application.routes.draw do
  root "pages#home"

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  get "/users", to: "users#index"
  get "/users/edit", to: "users#edit"
  patch "/users/:id/update", to: "users#update"

  resources :categories

  resources :products

  get "up" => "rails/health#show", as: :rails_health_check
end
