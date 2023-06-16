# frozen_string_literal: true

module Saasonrails
  module Models
    module OauthExternalLogin
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        belongs_to :user
      end
    end
  end
end
