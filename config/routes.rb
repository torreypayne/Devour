Rails.application.routes.draw do

  # root 'sessions#new'

  # resources :users
  resources :sessions
  resources :users

  namespace :api do
    resources :decks do
      resources :cards
    end
  end

end
