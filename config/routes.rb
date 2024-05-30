Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  resources :tasks do
    resources :subtasks, only: %i[index show new create edit update destroy] do
      post 'done', on: :member
    end
  end
  post '/tasks/:id/done' => 'tasks#done', as: 'done'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get '/terms', to: 'static_pages#terms', as: 'terms'
  get '/privacy', to: 'static_pages#privacy', as: 'privacy'
  get '/contact', to: 'static_pages#contact', as: 'contact'
end
