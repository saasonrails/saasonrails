# frozen_string_literal: true

module Saasonrails
  module Controllers
    module OmniauthCallbacks
      extend ActiveSupport::Concern

      attr_reader :external_login, :user

      included do
        skip_before_action :authenticate_user!, only: %i[callback]
        skip_before_action :verify_authenticity_token, only: %i[callback]

        before_action :ensure_payload_has_email, except: %i[failure]
        before_action :set_external_login, except: %i[failure]
        before_action :set_user, except: %i[failure]
      end

      def callback
        if external_login.present?
          external_login.update(external_login_attrs)
        else
          OauthExternalLogin.create(external_login_attrs.merge({ user: }))
        end

        if user_signed_in?
          flash[:notice] = "Your #{payload.provider.titleize} account was connected."
          redirect_to edit_user_registration_path
        else
          sign_in_and_redirect user, event: :authentication
        end
      end

      def failure
        redirect_to root_path, alert: "Something went wrong"
      end

      private
        def payload
          @payload ||= begin
            request.env["omniauth.auth"]
          end
        end

        def ensure_payload_has_email
          return unless payload.dig(:info, :email).nil?

          if payload.provider == "github"
            token = payload["credentials"]["token"]
            email_response = RestClient.get("https://api.github.com/user/emails", Authorization: "token #{token}")
            email = JSON.parse(email_response).find { |e| e["primary"] }["email"]
            @payload["info"]["email"] = email
          else
            raise "Email not found in #{payload.provider.titleize} response"
          end
        end

        def external_login_attrs
          expires_at = payload.credentials.expires_at.present? ? Time.at(payload.credentials.expires_at) : nil
          {
            provider: payload.provider,
            uid: payload.uid,
            expires_at:,
            access_token: payload.credentials.token,
            access_token_secret: payload.credentials.secret,
          }
        end

        def set_external_login
          @external_login = OauthExternalLogin.where(provider: payload.provider, uid: payload.uid).first
        end

        def set_user
          if user_signed_in?
            @user = current_user
          elsif external_login.present?
            @user = external_login.user
          elsif User.where(email: payload.info.email).any?
            # 5. User is logged out and they login to a new account which doesn't match their old one
            flash[:alert] = "An account with this email already exists. Please sign in with that account first to link your #{payload.provider.titleize} account."
            redirect_to new_user_session_path
          else
            @user = build_user
          end
        end

        def build_user
          User.new(
            email: payload.info.email,
            password: Devise.friendly_token[0, 20]
          )
        end
    end
  end
end
