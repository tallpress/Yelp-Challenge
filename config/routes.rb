Rails.application.routes.draw do

  devise_for :users
  get 'yelp/index'

  get 'restaurants/new'

  resources :restaurants do
    resources :reviews
  end

  root 'yelp#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
