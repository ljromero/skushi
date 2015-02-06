Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'API/:devel_id/users/:user_ext_id/posts' => 'api_user#get_posts', as: :api_get_user_posts
  get 'API/:devel_id/users/:user_ext_id/following' => 'api_user#get_following', as: :api_get_user_following
  get 'API/:devel_id/users/:user_ext_id/followers' => 'api_user#get_followers', as: :api_get_user_followers
  
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
  resources :users do
    member do
      get 'follower_posts'
    end
    resources :posts
  end

  get 'users/:user_id/follow/:friend_id' => 'users#follow', as: :follow_user
  get 'users/:user_id/unfollow/:friend_id' => 'users#unfollow', as: :unfollow_user
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
