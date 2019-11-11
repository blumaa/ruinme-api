Rails.application.routes.draw do
  resources :relationships, only: [:create]
  post '/relationships/decide', to: 'relationships#accept_or_decline'

  resources :users, only: [:index, :create]
  post '/sign_up', to: 'users#create'
  get '/users/:id', to: 'users#profile'
  post '/users/:id/relationships', to: 'users#relationships'

  post '/login', to: 'auth#create'

  get '/relationships/:relationship_id/messages', to: "messages#index"
  post '/relationships/:relationship_id/messages', to: "messages#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
