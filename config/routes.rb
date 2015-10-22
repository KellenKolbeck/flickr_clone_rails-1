Rails.application.routes.draw do
  devise_for :users
  root 'photos#index'
  post 'photos/create' => 'photos#create'
  resources :photos do
    resources :content_tags
  end

  resources :photos do
    resources :comments
  end
  
end
