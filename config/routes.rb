Representaciones::Application.routes.draw do

  resources :entidads do
    resources :saldos
  end

  resources :operadoras
  resources :agencies


  resources :tpagos

  resources :tentidads

  resources :tdocs

  resources :movimientos
  resources :depositos
  resources :pagos
  resources :directos

  resources :pasajeros
  match 'pasajeros_dni/:doc' => 'pasajeros#show' #Busca el pasajoer por DNI en /pasajeros_din/:doc

  resources :monedas

  resources :reservas do
    resources :pagos
  end

  resources :thabitacions

  resources :programas

  devise_for :users

  root :to =>'reservas#index'

  ##Localidades
  #resources :departamentos

  resources :localidads

  #resources :provincias
  ##---

  ## Squeezer
  resources :users
  resources :roles
  ##---


end

