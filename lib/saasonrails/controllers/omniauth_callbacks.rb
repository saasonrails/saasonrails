# frozen_string_literal: true

module Saasonrails
  module Controllers
    module OmniauthCallbacks
      extend ActiveSupport::Concern

      attr_reader :external_login, :user

      included do
        skip_before_action :authenticate_user!, only: %i[developer]
        skip_before_action :verify_authenticity_token, only: %i[developer]

        before_action :set_external_login, except: %i[failure]
        before_action :set_user, except: %i[failure]
      end

      def developer
        raise "Only in development" unless Rails.env.development?
        handle_auth("developer")
      end

      def failure
        redirect_to root_path, alert: "Something went wrong"
      end

      private
        def handle_auth(kind)
          if external_login.present?
            external_login.update(external_login_attrs)
          else
            OauthExternalLogin.create(external_login_attrs.merge({ user: }))
          end

          if user_signed_in?
            flash[:notice] = "Your #{kind.titleize} account was connected."
            redirect_to edit_user_registration_path
          else
            flash[:notice] = "Your new user account was created!"
            sign_in_and_redirect user, event: :authentication
          end
        end

        def auth
          request.env["omniauth.auth"]
        end

        def external_login_attrs
          expires_at = auth.credentials.expires_at.present? ? Time.at(auth.credentials.expires_at) : nil
          {
            provider: auth.provider,
            uid: auth.uid,
            expires_at:,
            access_token: auth.credentials.token,
            access_token_secret: auth.credentials.secret,
          }
        end

        def set_external_login
          @external_login = OauthExternalLogin.where(provider: auth.provider, uid: auth.uid).first
        end

        def set_user
          if user_signed_in?
            @user = current_user
          elsif external_login.present?
            @user = external_login.user
          elsif User.where(email: auth.info.email).any?
            # 5. User is logged out and they login to a new account which doesn't match their old one
            flash[:alert] = "An account with this email already exists. Please sign in with that account before connecting your #{auth.provider.titleize} account."
            redirect_to new_user_session_path
          else
            @user = build_user
          end
        end

        def build_user
          User.new(
            email: auth.info.email,
            # name: auth.info.name,
            password: Devise.friendly_token[0, 20]
          )
        end
    end
  end
end
