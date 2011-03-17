Representaciones::Application.routes.draw do

  resources :agencias
  resources :operadoras

  resources :entidads do
    resources :saldos
  end

  resources :tpagos

  resources :tentidads

  resources :tdocs

  resources :movimientos do
    member do
      get :depositos
    end
  end

  resources :pasajeros
  match 'pasajeros_dni/:doc' => 'pasajeros#show' #Busca el pasajoer por DNI en /pasajeros_din/:doc

  resources :monedas

  resources :reservas

  resources :thabitacions

  resources :programas

  devise_for :users

  root :to =>'reservas#index'
end

