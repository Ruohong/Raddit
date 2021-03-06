Rails.application.routes.draw do
  get 'votes/new'

  get 'votes/create'

  get "log_in" =>'sessions#new', :as => "log_in"
  get "log_out" => 'sessions#destroy', :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get "vote_up/:id" => 'votes#up', :as => "vote_up"
  get "vote_down/:id" => 'votes#down', :as => "vote_down"

  get "users/:id/post_show" => 'users#post_show', :as => "user/post_show"
    get "users/:id/comment_show" => 'users#comment_show', :as => "user/comment_show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'categories#index'
   resources :categories
   resources :users
   resources :sessions
   resources :posts

    shallow do
       resources :posts do
        resources :comments
       end
    end
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
