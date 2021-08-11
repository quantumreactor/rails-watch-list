Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :bookmarks, only: %i[new create show destroy]
  resources :lists, only: %i[index show new create]

  # lists
  #get '/lists', to: 'lists#index'

end
