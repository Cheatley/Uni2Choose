Rails.application.routes.draw do

 root 'pages#home'
 get 'summerschool' => 'pages#summerschool'
 get 'signup'  => 'users#new'
 get 'login'   => 'sessions#new'
 post 'login'   => 'sessions#create'
 get 'logout'  => 'sessions#destroy'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'courses#index'
 get 'keyword_search' => 'courses#keyword_search'
 get 'advanced_search' => 'courses#advanced_search'
 
 resources :searches
 get 'recommender_search' => 'searches#new'
 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]

end
