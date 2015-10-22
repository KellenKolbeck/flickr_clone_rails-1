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

  resources :users

  resources :photos do
    resources :favorites
  end
  # post '/photo/:photo_id/favorites' => 'favorites#create'
  post '/photos/:photo_id/favorite' => "favorites#create", as: :create_favorite

end


# get "/helpcenter" => "forums#index", :as => :forums
# post "/helpcenter" => "forums#create", :as => :create_forum
