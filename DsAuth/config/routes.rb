DsAuth::Engine.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
