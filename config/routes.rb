Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :items, only: [:new,:show]
end
