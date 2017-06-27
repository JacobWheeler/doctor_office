Rails.application.routes.draw do
  root 'doctors#index'
  get 'signup/index'
  

  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create, :destroy, :index]

end
