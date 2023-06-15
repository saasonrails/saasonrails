# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_up: "create-account" }, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  namespace :onboarding do
    resource :personal_account, only: %i[new create]
  end
end
