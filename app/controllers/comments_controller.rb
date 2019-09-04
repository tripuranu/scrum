class CommentsController < ApplicationController
  before_action :find_dailyform
  before_action :find_comment, only: [:destroy, :edit, :update]
    
  def create
    @comment = @dailyform.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to edit_dailyform_path(@dailyform.date), notice: 'Commented!' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to edit_dailyform_path(@dailyform.date)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to edit_dailyform_path(@dailyform.date)
  end
  private

    def find_dailyform
      @dailyform = Dailyform.find(params[:dailyform_id])
    end

    def find_comment
      @comment = @dailyform.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
