Rails.application.routes.draw do
  resources :relationships, only: [:create]
  post '/relationships/decide', to: 'relationships#accept_or_decline'

  resources :users, only: [:index]
  post '/sign_up', to: 'users#sign_up'
  get '/users/:id', to: 'users#profile'
  post '/users/:id/relationships', to: 'users#relationships'

  get '/relationships/:relationship_id/messages', to 'messages#index'
  post '/relationships/:relationship_id/messages', to 'messages#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
