Rails.application.routes.draw do
  root 'static_pages#top'
  get '/terms', to: 'static_pages#terms', as: 'terms'
  get '/privacy', to: 'static_pages#privacy', as: 'privacy'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Defines the root path route ("/")
end
