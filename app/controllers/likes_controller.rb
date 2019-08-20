class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_talk

  def create
    Like.create(user_id: current_user.id, talk_id: @talk.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, talk_id: @talk.id)
    like.destroy
  end

  private

  def set_talk
    @talk = Talk.find(params[:talk_id])
  end
end