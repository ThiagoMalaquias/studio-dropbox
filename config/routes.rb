Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"

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
end
