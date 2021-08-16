Rails.application.routes.draw do
  namespace :admin do
    resources :genres, except: [:show, :destroy, :new]
  end
end
