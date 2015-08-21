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
    if params[:query]
      @questions = (Question.topic_matches(params[:query]) + Question.title_matches(params[:query])).uniq
    else
      # maybe select for only topics current user is following?
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render json: @question
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
