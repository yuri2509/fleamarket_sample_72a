Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  get 'users/:id/logout', to: 'users#logout'

  resources :users, only: [:show]
  resources :cards, only: [:new, :create, :destroy, :show]

  root to: 'messages#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only: [:new, :create]
  end
end
