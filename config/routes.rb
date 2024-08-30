Rails.application.routes.draw do
  get "profiles/show"
  devise_for :users
  # Ruta raíz (Home page)
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Rutas para usuarios
  resources :users, only: [:show, :edit, :update]

  # Rutas para publicaciones (posts) y comentarios
  resources :posts do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

  # Ruta para el chequeo de salud (health check)
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para PWA (Progressive Web App)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :profiles, only: [:show]

end
