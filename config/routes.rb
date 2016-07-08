Rails.application.routes.draw do

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 resources :users, :only => [:show, :index, :destroy, :update]
 get 'registration/new'
 
 mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

 get 'recommends/new'

 get 'degree/new'

 root 'pages#home'
 get 'about' => 'pages#about'
 get 'new' => 'searches#new'
 get 'quiz' => 'searches#quiz'
 get 'summerschool' => 'pages#summerschool'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'degree#index'
 get 'keyword_search' => 'searches#keyword_search'
 get 'advanced_search' => 'searches#advanced_search'
 get 'adsearch' => 'searches#adsearch'
 get 'ques' => 'searches#ques'
 get 'result' => 'searches#result'

 resources :searches
 get 'recommender_search' => 'searches#new'

 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]


end
