MkdPhilippines::Engine.routes.draw do
  resources :nationals, only: %i[index show]
  resources :regions, only: %i[index show]
  resources :provinces, only: %i[index show]
  resources :municipalities, only: %i[index show]
  resources :cities, only: %i[index show]
  resources :barangays, only: %i[index show]
end
