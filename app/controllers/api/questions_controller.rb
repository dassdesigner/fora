class Api::QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.author_id = current_user.id
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
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      render :json => @question
    else
      render :json => @question.errors.full_messages
    end
  end


  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
