class Admin::AdminController < ApplicationController
  before_action :ensure_admin!

  def ensure_admin!
    unless current_user.email=='tripura.anupama@codeastra.com'
      redirect_to root_path, notice: 'You are not admin'
    end
  end
end