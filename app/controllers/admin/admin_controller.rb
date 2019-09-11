class Admin::AdminController < ApplicationController
  before_action :ensure_admin!
  before_action :set_notifications

  def ensure_admin!
    unless current_user.email=='tripura.anupama@codeastra.com'
      redirect_to root_path, notice: 'You are not admin'
    end
  end

  def set_notifications
    @notifications = Notification.where(recipient: current_user).last(10)
    @count = Notification.where(recipient: current_user).unread.count
  end
end