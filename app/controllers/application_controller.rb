class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :user_signed_in?

  def set_notifications
    @notifications = Notification.where(recipient: current_user).last(10)
    @count = Notification.where(recipient: current_user).unread.count
  end

end
