Trips::Application.routes.draw do
  # Routes for the Friend resource:
  # CREATE
  get '/friends/new', controller: 'friends', action: 'new', as: 'new_friend'
  post '/friends', controller: 'friends', action: 'create'
  get 'friendconfirm', controller: 'friends', action: 'friendconfirm'

  # READ
  get '/friends', controller: 'friends', action: 'index'
  get '/friends/:id', controller: 'friends', action: 'show', as: 'friend'

  # UPDATE
  get '/friends/:id/edit', controller: 'friends', action: 'edit', as: 'edit_friend'
  patch '/friends/:id', controller: 'friends', action: 'update'

  # DELETE
  delete '/friends/:id', controller: 'friends', action: 'destroy'
  #------------------------------

  # Routes for the Prospect resource:
  # CREATE
  get '/prospects/new', controller: 'prospects', action: 'new', as: 'new_prospect'
  post '/prospects', controller: 'prospects', action: 'create'

  # READ
  get '/prospects', controller: 'prospects', action: 'index'
  get '/prospects/:id', controller: 'prospects', action: 'show', as: 'prospect'

  # UPDATE
  get '/prospects/:id/edit', controller: 'prospects', action: 'edit', as: 'edit_prospect'
  patch '/prospects/:id', controller: 'prospects', action: 'update'

  # DELETE
  delete '/prospects/:id', controller: 'prospects', action: 'destroy'
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get '/comments/new', controller: 'comments', action: 'new', as: 'new_comment'
  post '/comments', controller: 'comments', action: 'create', as: 'commentpost'

  # READ
  get '/comments', controller: 'comments', action: 'index'
  get '/comments/:id', controller: 'comments', action: 'show', as: 'comment'

  # UPDATE
  get '/comments/:id/edit', controller: 'comments', action: 'edit', as: 'edit_comment'
  patch '/comments/:id', controller: 'comments', action: 'update'

  # DELETE
  delete '/comments/:id', controller: 'comments', action: 'destroy'
  #------------------------------

  root "trips#index"

  # Routes for sign-in/out
  get '/login' => 'session#new', :as => 'login'
  post '/sessions' => 'session#create', :as => 'sessions'
  post '/sessionback' => 'session#sessionback', :as => 'sessionback'
  delete '/sessions' => 'session#destroy', :as => 'session'


  # Routes for the User resource:
  # CREATE

  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create'
  post '/usersback', controller: 'users', action: 'createback', as: 'usersback'

  # READ
  get '/users', controller: 'users', action: 'index', as: 'users_url'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

  # Routes for the Trip_detail resource:
  # CREATE
  get '/trip_details/new', controller: 'trip_details', action: 'new', as: 'new_trip_detail'
  post '/trip_details', controller: 'trip_details', action: 'create'
  # post '/trip_details', controller: 'trips', action: 'show'

  # READ
  get '/trip_details', controller: 'trip_details', action: 'index'
  get '/trip_details/:id', controller: 'trip_details', action: 'show', as: 'trip_detail'

  # UPDATE
  get '/trip_details/:id/edit', controller: 'trip_details', action: 'edit', as: 'edit_trip_detail'
  patch '/trip_details/:id', controller: 'trip_details', action: 'update'

  # DELETE
  delete '/trip_details/:id', controller: 'trip_details', action: 'destroy'
  #------------------------------

  # Routes for the Trip resource:
  # CREATE

# TEST
  get '/friendtest', controller: 'trips', action: 'friendtest', as: 'friendtest'
# TEST

  get '/trips/new', controller: 'trips', action: 'new', as: 'new_trip'
  post '/trips', controller: 'trips', action: 'create', as: 'trips_url'

  # READ
  get '/trips', controller: 'trips', action: 'index'
  get '/trips/:id', controller: 'trips', action: 'show', as: 'trip'
  get '/mytrips', controller: 'trips', action: 'mytrips', as: 'my_trips'
# ADDED THIS ONE BELOW WHICH IS THE PAGE WHERE RECS ARE GIVEN
  get '/trips/:id/recs', controller: 'trips', action: 'recs', as: 'trip_recs'
# ADDED THIS ABOVE BELOW WHICH IS THE PAGE WHERE RECS ARE GIVEN

  # UPDATE
  get '/trips/:id/edit', controller: 'trips', action: 'edit', as: 'edit_trip'
  patch '/trips/:id', controller: 'trips', action: 'update'

  # DELETE
  delete '/trips/:id', controller: 'trips', action: 'destroy'
  #------------------------------

  #HOME PAGE

  get 'home', controller: 'trips', action: 'homepage'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
