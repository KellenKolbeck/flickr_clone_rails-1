Rails.application.routes.draw do
  devise_for :users
  root 'photos#index'
  resources :photos
  post 'photos/create' => 'photos#create'
end
