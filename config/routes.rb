Rails.application.routes.draw do

  resource :password_reset, only: [:edit, :update, :new, :create]

  root to: 'static_pages#root'

  resource :session
  get '/users/guest', to: 'users#guest_login'
  get 'users/authenticate', to: 'users#reset_password'
  resources :users
  namespace :api, defaults: { format: :json } do
    resources :decks
    resources :cards
    resources :responses, only: :create
    resources :deck_shares, only: [:create, :destroy]
    resources :leaderboards, only: [:index, :show]
    resources :messages, only: [:create, :show, :index]
    resources :subs
    resources :posts, only: [:index, :create, :show]
    resources :comments, only: :create
  end
  get 'api/decks/:id/details', to: 'api/decks#details', defaults: { format: :json }
  get '/api/decks/:id/review', to: 'api/decks#review', defaults: { format: :json }
  get 'api/public/decks', to: 'api/decks#public_decks', defaults: { format: :json }
end
