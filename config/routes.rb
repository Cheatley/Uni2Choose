Rails.application.routes.draw do

  get 'courses/index'

 root 'pages#home'
 
 get 'signup'  => 'users#new'
 get 'login'   => 'sessions#new'
 post 'login'   => 'sessions#create'
 get 'logout'  => 'sessions#destroy'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'courses#index'
 get 'search' => 'courses#search'
 get 'searchbygrades' => 'courses#searchbygrades'



 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]

end
