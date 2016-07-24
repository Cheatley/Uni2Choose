Rails.application.routes.draw do
  
  #root homepage
  root 'pages#home'
  
  #about page
  get 'about' => 'pages#about'

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
  get 'quiz' => 'searches#quiz'
  
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
  
  get 'computer' => 'recquiz#computer'
  get 'design' => 'recquiz#design'
  get 'human' => 'recquiz#human'
  get 'lang' => 'recquiz#lang'
  get 'sci' => 'recquiz#sci'
  get 'medicine' => 'recquiz#medicine'
  get 'designvslaw' => 'recquiz#designvslaw'
  get 'scivslaw' => 'recquiz#scivslaw'
  get 'designvshuman' => 'recquiz#designvshuman'
  get 'designvsmedicine' => 'recquiz#designvsmedicine'
  get 'designvslang' => 'recquiz#designvslang'
  get 'design' => 'recquiz#design'
  get 'designvscomputer' => 'recquiz#designvscomputer'
  get 'scivscomputer' => 'recquiz#scivscomputer'
  get 'scivsmedicine' => 'recquiz#scivsmedicine'
  get 'scivslang' => 'recquiz#scivslang'
  get 'scivshuman' => 'recquiz#scivshuman'
  
  get 'sci' => 'recquiz#sci'
  get 'human' => 'recquiz#human'
  get 'humanvscomputer' => 'recquiz#humanvscomputer'
  get 'humanvsmedicine' => 'recquiz#humanvsmedicine'
  get 'medicinevslang' => 'recquiz#medicinevslang'
  get 'humanvs=medicine' => 'recquiz#humanvsmedicine'
  get 'humanvslang' => 'recquiz#humanvslang'
  get 'computervsmedicine' => 'recquiz#computervsmedicine'
  get 'computervslang' => 'recquiz#computervslang'
  get 'computer' => 'recquiz#aah'
  get 'medicine' => 'recquiz#comp'
  get 'lang' => 'recquiz#lang'
  get 'law' => 'recquiz#law'
  get 'lawvshuman' => 'recquiz#lawvshuman'
  get 'lawvscomputer' => 'recquiz#lawvscomputer'
  get 'lawvsmedicine' => 'recquiz#lawvsmedicine'
  get 'lawvslang' => 'recquiz#lawvslang'

end
