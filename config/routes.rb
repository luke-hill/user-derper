# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    get 'charts/user_search_history', to: 'charts#user_search_history'
  end

  get 'charts/login_history', to: 'charts#login_history'

  root 'users#index'

  resources :login_histories_charts
end
