# frozen_string_literal: true

module Saasonrails
  module Controllers
    module Onboarding
      module PersonalAccounts
        extend ActiveSupport::Concern

        included do
          layout "devise"

          skip_before_action :ensure_personal_account!
          before_action :require_empty_personal_account
        end

        def new
          @personal_account = current_user.build_personal_account
        end

        def create
          @personal_account = current_user.build_personal_account(create_params)
          @personal_account.personal_account = true

          current_user.personal_account = @personal_account

          if current_user.save!
            redirect_to root_path
          else
            render turbo_stream: turbo_stream.replace(@document, partial: "form", locals: {
              personal_account: @personal_account
            })
          end
        end

        private
          def create_params
            params.require(:account).permit(:name)
          end

          def require_empty_personal_account
            redirect_to root_path unless current_user.personal_account_id.nil?
          end
      end
    end
  end
end
