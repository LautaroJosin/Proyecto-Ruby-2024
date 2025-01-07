Rails.application.routes.draw do
  root "pages#home"
  devise_for :users, controllers: { sessions: "users/sessions" }, path_names: { sign_in: "login", sign_out: "logout" }
  resources :categories
  resources :products

  get "up" => "rails/health#show", as: :rails_health_check
end
