Rails.application.routes.draw do

  root to: 'static_pages#root'

  resource :session
  get '/users/guest', to: 'users#guest_login'
  resources :users
  namespace :api, defaults: { format: :json } do
    resources :decks
    resources :cards
    resources :responses, only: :create
    resources :deck_shares, only: [:create, :destroy]
    resources :leaderboards, only: [:index, :show]
    resources :messages, only: [:create, :show, :index]
  end
  get '/api/decks/:id/review', to: 'api/decks#review', defaults: { format: :json }
  get 'api/public/decks', to: 'api/decks#public_decks', defaults: { format: :json }
end
