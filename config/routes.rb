Rails.application.routes.draw do
get 'users/:id/followed' => 'users#followed', as:'followed'
get 'users/:id/follower' => 'users#follower', as: 'follower'
get 'search' => 'search#search', as: 'search'
devise_for :users
resources :users,only: [:show,:index,:edit,:update] do
	resource :relationships, only: [:create, :destroy]
end
root 'home#top'
get 'home/about'

	resources :books do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
 	end


end