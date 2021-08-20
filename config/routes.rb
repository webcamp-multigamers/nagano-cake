Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  #カスタマーページのルーティング
  # get 'customer' => 'public/customers#show', as: "customer"
  # get 'customer/edit' => 'public/customers#edit', as: "edit_customer"
  # patch "customer/update" => "public/customers#update", as: "update_customer"
  scope module: :public do
    resource :customer, only: [:show, :edit, :update]
    get "customer/secession" => "customers#secession", as:"secession_customer"
    patch "customer/secede" => "customers#secede", as:"secede_customer"
    resources :items, only: [:index, :show]
    resources :cart_items, except: [:show, :new, :edit] do
      collection do
        delete :destroy_all
      end
    end
  end

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

  namespace :admin do
    resources :genres, except: [:show, :destroy, :new]
    resources :items
  end

end
