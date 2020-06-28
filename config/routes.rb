Rails.application.routes.draw do
  #get 'items', to: 'show#index'
  root to: 'items#index'
  resources :items, only: [:show]

end
