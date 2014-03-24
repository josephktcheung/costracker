Costracker::Application.routes.draw do
  root 'site#index'

  resources :users

  resources :items do
    post :fetch_details
  end

  resources :sellers

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'session#destroy' # TODO: remove before deployment

  get 'privacy' => 'site#privacy'
  get 'term' => 'site#term'
  get 'contact' => 'site#contact'

  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'
end