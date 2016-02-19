Rails.application.routes.draw do
  get '/' => 'loans#index'

  get '/login' => 'loans#login'

  post 'loans/create' => 'loans#create'

  get 'borrowers/index'

  get 'borrowers/login' => 'borrowers#login'

  get 'borrowers/logout' => 'borrowers#logout'

  post 'borrowers/create' => 'borrowers#create'

  get 'borrowers/edit'

  get 'borrowers/update'

  get 'borrowers/destroy'

  get 'borrowers/:id' => 'borrowers#show'

  get 'lenders/index'

  get 'lenders/login' => 'lenders#login'

  get 'lenders/logout' => 'lenders#logout'

  post 'lenders/create' => 'lenders#create'

  get 'lenders/edit'

  get 'lenders/update'

  get 'lenders/destroy'

  get 'lenders/:id' => 'lenders#show'
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
