Newapp::Application.routes.draw do
  
  get "plivo/send_msg"

  get "/event_participations", to: "event_participations#index", as: :event_participations
  get "event_participations/index"
  get "event_participations/edit"
  get "event_participations/update"

  get "admin/index"
  get "/admin", :to => "admin#index", :as => :admin
  get "/home", :to => "events#index", :as => :home
  get "/events", :to => "events#index", :as => :home
  get "/profile", :to => "users#profile", :as => :profile
  get "/my_certifications", :to => "users#certifications", :as => :my_certifications
  get "/my_assets", :to => "users#assets", :as => :my_assets


  resources :paths


  resources :certifications


  resources :certification_assertions


  resources :users do
    member do
      post :add_certification
    end
  end


  resources :categories


  resources :events


  resources :skills


  resources :physical_assets


  get "users/sign_up"

  get   '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'users#profile'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
