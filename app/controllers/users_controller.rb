class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @categories = []
    @user.category_users.each do |category_user|
      @categories << category_user.category
    end
  end
end