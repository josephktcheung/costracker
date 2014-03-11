Costracker::Application.routes.draw do
  root 'site#index'
  match '/privacy', to: 'site#privacy', via: 'get'
  match '/term', to: 'site#term', via: 'get'
end
