class TalksController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @talks = @category.talks.order('id DESC')
  end

  def new
    @talk = Talk.new
    @user_categories = CategoryUser.where(user_id: current_user.id)
    @select_lists = []
    @user_categories.each do |category_user|
      @select_lists.push(category_user.category)
    end
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
  end

  private

  def talk_params
    params.require(:talk).permit(:content, :category_id)
  end
end