# frozen_string_literal: true

module Saasonrails
  module Models
    module Notification
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        acts_as_tenant :account, counter_cache: true
        str_enum :status, [:notice, :queued, :running, :success, :error]
        validates :message, presence: true

        scope :for_realtime_frame, -> { where(status: [:queued, :running]) }
      end
    end
  end
end
