class TalksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @talks = @category.talks.order('id DESC')
  end

  def create
    talk = current_user.talks.new(talk_params)
    if talk.save
      redirect_to category_talks_path(talk_params[:category_id])
    end
  end

  def show
    @talk = Talk.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to category_talks_path(@talk.category)
  end

  private

  def talk_params
    params.require(:talk).permit(:content, :category_id)
  end
end