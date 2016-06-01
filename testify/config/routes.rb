Rails.application.routes.draw do
  
  root to: 'site#index', as: :index

  resources :users do
      resources :testimonies do
        resources :comments
      end
    end

  #!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SESSION ROUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!#
    # method    path                      controller#action           alias
    get         '/login',                 to: 'sessions#new',         as: :login
    post        '/sessions',              to: 'sessions#create'
    get         '/logout',                to: 'sessions#destroy',      as: :logout

end
