# frozen_string_literal: true

module Saasonrails
  module Controllers
    module Secure
      extend ActiveSupport::Concern

      included do
        before_action :authenticate_user!
        before_action :ensure_personal_account!, if: :user_signed_in?, unless: :devise_controller?
      end

      private
        def ensure_personal_account!
          redirect_to new_onboarding_personal_account_path if current_user.personal_account_id.nil?
        end
    end
  end
end
