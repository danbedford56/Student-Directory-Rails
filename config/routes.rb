Rails.application.routes.draw do
  get 'welcome/index'
  get 'new' => 'students#new'
  resources :students

  root 'welcome#index', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
