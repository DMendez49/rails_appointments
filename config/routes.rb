Rails.application.routes.draw do
  root 'hospitals#index'

  resources :patients
  resources :hospitals do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end