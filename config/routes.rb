Ccbeni::Application.routes.draw do
  
  resources :cards_profiles

  resources :profiles

  resources :carddetails

  resources :mycredits
  resources :features
  match "cards/search" =>"cards#search"
  match "cards/find_cards_for_me" =>"cards#find_cards_for_me"
  match "cards/find_cards_for_my_purchase" =>"cards#find_cards_for_my_purchase"
  match "cards/add_tags"=>"cards#add_tags"
  match "profile/give_advice"=>"profiles#give_advice"
  match "cards/add_vote/:id"=>"cards#add_vote"
  match "cards/down_vote/:id"=>"cards#down_vote"

  match "add_to_profile" => "profiles#add_to_profile"
  match "add_to_profile/:id" => "profiles#add_to_profile"

  match "home/oldindex"=>"home#oldindex" 
  #match "users/index"  =>"users#index"
 
  resources :cards do
     resources :features
     resources :carddetails	
  end 

 
  #get \"users\/show\"
  get "cards/new"
  get "cards/show"

  root :to => "home#index"

  devise_for :users, :controllers => {:sessions =>"sessions",:confirmations=>"confirmations"}
  resources :users, :only =>[ :show,:index]
    
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
