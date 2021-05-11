# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development? || Rails.env.staging?
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
