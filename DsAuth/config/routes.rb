DsAuth::Engine.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'gate-test/blank', to: 'static_pages#blank'
end
