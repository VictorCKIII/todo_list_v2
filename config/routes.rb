Rails.application.routes.draw do
  resources :lists do
    resources :items, only: [ :create, :edit, :update, :destroy ]
  end
  resource :session, only: [:new, :create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check



  root "sessions#new"
  
end
