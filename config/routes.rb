# frozen_string_literal: true

Rails.application.routes.draw do

  # Authentication
  devise_for :users

  # Root
  root to: 'home#index'

  # Dashboard
  namespace :dashboard do
    get '/' => 'home#index'
  end
end
