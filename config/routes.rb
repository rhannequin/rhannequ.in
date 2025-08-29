Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  root "about#index"

  namespace :caelus do
    root "home#index"

    resource :location, only: [:edit, :update], controller: :location
    resources :planets, only: [:show], param: :id
  end
end
