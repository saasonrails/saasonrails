# frozen_string_literal: true

module Saasonrails
  module Operations
    class Base
      include Sidekiq::Job

      def perform(operation_id)
        @_operation = Operation.find(operation_id)
        @account = @_operation.account

        before_run
        run
        after_run
      rescue => error
        @_operation.update(status: "failed", error_message: error.message)
        raise error
      end

      def before_run
        @_operation.update!(status: "running")
      end

      def after_run
        @_operation.update!(status: "success")
      end

      def args
        HashWithIndifferentAccess.new(@_operation.arguments)
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
