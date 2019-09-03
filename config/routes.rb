Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'franchises#index'
  get 'records', to: 'pages#records', as: 'records'

  resources :franchises do
    resources :seasons do
      resources :stats
      resources :players
      resources :draftees
      resources :transactions
    end
  end
end
