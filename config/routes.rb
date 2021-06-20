Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "pokemons#index"

  resources :pokemons, only: [:index, :show]
end
