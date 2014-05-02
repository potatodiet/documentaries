Documentaries::Application.routes.draw do
  root 'welcome#index'

  resources 'reviews', only: ['create']
  patch 'review' => 'reviews#update', as: 'review_update'

  get 'user/view/:id' => 'users#show'
  get 'user/edit' => 'users#edit', as: 'user_edit'
  patch 'user/edit' => 'users#update'

  get 'user/sign_up' => 'users#new', as: 'sign_up'
  post 'user/sign_up' => 'users#create'
  get 'user/sign_in' => 'sessions#new', as: 'sign_in'
  post 'user/sign_in' => 'sessions#create'
  get 'user/sign_out' => 'sessions#destroy', as: 'sign_out'

  get 'view/:title' => 'documentaries#show'
  get 'user/upload' => 'documentaries#new', as: 'upload'
  post 'user/upload' => 'documentaries#create'

  get 'documentary/edit/:id' => 'documentaries#edit', as: 'documentary_edit'
  patch 'documentary/edit/:id' => 'documentaries#update'

  resources 'search', only: ['index']
end
