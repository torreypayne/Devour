Rails.application.routes.draw do

  root to: 'static_pages#root'

  resource :session
  resources :users
  namespace :api, defaults: { format: :json } do
    # NAMESPACE YOUR CONTROLLERS ALSO!!!!
    resources :decks
    resources :cards
    post 'cards/:id/response', action: 'cards#assess_quality'
  end
end
