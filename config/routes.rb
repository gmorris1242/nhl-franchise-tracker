Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'franchises#index'

  get 'season', to: 'seasons#season'

  resources :franchises do
    resources :seasons do
      resources :stats
      resources :players
      resources :draftees
      resources :transactions
    end
  end
end
