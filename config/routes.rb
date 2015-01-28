Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do 

      resources :users, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit] 
      end

    end
  end
  

  resources :users, except: [:new, :edit] do
    resources :tasks, except: [:new, :edit] 
  end

  # deleted explicit resource for tasks
  # error was in the post action in the tasks controller status: :created, LOCATION: @TASK
  # the location: @task was directing the response to "task_url" which didn't exist so I
  # created an explicit interpolated path based on the user as well "users/#{@user.id}/tasks/#{@task.id}"
  # this is so that it still returns the location of the object but that it hits the right nested resource

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
