Rails.application.routes.draw do

  root 'application#hello'
  get 'users/new'
  
end
