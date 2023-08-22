# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end
end
