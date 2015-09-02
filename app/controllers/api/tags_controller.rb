class Api::TagsController < ApplicationController

  def create
    if params[:question_id]
      question = Question.find(params[:question_id])
      @tag = question.tags.create!(tag_params)
    else
      @tag = Tag.create!(tag_params)
    end

    # if @tag.save
      render :json => @tag
    # else
      # render :json => @tag.errors, :status => :unprocessable_entity
    # end
  end

  def index
    @tags = current_user.tags
    @follows_hash = current_user.follows_hash
  end

  def show
    @tag = Tag.find(params[:id])
    @follows_hash = {}
    @follows_hash[@tag.id] = @tag.tag_followings.find_by(user_id: current_user.id)
    @votes_hash = current_user.votes_hash("Question")
    # @followed = @tag.users.include?(current_user)
  end

  def update
    @tag = Tag.includes(:users).find(params[:id])
    user_ids = @tag.users.pluck(:id)
    if !params[:destroy] && @tag.update({user_ids: user_ids << current_user.id})
      render json: @tag
    elsif params[:destroy] && @tag.update({user_ids: user_ids - [current_user.id]})
      render json: @tag
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end

end
