Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :items, only: [:new, :show]
end
