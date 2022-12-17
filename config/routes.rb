# frozen_string_literal: true

Rails.application.routes.draw do

  # Authentication
  devise_for :users, {}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Root
  root to: 'home#index'

  # Dashboard
  namespace :dashboard do
    get '/' => 'home#index'
    resources :posts
  end
end
