Rails.application.routes.draw do

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 resources :users, :only => [:show, :index]
 get 'registration/new'


 mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 get 'users_list' => 'rails_admin/main#show'

 get 'recommends/new'

 get 'degree/new'

 root 'searches#new'
 get 'summerschool' => 'pages#summerschool'
 get 'analysis' => 'analysis#user_analysis'
 get 'courses' => 'degree#index'
 get 'keyword_search' => 'searches#keyword_search'
 get 'advanced_search' => 'searches#advanced_search'
<<<<<<< HEAD
 get 'recquiz'  => 'searches#recquiz'
=======
 get 'adsearch' => 'searches#adsearch'

>>>>>>> 1af18bf76b7b575de46d335761742e6c4f957f25
 resources :searches
 get 'recommender_search' => 'searches#new'

 #contact form routes
 match '/contacts',     to: 'contacts#new',             via: 'get'
 resources "contacts", only: [:new, :create]


end
