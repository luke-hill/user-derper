# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, collection: { destroy_multiple: :delete } do
    get 'charts/search_history_by_day', to: 'charts#search_history_by_day'
    get 'charts/search_history_by_month', to: 'charts#search_history_by_month'
  end

  get 'charts/login_history', to: 'charts#login_history'

  delete '/users/:ids', to: 'users#destroy_multiple'# <- Not tried this yet, but copied from original delete request

  #resources :users, collection: { destroy_multiple: :delete } # To be worked out - I think this is duplicate code

  root 'users#index'
end
