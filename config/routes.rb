Rails.application.routes.draw do
  devise_for :users
   resources :users, only: [:index, :show, :edit, :update,]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'books#top'
  get "home/about" => "home#about"
  resources :books,only: [:new, :index, :create, :show, :edit, :update, :destroy]
end
