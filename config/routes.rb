Rails.application.routes.draw do
  root to: 'toppages#index'
  post 'requests/destroy'
  get 'participates/create'
  get 'participates/index'
  get 'participates/show'
  get 'messages/index'
  get 'messages/show'
  get 'messages/create'
  get 'messages/destroy'
  get 'create/destroy'
  get 'rooms/create'
  get 'rooms/destroy'
  get 'rooms/show'
  get 'rooms/index'
  get 'accounts/index'
  get 'accounts/show'
  get 'accounts/new'
  post 'accounts/create'
  get 'accounts/edit'
  get 'accounts/update'
  get 'accounts/destroy'
  get 'accounts/communicator'
  get  'accounts/show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'toppages/index'
  
  
  post 'register', to: 'users#register'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  
  resources :users
  resources :organizations do
    collection do
      get :search
      get :searchtonew
    end
  end

  resources :accounts do
    member do
      get :requestings
      get :requested

    end
    collection do
      get :search
      post :reject
      post :accept 
    end
  end  
  
  resources :requests
    


      


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
