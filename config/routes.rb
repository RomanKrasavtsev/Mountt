Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "dashboard#index", as: "dashboard"

  resources :records
  resources :items
  resources :users
  resources :plans
end
