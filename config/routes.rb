Rails.application.routes.draw do

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users

  authenticated :user do
    root 'bookmarks#index', as: :authenticated_root
  end
  root 'welcome#index'

  post :incoming, to: 'incoming#create'

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

end
