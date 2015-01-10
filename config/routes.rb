Rails.application.routes.draw do
  root 'home#index'
  
  resources :sessions, only: [:new, :create]
  get '/sign_out' => 'sessions#destroy', as: :sign_out
end
