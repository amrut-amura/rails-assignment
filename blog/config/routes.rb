Rails.application.routes.draw do
  get 'welcome/index' , as: 'amrut'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
	get 'articles/app'
  resources :articles do
  	resources :comments
  end
  
end
