class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to talk_path(@comment.talk)
    # else
    #   @talk = @comment.talk
    #   render 'talks/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(talk_id: params[:talk_id])
  end
end