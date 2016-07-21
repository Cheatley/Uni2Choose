Rails.application.routes.draw do

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 get '/users/sign_out' => 'devise/sessions#destroy' 
 match 'users/:id/save_search' => 'users#save_search', :as => :save_search, via: 'get'
 resources :searches, only: [:destroy]
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
 get 'ques' => 'recquiz#ques'
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
 get 'result' => 'searches#result'
<<<<<<< HEAD
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
 get 'save_search' => 'users#show'
 resources :searches, only: [:destroy]
=======

>>>>>>> 1cf7884c9558fdba60e5f4f4f8cedf9bddeb518a
 get 'recommender_search' => 'searches#new'

 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]


end
