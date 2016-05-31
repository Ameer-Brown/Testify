Rails.application.routes.draw do
  root to: 'site#index', as: :index
  # method    path                      controller#action           alias
  get         'users/new',              to: 'users#new',            as: :new_user
  post        'users',                  to: 'users#create'
  get         'users/:id/edit',         to: 'users#edit',           as: :edit_user
  patch       'users/:id',              to: 'users#update'
  get         'users/:id',              to: 'users#show',           as: :user
  delete      'users/:id',              to: 'users#destroy'

end
