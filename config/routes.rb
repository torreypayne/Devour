Rails.application.routes.draw do

  root to: 'static_pages#root'

  resource :session
  resources :users
  namespace :api do
    # NAMESPACE YOUR CONTROLLERS ALSO!!!!
    resources :decks
    resources :cards
  end
end
