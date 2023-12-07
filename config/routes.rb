Rails.application.routes.draw do
  # Defines the root path route ("/")
  namespace :admin do
    root "home#index"

    resources :grupos
    resources :midias
    resources :pastas
    resources :administradores
    resources :usuarios
    
    get 'login', to: 'login#index'
    post 'login', to: 'login#logar'
    get 'sair', to: 'login#deslogar'
  end


  root "home#index"
  resources :pastas
  resources :midias, only: [:show]

  get 'login', to: 'login#index'
  post 'login', to: 'login#logar'
  get 'sair', to: 'login#deslogar'
end
