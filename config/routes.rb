# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users

  root 'users#index'

  resources :login_histories_charts
end
