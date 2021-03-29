Rails.application.routes.draw do
  get '/restaurants', to: 'restaurant#index'
  get '/new_restaurants', to: 'restaurant#new'
  post :restaurant_list, to: 'restaurant#index'
  # post '/restaurant_list', to: 'restautant#list'
end

  # get '/about', to: 'pages#about'
  # get '/contact', to: 'pages#contact'

