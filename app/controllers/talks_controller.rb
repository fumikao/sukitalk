class TalksController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @talks = @category.talks.order('id DESC')
  end
end