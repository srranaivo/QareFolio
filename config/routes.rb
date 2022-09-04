Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tours do
    get "map", to: "tours#map"
  end
  resources :consultations, only: [:show, :update] do
    resources :validated_cares, only: [:create, :destroy]
  end
end
