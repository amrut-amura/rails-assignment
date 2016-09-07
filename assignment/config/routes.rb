Rails.application.routes.draw do
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
# concern :sample do
#   resources :comments
# end
# resources :messages, concerns: :sample


scope module: 'admin' do
  resources :sigups
end
namespace :admin do
  resources :sigups
end

resources :companies do
  # member do 
  #     get 'add_address' , to: 'companies#add_address'
  #     post 'create_address',to: 'companies#create_address' 
  # end
  # member do
  #   get 'new_employee' , to: 'companies#new_employee'
  #   get 'create_employee' , to: 'companies#create_employee'
  # end
  post 'search' , to: 'companies#search'
  get 'logout', to: 'companies#logout'
  resources :employees 
end
  get 'doc/',to: 'companies#doc'
root 'companies#index'
  get 'login' , to: 'companies#login'
  post 'allow_login', to: 'companies#allow_login'


get 'check' => 'employees#check_employee'
# resources :companies

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

  #admin will be module 
end
