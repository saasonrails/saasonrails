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
      rescue => e
        @operation.update!(status: :failed, error_message: e.message)
      end

      def before_run
        @operation.update!(status: :running)
      end

      def after_run
        @operation.update!(status: :success)
      end

      def args
        @args ||= HashWithIndifferentAccess.new(@operation.arguments)
      end

      class << self
        def default_message(args)
          "running #{self.name} operation"
        end

        def success_message(args)
          "Finished " + default_message(args).downcase
        end
      end
    end
  end
end
