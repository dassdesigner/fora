class Api::TagsController < ApplicationController

  def create
    if params[:question_id]
      question = Question.find(params[:question_id])
      @tag = Tag.find_or_initialize_by(tag_params)
      @tag.questions << question
      @tag.save!
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
    if params[:more_tags]
      @tags = Tag.all - current_user.tags
    else
      @tags = current_user.tags
      # @follows_hash = current_user.follows_hash
    end
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

    if !params[:destroy]
      @tag.users << current_user
    elsif params[:destroy]
       @tag.users - current_user
    end
      @tag.save!
      render json: @tag
  end

  def destroy
    @tag
    if params["tag_type"] == "user"
      @tag = current_user.tags.destroy(params[:id])
    elsif params["tag_type"] == "question"
      @tag = Question.find(params["question_id"]).tags.destroy(params[:id])
    end
    # @tag.destroy
    render json: @tag
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end

end
