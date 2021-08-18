Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers, controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    ragistrations: "public/registrations"
  }

  scope module: :public do
    resources :cart_items, except: [:show, :new, :edit]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "cart_allcrear"
  end

  namespace :admin do
    resources :genres, except: [:show, :destroy, :new]
  end
end
