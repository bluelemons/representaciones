Representaciones::Application.routes.draw do
  resources :depositos

  resources :tdepositos

  resources :entidads

  resources :tpagos

  resources :tentidads

  resources :tdocs

  resources :direccions

  resources :pagos

  resources :pasajeros
  match 'pasajeros_dni/:doc' => 'pasajeros#show' #Busca el pasajoer por DNI en /pasajeros_din/:doc
  
  match "operadoras" => redirect("/entidads/?search[tentidad_id_eq]=2")
  match "agencias" => redirect("/entidads/?search[tentidad_id_eq]=1")
  #resources :agencias
  #resources :operadoras

  resources :monedas

  resources :tarifas

  resources :reservas

  resources :thabitacions

  resources :programas

  devise_for :users
  
  root :to =>'blogs#index'
end
