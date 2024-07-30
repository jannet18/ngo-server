Rails.application.routes.draw do
  # get 'volunteers/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :volunteers, only: [:create]
  resources :students
end
