Rails.application.routes.draw do


  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  
  get 'recommends/new'

  get 'degree/new'

 root 'searches#new'
 get 'summerschool' => 'pages#summerschool'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'degree#index'
 get 'keyword_search' => 'searches#keyword_search'
 get 'advanced_search' => 'searches#advanced_search'
 
 resources :searches
 get 'recommender_search' => 'searches#new'
 resources :account_activations, only: [:edit]
 resources :password_resets, only: [:new, :create, :edit, :update]
 
 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]

end
