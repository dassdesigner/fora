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
  end

  def show
    @tag = Tag.find(params[:id])
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end

end
