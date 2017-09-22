Representaciones::Application.routes.draw do

  resources :cotizacions

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

  resources :pases, only: [:new, :create, :show]

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

  resources :tdepositos
  resources :thabitacions
  resources :programas

  devise_for :users

  root :to =>'reservas#index'

  ## Squeezer
  resources :users do
    member do
      get :roles
    end
  end

  resources :roles

  ##---


end

