Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tours do
    get "map", to: "tours#map"
    get "finish", to: "tours#finish"
  end
  resources :consultations, only: [:show, :update] do
    resources :validated_cares, only: [:create]
    resources :remarks, only: [:create, :update, :edit]
  end
  resources :validated_cares, only: [:update]

  resources :users, only: [:show, :update]
end