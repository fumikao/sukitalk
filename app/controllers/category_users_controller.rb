class CategoryUsersController < ApplicationController
  def create
    CategoryUser.create(category_id: params[:category_id], user_id: current_user.id)
    redirect_to category_talks_path(params[:category_id])
  end

  def destroy
    category_user = CategoryUser.find_by(category_id: params[:category_id], user_id: current_user.id)
    category_user.destroy
    redirect_to category_talks_path(params[:category_id])
  end
end