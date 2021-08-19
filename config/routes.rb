Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  #カスタマーページのルーティング
  get 'customer' => 'public/customers#show', as: "customer"
  get 'customer/edit' => 'public/customers#edit', as: "customer_edit"

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
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :show, :create, :index] do
      collection do
        post "check"
        get "thanks"
      end
    end
  end
end
