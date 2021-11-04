Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  get 'my_friends', to: 'users#my_friends'
  root 'welcome#index'
  devise_for :users
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'friends#search'
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
end
