Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  get 'admin' => 'admin/homes#top'

  scope module: :public do
    # カスタマーページのルーティング
    resource :customer, only: [:show, :edit, :update]
    get "customer/secession" => "customers#secession", as:"secession_customer"
    patch "customer/secede" => "customers#secede", as:"secede_customer"
    resources :items, only: [:index, :show]
    resources :cart_items, except: [:show, :new, :edit] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, only: [:new, :show, :create, :index] do
      collection do
        post "check"
        get "thanks"
      end
    end
    # アドレスページのルーティング
    resources :addresses, only: [:index, :destroy, :edit, :update, :create]
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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
  end
end
