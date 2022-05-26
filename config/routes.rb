Rails.application.routes.draw do
  get 'likes/show'
  get 'likes/new'
  get 'likes/create'
  get 'likes/delete'
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

  resources :ingredients, except: [:destroy]

  get '/chat', to: 'chatrooms#show'

  resources :messages, only: [:create]
end
