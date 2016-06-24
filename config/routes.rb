Rails.application.routes.draw do

 root 'searches#new'
 get 'summerschool' => 'pages#summerschool'
 get 'signup'  => 'users#new'
 get 'login'   => 'sessions#new'
 post 'login'   => 'sessions#create'
 get 'logout'  => 'sessions#destroy'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'courses#index'
 get 'keyword_search' => 'searches#keyword_search'
 get 'advanced_search' => 'searches#advanced_search'
 
 resources :searches
 get 'recommender_search' => 'searches#new'
 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]
 
 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]

end
