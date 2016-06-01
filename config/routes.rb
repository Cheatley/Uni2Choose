Rails.application.routes.draw do

  get 'users/new'

  root 'application#home'
  get 'layouts/application'
 

end
