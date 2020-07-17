Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root to: 'messages#index'
  resources :items, only: [:new, :show] do
    collection do
      post "purchase", to: "items#purchase"
    end
  end

end
