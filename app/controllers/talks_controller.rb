class TalksController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @talks = @category.talks.order('id DESC')
  end

  def create
    talk = current_user.talks.new(talk_params)
    if talk.save
      redirect_to category_talks_path(talk_params[:category_id])
    else
      render 'new'
    end
  end

  def show
    @talk = Talk.find(params[:id])
    @comment = Comment.new
  end

  private

  def talk_params
    params.require(:talk).permit(:content, :category_id)
  end
end