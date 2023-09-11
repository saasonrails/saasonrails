# frozen_string_literal: true

module Saasonrails
  module Models
    module Operation
      extend ActiveSupport::Concern
      include PublicUid::ModelConcern

      included do
        acts_as_tenant :account, counter_cache: true
        str_enum :status, [:queued, :running, :success, :failed]

        validates :worker_name, presence: true

        scope :for_toasts, -> { order(created_at: "DESC").take(3).reverse }

        after_create :run_async!
        after_create_commit -> { broadcast_append target: :operation_toasts, partial: "shared/operations/operation", locals: { operation: self } }
        after_update_commit -> { broadcast_replace_to :operation_toasts, partial: "shared/operations/operation", locals: { operation: self } }
        after_destroy_commit -> { broadcast_remove_to :operation_toasts }
      end

      def message
        if status == "success"
          worker_class::success_message(HashWithIndifferentAccess.new(payload))
        else
          worker_class::default_message(HashWithIndifferentAccess.new(payload))
        end
      end

      def run!
        worker_class.new.perform(id)
      end

      def run_async!
        worker_class.perform_in(2.seconds, id)
      end

      def icon_class
        case status.to_s
        when "queued"
          "fas fa-hourglass-start animate-pulse text-neutral-400"
        when "running"
          "fas fa-spin fa-spinner text-neutral-400"
        when "success"
          "fas fa-check-circle text-primary-700"
        when "failed"
          "fas fa-exclamation-circle text-rose-500"
        end
      end

      private
        def worker_class
          "#{worker_name}_operation".classify.constantize
        end
    end
  end
end
