Rails.application.routes.draw do

  root 'hikes#index'

  resources :users, only: [:index, :show, :new, :edit, :update, :create, :destroy]

  resources :posts, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #Tuesday, 1/5: added posts resources under users. A user makes posts.
  #If you do this, you'll need to rake routes, see new route names, and change accordingly.

  #Sessions methods below
  resources :sessions, only: [:destroy, :new, :create]

  #Targets methods

  get 'targets/' => 'targets#index', as: :targets

  #Hikes methods - The model you interact with
  resources :hikes, only: [:index, :show, :new, :edit, :update, :create, :destroy]

  #api/jack will only render index and show (JSON) for hike data.
  namespace :api do
    resources :jack, only: [:index, :show]
  end

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
