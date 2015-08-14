class Api::AnswersController < ApplicationController

  def create
    current_question.answers.new(answer_params)
    @answer.author_id = current_user.id
    @answer.question_id = current_question.id
    if @answer.save
      render :json => @answer
    else
      render :json => @answer.errors, :status => :unprocessable_entity
    end
  end

  def index
    @answers = current_question.answers
  end

  def show
    @answer = Answer.find(params[:id])
    render :show
  end

  private
    def answer_params
      params.require(:answer).permit(:body, :question_id)
    end

    def current_question
      if params[:id]
        @answer = Answer.find(params[:id])
        @question = Answer.question
      elsif params[:answer]
        @question = Question.find(params[:answer][:question_id])
      end
    end

end
