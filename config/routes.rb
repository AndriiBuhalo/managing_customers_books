Rails.application.routes.draw do
  get 'current_customer', to: 'current_customer#index'

  devise_for :customers, path: '', path_names: {
                                     sign_in: 'login',
                                     sign_out: 'logout',
                                     registration: 'signup'
                                   },
                         controllers: {
                           sessions: 'customers/sessions',
                           registrations: 'customers/registrations'
                         }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
