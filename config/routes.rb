# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'events/index'
  post 'events/create_event_a'
  post 'events/create_event_b'
  root 'events#index'
  get 'events/index'
end
