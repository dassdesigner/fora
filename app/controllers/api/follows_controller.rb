class Api::FollowsController < ApplicationController
  def create
    @follow = current_user.tag_followings.new(follow_params)
    if @follow.save
      render json: @follow
    else
      render json: @follow.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = current_follow
    @follow.destroy
    render json: @follow
  end

  private
  def current_follow
    @current_follow ||= TagFollowing.find(params[:id])
  end

  def follow_params
    params.require(:follow).permit(:tag_id)
  end
end
