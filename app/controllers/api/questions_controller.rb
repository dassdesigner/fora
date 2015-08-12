class Api::QuestionsController < ApplicationController

  def create
    @question = Question.find(params[:id])
    if @question.save
      render :json => @question
    else
      render :json => @question.errors, :status => :unprocessable_entity
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    render :json => @question
  end
end
