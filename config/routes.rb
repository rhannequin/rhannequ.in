Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  constraints(Constraints::SubdomainConstraint.new(subdomain: "caelus")) do
    scope module: :caelus, as: :caelus do
      root "home#index"

      resource :location, only: [:edit, :update], controller: :location
      resources :planets, only: [:show], param: :id
      resource :privacy_policy, only: :show, controller: :privacy_policy
      resource :cookie_consent,
        only: [:create, :destroy],
        controller: :cookie_consent
    end
  end

  root "about#index"
end
