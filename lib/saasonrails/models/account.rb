# frozen_string_literal: true

module Saasonrails
  module Models
    module Account
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        validates :name, presence: true

        has_many :notifications, dependent: :destroy
      end
    end
  end
end
