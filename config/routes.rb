Representaciones::Application.routes.draw do
  resources :tdocs

  resources :direccions

  resources :pagos

  resources :pasajeros

  resources :agencias

  resources :operadoras

  resources :monedas

  resources :tarifas

  resources :reservas

  resources :thabitacions

  resources :programas

  devise_for :users
  
  root :to =>'blogs#index'
end
