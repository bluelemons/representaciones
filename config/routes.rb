Representaciones::Application.routes.draw do
  resources :entidads

  resources :tpagos

  resources :tentidads

  resources :tdocs

  resources :movimientos

  resources :pasajeros
  match 'pasajeros_dni/:doc' => 'pasajeros#show' #Busca el pasajoer por DNI en /pasajeros_din/:doc
  
  match "operadoras" => redirect("/entidads/?search[tentidad_id_eq]=2")
  #resources :operadoras
  match "agencias" => redirect("/entidads/?search[tentidad_id_eq]=1")
  #resources :agencias

  resources :monedas

  resources :reservas

  resources :thabitacions

  resources :programas

  devise_for :users
  
  root :to =>'reservas#index'
end
