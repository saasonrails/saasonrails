# frozen_string_literal: true

module Saasonrails
  module Models
    module Account
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        validates :name, presence: true

        has_many :operations, dependent: :destroy
      end

      def create_operation(worker_name, arguments)
        operations.create(worker_name:, arguments:)
      end
    end
  end
end
