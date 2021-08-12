Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'

  # resources :movies
  # resources :bookmarks #, only: %i[new create show destroy]
  # resources :lists #, only: %i[index show new create]
#
# The above resources definitions generate the following routes: 
#   ➜  rails-watch-list git:(master) ✗ rails routes     
#   Prefix Verb   URI Pattern                                                                              Controller#Action
#     root GET    /                                                                                        lists#index
#   movies GET    /movies(.:format)                                                                        movies#index
#          POST   /movies(.:format)                                                                        movies#create
# new_movie GET    /movies/new(.:format)                                                                    movies#new
# edit_movie GET    /movies/:id/edit(.:format)                                                               movies#edit
#    movie GET    /movies/:id(.:format)                                                                    movies#show
#          PATCH  /movies/:id(.:format)                                                                    movies#update
#          PUT    /movies/:id(.:format)                                                                    movies#update
#          DELETE /movies/:id(.:format)                                                                    movies#destroy
# bookmarks GET    /bookmarks(.:format)                                                                     bookmarks#index
#          POST   /bookmarks(.:format)                                                                     bookmarks#create
# new_bookmark GET    /bookmarks/new(.:format)                                                                 bookmarks#new
# edit_bookmark GET    /bookmarks/:id/edit(.:format)                                                            bookmarks#edit
# bookmark GET    /bookmarks/:id(.:format)                                                                 bookmarks#show
#          PATCH  /bookmarks/:id(.:format)                                                                 bookmarks#update
#          PUT    /bookmarks/:id(.:format)                                                                 bookmarks#update
#          DELETE /bookmarks/:id(.:format)                                                                 bookmarks#destroy
#    lists GET    /lists(.:format)                                                                         lists#index
#          POST   /lists(.:format)                                                                         lists#create
# new_list GET    /lists/new(.:format)                                                                     lists#new
# edit_list GET    /lists/:id/edit(.:format)                                                                lists#edit
#     list GET    /lists/:id(.:format)                                                                     lists#show
#          PATCH  /lists/:id(.:format)                                                                     lists#update
#          PUT    /lists/:id(.:format)                                                                     lists#update
#          DELETE /lists/:id(.:format)                                                                     lists#destroy
# rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
# rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
# rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# ➜ 

# These resources definitions come from the exercise solution
# https://github.com/lewagon/rails-watch-list/blob/solution-day-one/config/routes.rb
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    #resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  #resources :reviews, only: :destroy
# The above resources definitions generate the following routes: 
# ➜  rails-watch-list git:(master) ✗ rails routes
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        lists#index
#            list_bookmarks POST   /lists/:list_id/bookmarks(.:format)                                                      bookmarks#create
#         new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)                                                  bookmarks#new
#              list_reviews POST   /lists/:list_id/reviews(.:format)                                                        reviews#create
#                     lists GET    /lists(.:format)                                                                         lists#index
#                           POST   /lists(.:format)                                                                         lists#create
#                  new_list GET    /lists/new(.:format)                                                                     lists#new
#                      list GET    /lists/:id(.:format)                                                                     lists#show
#                           DELETE /lists/:id(.:format)                                                                     lists#destroy
#                  bookmark DELETE /bookmarks/:id(.:format)                                                                 bookmarks#destroy
#                    review DELETE /reviews/:id(.:format)                                                                   reviews#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# ➜  rails-watch-list git:(master) ✗ 

  
end
