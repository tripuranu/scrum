class Admin::DailyformsController < Admin::AdminController
  def index
    @users=User.all
  end
  def new
    @users=User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @date = Date.parse(params[:id])
    @dailyforms = Dailyform.where('date = ?', @date)
  end
end