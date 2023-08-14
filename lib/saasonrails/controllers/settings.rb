# frozen_string_literal: true

module Saasonrails
  module Controllers
    module Settings
      extend ActiveSupport::Concern

      included do
        before_action :setup_settings_breadcrumb
      end

      private
        def ensure_personal_account!
          redirect_to new_onboarding_personal_account_path if current_user.personal_account_id.nil?
        end

        def setup_settings_breadcrumb
          breadcrumb 'Settings', '#'
        end
    end
  end
end
