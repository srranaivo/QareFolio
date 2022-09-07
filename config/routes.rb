Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :tours do
      get "map", to: "tours#map"
      get "finish", to: "tours#finish"
      get "edit", to: "tours#edit"
      # get "tours/:id/edit", to: "tours#edit"
      patch "update", to: "tours#update"
      # patch "tours/:id", to: "tours#update"
    end

    resources :consultations do
      # delete "consultations/:id", to: "consultations#destroy" as: destroy_consultation_id
      delete "destroy_consultation_id", to: "consultations#destroy"
    end

    resources :patients do
      delete "patients/:id", to: "patients#destroy"
    end

    resources :consultations, only: [:show, :update] do
      resources :validated_cares, only: [:create]
      resources :remaks, only: [:create, :update, :edit]
    end
    resources :validated_cares, only: [:update]
  end
