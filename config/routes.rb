Costracker::Application.routes.draw do
  get "site/index"
  root 'site#index'
end
