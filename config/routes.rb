Rails.application.routes.draw do
  root "pages#home"

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }

  resources :users, only: [ :index, :edit, :update, :show ] do
    member do
      patch :deactivate
      patch :activate
    end
  end

  resources :categories

  resources :products

  get "up" => "rails/health#show", as: :rails_health_check
end
