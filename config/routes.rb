Rails.application.routes.draw do
  devise_for :users

  root to: 'diets#index'

  resources :users, only: [:show] do
  resources :blogs, only: [:index]
end

  
  get 'diets/:diet_id/likes' => 'likes#create'
  get 'diets/:diet_id/likes/:id' => 'likes#destroy'
  resources :diets


  resources :diets do
    resources :blogs
    resources :likes, only: [:create, :destroy]  # ← これが重要
    resources :comments, only: [:create]
  end

  
  resources :blogs
  resources :perfumes
end
 
