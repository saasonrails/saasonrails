# frozen_string_literal: true

require "active_support/concern"

module Saasonrails
  module Teamable
    module CurrentAccountHelper
      extend ActiveSupport::Concern

      included do
        before_action :load_current_account

        if respond_to?(:helper_method)
          helpers = %w[current_account account_selected?]
          helper_method(*helpers)
        end

        rescue_from Saasonrails::Teamable::MissingAccountError do
          redirect_to setup_account_path
        end
      end

      # Raise Teamable::MissingAccountError unless account_selected? is true.
      def authenticate_account!
        return unless user_signed_in?
        return if teamable_controller?

        raise Saasonrails::Teamable::MissingAccountError unless account_selected?
      end

      # Access current team.
      def current_account
        @current_account ||= Saasonrails::Teamable::Current.account
      end

      # Check if a team has been selected
      def account_selected?
        !!current_account
      end

      # Store an account id in a session variable.
      # Warning: this does not validate that the current_user
      # actually is a member of the specified account.
      def update_teamable_session_id!(account_id)
        session[:teamable_account_id] = account_id
      end

      private
        # Load current account from Account model and store it
        # in the Teamable::Current singleton.
        def load_current_account
          return unless user_signed_in?

          Saasonrails::Teamable::Current.account ||= account_from_session || current_user.personal_account
        end

        # Try to load current account using session[:teamable_account_id]
        def account_from_session
          return if session[:teamable_account_id].blank?

          current_user.accounts.find_by(id: session[:teamable_account_id])
        end
    end
  end
end
