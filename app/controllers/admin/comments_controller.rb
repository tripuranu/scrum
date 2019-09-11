class Admin::CommentsController < Admin::AdminController
  before_action :find_dailyform
  before_action :find_comment, only: [:destroy, :edit, :update]
    
  def show
    @comments = Comment.where(dailyform_id: @dailyform)
  end
  
  private

    def find_dailyform
      @dailyform = Dailyform.find(params[:dailyform_id])
    end

    def find_comment
      @comment = @dailyform.comments.find(params[:id])
    end
end