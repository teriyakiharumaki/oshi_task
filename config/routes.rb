# frozen_string_literal: true

Rails.application.routes.draw do
  get 'oshi_profiles/edit'
  get 'oshi_profiles/update'
  root 'static_pages#top'
  resources :users, only: %i[new create show]
  resource :oshi_profile, only: %i[new create edit update destroy]
  get '/mypage', to: 'users#show', as: 'mypage'
  post '/tasks/:id/done' => 'tasks#done', as: 'done'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  resources :tasks do
    resources :subtasks, only: %i[index show new create edit update destroy] do
      post 'done', on: :member
      resources :third_tasks, only: %i[index show new create edit update destroy] do
        post 'done', on: :member
      end
    end
  end
  get '/terms', to: 'static_pages#terms', as: 'terms'
  get '/privacy', to: 'static_pages#privacy', as: 'privacy'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get 'test/500', to: 'application#raise500'
  get '*path', to: 'application#render404'
  match '/500', to: 'application#render500', via: :all
end
