# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.order(created_at: :desc)
  end
end
