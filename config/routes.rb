Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers, controllers: {
    sessions: "customer/sessions",
    passwords: "customer/passwords",
    ragistrations: "customer/registrations"
  }

  namespace :admin do
    resources :genres, except: [:show, :destroy, :new]
  end
end
