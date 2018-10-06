Rails.application.routes.draw do
  get 'welcome/index'

  # creates a articles CRUD for routes  you can see with "rails routes"
  # this only did the routes, have to create a controller to know what to do as well.
  resources :articles do
    # this is nested, check to see hwhat we have with or without this when using 'rails routes' 
    # create CRUD for comments
    resources :comments
  end

  # set the home page of the site.
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
