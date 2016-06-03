class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @user = User.find(params[:id])
   @comment = @user.comments.create(comment_params)
   @comment.user_id = current_user.id
  if @comment.save
    redirect_to testimony_path
  else
    flash.now[:danger] = "error"
  end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def edit
    @comment = Comment.find(params[:id])
    if allowed?(@comment.user_id)
    render :edit
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if allowed?(@comment.user_id)
      @comment.update(comment_params)
      redirect_to testimony_path
    else
      redirect_to testimony_path
      flash[:error] = 'You dont have access to edit this account'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
  params.require(:comment).permit(:comment)
  end
end
