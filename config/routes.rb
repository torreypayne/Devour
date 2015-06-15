Rails.application.routes.draw do

  namespace :api do
  get 'leaderboards/show'
  end

  namespace :api do
  get 'leaderboards/index'
  end

  get 'leaderboards/show'

  get 'leaderboards/index'

  root to: 'static_pages#root'

  resource :session
  resources :users
  namespace :api, defaults: { format: :json } do
    # NAMESPACE YOUR CONTROLLERS ALSO!!!!
    resources :decks
    resources :cards
    resources :responses, only: :create
    resources :deck_shares, only: [:create, :destroy]
    # post 'cards/:id/response', action: 'cards#assess_quality'
  end
  get '/api/decks/:id/review', to: 'api/decks#review', defaults: { format: :json }
  get 'api/public/decks', to: 'api/decks#public_decks', defaults: { format: :json }
end
