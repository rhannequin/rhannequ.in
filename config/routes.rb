Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  caelus_routes = proc do
    root "home#index"

    resource :location, only: [:edit, :update], controller: :location
    resources :planets, only: [:show], param: :id
    resource :moon, only: [:show], controller: :moon
    resource :sun, only: [:show], controller: :sun
    resource :privacy_policy, only: :show, controller: :privacy_policy
    resource :cookie_consent,
      only: [:create, :destroy],
      controller: :cookie_consent
  end

  if Rails.env.development?
    namespace :caelus, &caelus_routes
  else
    constraints(Constraints::SubdomainConstraint.new(subdomain: "caelus")) do
      scope module: :caelus, as: :caelus, &caelus_routes
    end
  end

  root "about#index"
end
