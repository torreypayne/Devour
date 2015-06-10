Rails.application.routes.draw do

  root to: 'static_pages#root'

  resource :session
  resources :users
  namespace :api do
    resources :decks
    resources :cards
  end
end
