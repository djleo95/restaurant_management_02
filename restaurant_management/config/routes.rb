Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :new, :create] do
    resources :order_tables, only: [:new, :create]
  end
  resources :tables, only: [:index]
  resources :guests, only: [:new, :create] do
    resources :order_tables, only: [:new, :create]
  end
  namespace :admin do
    resources :categories
  end
end
