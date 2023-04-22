Rails.application.routes.draw do
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

end
