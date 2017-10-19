# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users

  resources :charts
  get 'charts/login_histories', to: 'charts#login_histories'

  root 'users#index'

  resources :login_histories_charts
end
