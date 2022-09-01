Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tours
  resources :consultations, only: [:show] do
    resources :validated_cares, only: [:create, :destroy]
  end
end
