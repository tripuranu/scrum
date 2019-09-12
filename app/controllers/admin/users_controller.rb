class Admin::UsersController < Admin::AdminController
  def destroy
    @user = User.find(params[:id])
  
    if @user.destroy
      redirect_to new_admin_dailyform_path, notice: "User deleted."
    else
      redirect_to new_admin_dailyform_path, flash: { error: "User could not be deleted." }
    end
  end
end