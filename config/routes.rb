Rails.application.routes.draw do
  #get '/cards/random' => 'cards#random'
  resources :cards do
    get 'random', on: :collection
  end

  root 'cards#index'
  
  resources :sessions, only: [:new, :create]
  get '/sign_out' => 'sessions#destroy', as: :sign_out
end
