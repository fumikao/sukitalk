class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to talk_path(@comment.talk)
    # else
    #   @talk = @comment.talk
    #   render 'talks/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to talk_path(@comment.talk)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(talk_id: params[:talk_id])
  end
end