# frozen_string_literal: true

module Saasonrails
  module Models
    module AccountUser
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        belongs_to :user
        belongs_to :account
      end
    end
  end
end
