Rails.application.routes.draw do

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users
    resources :users, only: [:show]

  authenticated :user do
    root 'users#index', as: :authenticated_root
  end
  root 'welcome#index'

  post :incoming, to: 'incoming#create'

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

end
