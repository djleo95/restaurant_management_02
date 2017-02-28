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
  resources :menus, only: [:index] 
  resources :order_dishes, only: [:create]
  resources :guests, only: [:new, :create] do
    resources :order_tables, only: [:new, :create]
  end
  resources :order_tables do
    resources :menus, only: [:index]
  end
  resources :reviews, only: [:new, :create, :index]
  namespace :admin do
    resources :staffs
    resources :bills
    resources :categories do
      resources :dishes
    end
    resources :dishes
    resources :menus do
      resources :dishes, only: [:destroy]
    end
  end
end
