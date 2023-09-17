# frozen_string_literal: true

module Saasonrails
  module Operations
    class Base
      include Sidekiq::Job

      def perform(operation_id)
        @operation = Operation.find(operation_id)
        @account = @operation.account

        before_run
        run
        after_run
      rescue => error
        @operation.update(status: "failed", error_message: error.message)
        raise error
      end

      def before_run
        @operation.update!(status: "running")
      end

      def after_run
        @operation.update!(status: "success")
      end

      def args
        HashWithIndifferentAccess.new(@operation.payload)
      end

      class << self
        def default_message(args)
          "running #{self.name} operation"
        end

        def success_message(args)
          default_message(args)
        end
      end
    end
  end
end
