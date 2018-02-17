Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
  root :to => 'devise/sessions#new'
end
  resources :posts do
  	resources :comments
  	resources :upvotes , only: :create
  	resources :downvotes , only: :create
  end
  resources :users , only: :show do
  	resources :follows, only:[:create , :destroy]
	end
  resources :searches
end
