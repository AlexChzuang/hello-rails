Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: 'users', only: [:destroy] do
    collection do
      get :sign_in, action: 'new'
      post :sign_in, action: 'create'
    end
  end

  resources :restaurants
  root "restaurants#index"

end



  # get '/restaurants', to: 'restaurant#index'
  # get '/restaurants', to: 'create'
  # get '/new_restaurants', to: 'restaurant#new'
  # post :restaurant_list, to: 'restaurant#index'
  # post '/restaurant_list', to: 'restautant#list'

  # get '/about', to: 'pages#about'
  # get '/contact', to: 'pages#contact'

