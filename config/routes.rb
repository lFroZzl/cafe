Rails.application.routes.draw do
  get 'home/dashboard'

  root "home#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
