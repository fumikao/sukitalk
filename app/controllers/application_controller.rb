class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setting_modal_new
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :address, :sex, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birthday, :address, :sex, :profile])
  end

  # def after_sign_in_path_for(resource)
  #   user_path(current_user)
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  def setting_modal_new
    @talk = Talk.new
    @user_categories = CategoryUser.where(user_id: current_user.id)
    @select_lists = []
    @user_categories.each do |category_user|
      @select_lists.push(category_user.category)
    end
  end
end