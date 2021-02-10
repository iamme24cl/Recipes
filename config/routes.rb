Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/recipes/top_rated' => 'recipes#top_rated'

  resources :reviews, except: [:destroy]
  resources :recipe_ingredients
  resources :recipes do
    resources :recipe_ingredients, only: [:new]
    resources :reviews, only: [:new, :index]
  end

  resources :users, except: [:destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
