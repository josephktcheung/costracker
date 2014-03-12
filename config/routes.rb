Costracker::Application.routes.draw do
  root 'site#index'
  get 'privacy' => 'site#privacy'
  get 'term' => 'site#term'
  get 'contact' => 'site#contact'
end
