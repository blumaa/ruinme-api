Rails.application.routes.draw do
  resources :relationships, only: [:create]
  post '/relationships/decide', to: 'relationships#accept_or_decline'

  resources :users, only: [:index, :create]
  post '/sign_up', to: 'users#create'
  get '/users/:id', to: 'users#show'

  post '/users/:id/relationships', to: 'users#relationships'

  post '/login', to: 'auth#create'
  get '/profile', to: 'auth#show'

  post '/relationships/messages', to: 'messages#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
