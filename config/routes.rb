Rails.application.routes.draw do

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 get '/users/sign_out' => 'devise/sessions#destroy' 
 
 resources :users, :only => [:show, :index]
 
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
 get 'adsearch' => 'searches#adsearch'
 get 'coursepage' => 'degree#coursepage'
 get 'ques' => 'searches#ques'
 get 'result' => 'searches#result'
 get 'save_search' => 'users#show'
 resources :searches, only: [:destroy]
 get 'recommender_search' => 'searches#new'

 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]


end
