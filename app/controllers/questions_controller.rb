class QuestionsController < ApplicationController
  def new
  end

  def create
    @question = Question.new(question_params)
    @question.author_id = current_user.id

    if @question.save
      redirect_to question_url(@question)
    else
      flash.now[:errors] = @question.errors.full_messages
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    render :show;
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
