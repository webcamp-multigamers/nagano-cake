Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
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
  end
  scope module: :public do
    resources :items, only: [:index, :show]
 end
end
