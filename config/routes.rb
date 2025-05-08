Rails.application.routes.draw do
  resources :lists do 
    resources :items, only: [:create, :edit, :update, :destroy]
  end
  get "up" => "rails/health#show", as: :rails_health_check


  root "lists#index"
end
