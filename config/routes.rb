Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destination', to: 'users/registrations#new_destination'
    post 'destination', to: 'users/registrations#create_destination'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :items, only: [:new]
end
