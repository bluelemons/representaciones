Representaciones::Application.routes.draw do

  resources :vencidas

  resources :vouchers do
    member do
      get :cargar
      get :bajar
    end
  end

  resources :entidads do
    resources :cuentas
  end

  resources :operadoras
  resources :agencies

  resources :movimientos
  resources :depositos
  resources :pagos
  resources :directos
  resources :cambios

  resources :pasajeros
  match 'pasajeros_dni/:doc' => 'pasajeros#show' #Busca el pasajoer por DNI en /pasajeros_din/:doc

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

