Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  post :incoming, to: 'incoming#create'

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

end
