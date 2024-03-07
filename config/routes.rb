Rails.application.routes.draw do
  # root 'lists#index'
  resources :lists, only: %i[new create index show]
end
