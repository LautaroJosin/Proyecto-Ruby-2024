Rails.application.routes.draw do
  root "pages#home"
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :categories
  resources :products

  get "up" => "rails/health#show", as: :rails_health_check
end
