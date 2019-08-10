class CategoriesController < ApplicationController
  
  def create
    category = Category.new(category_params)
    if category.save
      flash[:success] = "作成しました！"
      redirect_to root_path
    else
      render 'genre/index'
    end
  end

  def show
    @talks = Talk.where(category_id: params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name, :genre_id)
  end
end
