Rails.application.routes.draw do
  
  #root homepage
  root 'pages#home'
  
  #about page
  get 'about' => 'pages#about'
  
  #help page
  get 'help' => 'pages#help'
  
  #privacy page
  get 'privacy' => 'pages#privacy'
  #university and course pages
  get 'courses' => 'pages#courses'
  get 'unis' => 'pages#unis'
  
  #keyword search
  get 'keywordsearch' => 'searches#keywordsearch'

  #Users and Devise authentication system routes
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get '/users/sign_out' => 'devise/sessions#destroy' 
  resources :users, :only => [:show, :index]
  
  #rails_admin gem: Admin dashboard route
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #User analysis page for admin users
  get 'analysis' => 'analysis#user_analysis'
  
  #Search and Save search result to profile routes
  match 'users/:id/save_search' => 'users#save_search', :as => :save_search, via: 'get'
  resources :searches, only: [:destroy]

  #advanced search route
  get 'adsearch' => 'searches#adsearch'
  #individual degree pages route
  get 'coursepage' => 'degree#coursepage'
  
  #quiz route
  get 'quiz' => 'personquiz#pquiz'
  get 'sbear' => 'personquiz#sbear'
  get 'rpanda' => 'personquiz#rpanda'
  get 'alpach' => 'personquiz#alpach'
  get 'tiger' => 'personquiz#tiger'
  
  #contact form routes
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  
  #error pages routes
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  match "/422", :to => "errors#unprocessable_entity", :via => :all

  #Recommender system routes
  get 'new' => 'searches#new'
  get 'ques' => 'recquiz#ques'
  get 'result' => 'searches#result'
  get 'bio' => 'quiz#bio'
  get 'phys' => 'quiz#phys'
  get 'math' => 'quiz#math'
  get 'hum' => 'quiz#hum'
  get 'law' => 'quiz#law'
  get 'lin' => 'quiz#lin'
  get 'lan' => 'quiz#lan'
  get 'art' => 'quiz#art'
  get 'draw' => 'quiz#draw'
  get 'mainquiz' => 'quiz#mainquiz'

end
