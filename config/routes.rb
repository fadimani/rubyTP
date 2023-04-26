Rails.application.routes.draw do
  get 'sessions/new'
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  get 'utilisateurs/new'
  get 'home/index'      # this has just been added for us, so we can navigate to home/index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home/about'
  get 'home/aide'
  get 'home/contact'
  root 'home#index'         #we can add this so it becomes the first thing that comes

  get 'aide' => 'home#aide'
  get 'home' => 'home#index'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  get 'signup' => 'utilisateurs#new'

  resources :utilisateurs

  resources :articles, only: [:create,:destroy]

  # get 'sessions/new'
  # after adding these last 3, get sessions/new isn't needed but it's nice to see

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'



end
