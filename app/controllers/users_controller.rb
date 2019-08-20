class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @categories = []
    @user.category_users.each do |category_user|
      @categories << category_user.category
    end
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
  end

  private

  def search_params
    params.require(:q).permit(:nickname_cont, :sex_eq, :address_eq)
  end
end