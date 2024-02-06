# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers, path: '', path_names: {
                                     sign_in: 'login',
                                     sign_out: 'logout',
                                     registration: 'signup'
                                   },
                         controllers: {
                           sessions: 'customers/sessions',
                           registrations: 'customers/registrations'
                         }

  namespace :api do
    namespace :v1 do
      resources :books, only: [:create, :destroy]
    end
  end

  get 'current_customer', to: 'current_customer#index'
end
