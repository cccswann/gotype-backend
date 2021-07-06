Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :decks
      resources :cards
      resources :texts
      resources :scores
      resources :user
    end
  end
end

