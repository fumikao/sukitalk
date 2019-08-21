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
    @age = params[:q][:birthday_in]
    @q = User.search(search_params)
    unless @age
      @result_users = @q.result(distinct: true)
    else
      @users = @q.result(distinct: true)
      @result_users = @users.select do |user|
        @age.include?("#{birthday_to_age(user.birthday)}")
      end
    end
  end

  private

  def search_params
    params.require(:q).permit(:nickname_cont, {sex_in: []}, {birthday_in: []}, {address_in: []})
  end
end