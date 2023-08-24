# frozen_string_literal: true

module Saasonrails
  module Operations
    class Base
      include Sidekiq::Job

      def perform(notification_id, *args)
        @notification = Notification.find(notification_id)
        @notification.update(status: :running)
        run(*args)
        @notification.update(status: :finished)
      rescue StandardError => e
        @notification.update(status: :failed) # error: e.message
      end

      class << self
        def perform_async(*args)
          raise "Account is not set" unless ActsAsTenant.current_tenant

          notification = Notification.create!(status: :queued, message: self::default_message(*args))
          super(notification.id, *args)
        end

        def default_message(*args)
          "Running #{self.name} with args: #{args.inspect}"
        end
      end

      private
        def set_message(message)
          @notification.update(message:)
        end
    end
  end
end
