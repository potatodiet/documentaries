Documentaries::Application.routes.draw do
  root('welcome#index')

  devise_for(:users)

  resources('reviews', :only => ['create'])
  patch('review' => 'reviews#update', :as => 'review_update')

  resources('search', :only => [:index])
  resources('documentaries')
  resources('users', :only => [:show, :edit, :update])
end
