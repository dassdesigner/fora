class Api::TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render :json => @tag
    else
      render :json => @tag.errors, :status => :unprocessable_entity
    end
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end

end
