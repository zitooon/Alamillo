ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.resource :introduction, :controller => 'introduction'
  map.resource :login, :controller => 'login'
  map.resources :requests

  # Sample resource route within a namespace:
  map.namespace :admin do |admin|
    admin.resources :invitations
    admin.resources :requests, :only => [:index, :show, :destroy], :member => {:toggle_treated => :post}
    admin.resources :contents
    admin.resources :picture_categories
    admin.resources :pictures, :collection => {:search => :get, :albums => :get}
    admin.root :controller => 'requests', :action => 'index'
  end

  map.root :controller => 'introduction', :action => 'show'

  map.resource :accomodation, :controller => 'accomodation', :only => [:show], :member => {:blue_suite => :get, :tennis_house => :get, :main_house => :get} 

  map.resource :facilities, :controller => 'facilities', :only => [:show], :member => {:meeting_room => :get, :garden => :get, :gym_spa => :get, :games_room => :get}

  map.resource :surrounding_area, :controller => 'surrounding_area', :only => [:show]

  [:activities, :gastronomy, :contact, :estate, :services, :surroundings].each do |r|
    map.resource r, :controller => r.to_s, :only => [:show]
  end
  
  map.resource :gallery, :controller => 'gallery', :only => [:show], :member => {:album => :get}



  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
