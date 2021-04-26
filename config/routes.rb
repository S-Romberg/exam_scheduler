# frozen_string_literal: true

Rails.application.routes.draw do
  resources :api_requests
  resources :exam_windows
  resources :exams
  resources :colleges
  resources :users
  post '/users/schedule_test', to: 'users#schedule_test'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
