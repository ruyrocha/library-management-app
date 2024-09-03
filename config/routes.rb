# frozen_string_literal: true

Rails.application.routes.draw do
  concern :books_management do
    resources :books do
      resource :borrow, only: :create, controller: :borrowings
      resource :return, only: :create, controller: :returnings
    end
  end

  namespace :api do
    namespace :v1, defaults: { format: "json" } do
      concerns :books_management
    end
  end

  devise_for :users

  concerns :books_management

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "dashboard#index"

  resources :dashboard, only: :index
end
