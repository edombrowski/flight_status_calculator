Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Routes for the Airport resource:
  # CREATE
  get "/airports/new", :controller => "airports", :action => "new"
  post "/create_airport", :controller => "airports", :action => "create"

  # READ
  get "/airports", :controller => "airports", :action => "index"
  get "/airports/:id", :controller => "airports", :action => "show"

  # UPDATE
  get "/airports/:id/edit", :controller => "airports", :action => "edit"
  post "/update_airport/:id", :controller => "airports", :action => "update"

  # DELETE
  get "/delete_airport/:id", :controller => "airports", :action => "destroy"
  #------------------------------

  # Routes for the Program resource:
  # CREATE
  get "/programs/new", :controller => "programs", :action => "new"
  post "/create_program", :controller => "programs", :action => "create"

  # READ
  get "/programs", :controller => "programs", :action => "index"
  get "/programs/:id", :controller => "programs", :action => "show"

  # UPDATE
  get "/programs/:id/edit", :controller => "programs", :action => "edit"
  post "/update_program/:id", :controller => "programs", :action => "update"

  # DELETE
  get "/delete_program/:id", :controller => "programs", :action => "destroy"
  #------------------------------

  # Routes for the Flight resource:
  # CREATE
  get "/flights/new", :controller => "flights", :action => "new"
  post "/create_flight", :controller => "flights", :action => "create"

  # READ
  get "/flights", :controller => "flights", :action => "index"
  get "/flights/:id", :controller => "flights", :action => "show"

  # UPDATE
  get "/flights/:id/edit", :controller => "flights", :action => "edit"
  post "/update_flight/:id", :controller => "flights", :action => "update"

  # DELETE
  get "/delete_flight/:id", :controller => "flights", :action => "destroy"
  #------------------------------

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'flights#index'

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
