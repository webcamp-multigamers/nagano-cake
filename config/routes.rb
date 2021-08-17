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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
