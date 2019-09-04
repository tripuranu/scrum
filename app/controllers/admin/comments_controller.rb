class Admin::CommentsController < Admin::AdminController
  before_action :find_dailyform
  before_action :find_comment, only: [:destroy, :edit, :update]
    
  def create
    @comment = @dailyform.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to admin_dailyform_comment_path(@dailyform.id), notice: 'Commented!' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @comments = Comment.where(dailyform_id: @dailyform)
  end
  
  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to admin_dailyform_comment_path(@dailyform.id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_dailyform_comment_path(@dailyform.id)
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