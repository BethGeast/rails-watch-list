Rails.application.routes.draw do

  resources :lists, only: [:new, :create]


end
