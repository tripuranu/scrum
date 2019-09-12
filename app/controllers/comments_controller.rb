class CommentsController < ApplicationController
  before_action :find_dailyform
  before_action :find_comment, only: [:destroy, :edit, :update]
    
  def create
    @comment = @dailyform.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        if (@dailyform.users).include?(@dailyform.user)
          ((@dailyform.users.uniq)-[current_user]).each do |user|
            if @dailyform.comments.count == 1
              Notification.create(recipient: user, actor: current_user, action: "commented", notifiable: @comment)
            else
              Notification.create(recipient: user, actor: current_user, action: "replied", notifiable: @comment)
            end
          end
        else
          ((@dailyform.users.uniq << @dailyform.user)-[current_user]).each do |user|
            if @dailyform.comments.count == 1
              Notification.create(recipient: user, actor: current_user, action: "commented", notifiable: @comment)
            else
              Notification.create(recipient: user, actor: current_user, action: "replied", notifiable: @comment)
            end
          end
        end
        format.html { redirect_back fallback_location: root_path, notice: 'Commented!' }
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
      flash[:notice] = "Updated"
      redirect_back fallback_location: root_path  
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_back fallback_location: root_path
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
