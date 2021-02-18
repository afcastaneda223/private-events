Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :show, :create]
  get "/events/attend/", to: "events#attend"
end
