Rails.application.routes.draw do

 root 'pages#home'
 
 get 'signup'  => 'users#new'
 get 'login'   => 'sessions#new'
 post 'login'   => 'sessions#create'
 get 'logout'  => 'sessions#destroy'
 get 'users/new'

 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]

end
