Rails.application.routes.draw do

  root to: 'static_pages#root'

  resource :session
  resources :users
  namespace :api, defaults: { format: :json } do
    # NAMESPACE YOUR CONTROLLERS ALSO!!!!
    resources :decks
    resources :cards
    resources :responses, only: :create
    # post 'cards/:id/response', action: 'cards#assess_quality'
  end
  get '/api/decks/:id/review', to: 'api/decks#review', defaults: { format: :json }
  get 'api/public/decks', to: 'api/decks#public_decks', defaults: { format: :json }
end
