# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_up: "create-account" }

  match "auth/:provider/callback", to: "omniauth_callbacks#callback", via: %i[get post]

  namespace :onboarding do
    resource :personal_account, only: %i[new create]
  end

  namespace :settings do
    resources :oauth_external_logins, only: %i[index], path: "connected-accounts"
  end

  # scope "(/team/:tenant_id)", tenant_id: /[^\/]+/ do; end
end
