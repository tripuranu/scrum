class DailyformsController < ApplicationController

  def edit
    @date = Date.parse(params[:id])
    @dailyform = current_user.dailyforms.find_or_initialize_by(date: @date)
    @comments = Comment.where(dailyform_id: @dailyform)
  end

  def show
    @dailyform = Dailyform.find(params[:id])
  end

  def index
  end
  
  def create
    @dailyform = current_user.dailyforms.create(dailyform_params)

    respond_to do |format|
      if @dailyform.save
        format.html { redirect_to edit_dailyform_path(@dailyform.date), notice: 'Succesfully saved!'}
        format.json { render :show, status: :created, location: @dailyform }
      else
        format.html { render :new }
        format.json { render json: @dailyform.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @dailyform = current_user.dailyforms.find(params[:id])
    respond_to do |format|
      if @dailyform.update(dailyform_params)
        format.html { redirect_to edit_dailyform_path(@dailyform.date), notice: 'Succesfully Updated!' }
        format.json { render :show, status: :ok, location: @dailyform }
      else
        format.html { render :edit }
        format.json { render json: @dailyform.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def dailyform_params
      params.require(:dailyform).permit(:date, :yesterday, :today, :blockage)
    end
end