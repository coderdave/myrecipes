Rails.application.routes.draw do

  root "pages#home"
  get "pages/home", to: 'pages#home'

  resources :recipes do
    resources :comments, only: [:create]
  end

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :ingredients

  get '/chat', to: 'chatrooms#show'

  resources :messages, only: [:create]

  post '/recipes/:id/likes', to: 'likes#create', as: 'new_like'
  delete '/recipes/:id/unlike', to: 'likes#destroy', as: 'remove_like'

end
