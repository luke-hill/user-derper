# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    get 'charts/search_history_by_day', to: 'charts#search_history_by_day'
    get 'charts/search_history_by_month', to: 'charts#search_history_by_month'
  end

  get 'charts/login_history', to: 'charts#login_history'

  root 'users#index'
end
