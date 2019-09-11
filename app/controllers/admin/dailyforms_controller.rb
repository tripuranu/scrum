class Admin::DailyformsController < Admin::AdminController
  def index
    @notifications = Notification.where(recipient: current_user)
  end
  def new
    @users=User.all.paginate(:page => params[:page], :per_page => 10)
    @notifications = Notification.where(recipient: current_user)
  end
  def show
    @user = User.find(params[:id])
    @dailyforms = @user.dailyforms.order("date DESC").paginate(:page => params[:page], :per_page => 10)
  end
  def edit
    @date = Date.parse(params[:id])
    @dailyforms = Dailyform.where('date = ?', @date).paginate(:page => params[:page], :per_page => 10)
  end
end