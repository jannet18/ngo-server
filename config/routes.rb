Rails.application.routes.draw do
  resources :mpesas
  # get 'volunteers/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :volunteers, only: [:create]
  resources :programs do
    resources :categories, only: [:index, :show]
  end
  resources :students, only: [:index, :create]
  resources :products, only: [:index, :show]

  resources :mpesas
  post "/stkpush", to: "mpesas#stkpush"
end
