Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/admins/sessions',
    passwords: 'admin/admins/passwords',
    registrations: 'admin/admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    ragistrations: "customers/registrations"
  }

  namespace :admin do
    resources :genres, except: [:show, :destroy, :new]
  end
end
