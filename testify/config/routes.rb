Rails.application.routes.draw do
  root to: 'site#index', as: :index

  #!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ USER ROUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!#
  # method    path                      controller#action           alias
  get         'users/new',              to: 'users#new',            as: :new_user
  post        'users',                  to: 'users#create'
  get         'users/:id/edit',         to: 'users#edit',           as: :edit_user
  patch       'users/:id',              to: 'users#update',          as: :update_user
  get         'users/:id',              to: 'users#show',           as: :user
  delete      'users/:id',              to: 'users#destroy',         as: :destroy_user

  #!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SESSION ROUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!#
    # method    path                      controller#action           alias
    get         '/login',                 to: 'sessions#new',         as: :login
    post        '/sessions',              to: 'sessions#create'
    get         '/logout',                to: 'sessions#destroy',      as: :logout

end
