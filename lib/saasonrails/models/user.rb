# frozen_string_literal: true

module Saasonrails
  module Models
    module User
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable

        has_many   :external_logins, class_name: "OauthExternalLogin"
        has_many   :account_users
        has_many   :teams, -> { where(personal_account: false) }, through: :account_users, source: :account

        belongs_to :personal_account, class_name: "Account", optional: true
      end
    end
  end
end
