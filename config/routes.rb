Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :todos do
    resource :complete, only: [:update], module: :todos
  end

  root "todos#index"
end
