Rails.application.routes.draw do
  
  get 'relationships/create'

  get 'relationships/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'

  devise_for :users, controllers: {
  registrations: "users/registrations",
  omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  get 'blogs' => 'blogs#index'
  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do

   collection do
 #     member do
     post :confirm
    end
  end
  
#  get 'poems' => 'poems#index'
  resources :poems, only: [:index, :show]
 
 # get 'contacts' => 'contacts#new'
  
  get 'contacts' => 'contacts#new'
  resources :contacts, only: [:new, :create] do
    collection do 
      post :confirm
    end
  end
  
  resources :blogs do
    resources :comments
    post :confirm, on: :collection
  end
  
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

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