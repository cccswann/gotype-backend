Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :decks, only: [:index, :create]
      resources :cards, only: [:index, :show]
    end
  end
end

