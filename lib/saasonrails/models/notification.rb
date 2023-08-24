# frozen_string_literal: true

module Saasonrails
  module Models
    module Notification
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        acts_as_tenant :account, counter_cache: true
        str_enum :status, [:notice, :queued, :running, :finished, :failed]
        validates :message, presence: true

        scope :for_toasts, -> { where("STATUS != ? AND STATUS != ?", :notice, :finished).order(status: "DESC", created_at: "DESC").take(3).reverse }

        after_update_commit -> { broadcast_replace_to [:notification_toasts], partial: "shared/notifications/notification", locals: { notification: self } }
      end

      def icon_class
        case status.to_s
        when "queued"
          "fas fa-hourglass-start animate-pulse text-neutral-400"
        when "running"
          "fas fa-spin fa-spinner text-neutral-400"
        when "finished", "notice"
          "fas fa-check-circle text-primary-700"
        when "failed"
          "fas fa-exclamation-circle text-rose-500"
        end
      end
    end
  end
end
