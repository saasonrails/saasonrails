# frozen_string_literal: true

module Saasonrails
  module Controllers
    module Application
      extend ActiveSupport::Concern

      # include Saasonrails::Teamable::CurrentAccountHelper
      include Saasonrails::Controllers::Secure

      included do
        set_current_tenant_through_filter
        before_action :setup_tenant
        helper_method :site_name
      end

      def default_url_options
        { tenant_id: params[:tenant_id] }
      end


      def site_name
        "SaaS on Rails"
      end

    private
      def setup_tenant
        current_account = load_current_account
        set_current_tenant(current_account)
      end

      # Load current account from Account model and store it
      # in the Teamable::Current singleton.
      def load_current_account
        return unless user_signed_in?

        team_from_url_prefix || current_user.personal_account
      end

      # Try to load current account using session[:teamable_account_id]
      def team_from_url_prefix
        return if params[:tenant_id].blank?

        current_user.teams.find_puid!(params[:tenant_id])
      end
    end
  end
end
