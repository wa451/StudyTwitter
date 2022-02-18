Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'users' =>'users#index' 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#new'
  
  resources :tweets do
    collection do
      get 'desc'
    end
    collection do
      get 'like'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  
  end
end
