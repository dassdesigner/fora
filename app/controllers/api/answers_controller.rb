class Api::AnswersController < ApplicationController

  def create
    @answer = current_answer.answers.new(answer_params)
    @answer.author_id = current_user.id
    @answer.answer_id = current_answer.id
    if @answer.save
      render :show
    else
      render :json => @answer.errors, :status => :unprocessable_entity
    end
  end

  def index
    @answers = current_answer.answers
  end

  def show
    @answer = Answer.find(params[:id])
    render :show
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render json: @answer
  end

  def update
    if params[:value]
      @answer = Answer.includes(:voters).find(params[:id])
      voter_ids = @answer.voters.pluck(:id)
      current_user_vote = @answer.votes.find_by({user_id: current_user.id})
      if params[:value] == current_user_vote.value
        @answer.update({voter_ids: voter_ids - [current_user.id]})
      else
        @answer.update({voter_ids: voter_ids + [current_user.id]})
        current_user_vote.value = params[:value]
      end
    else
      @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        render :json => @answer
      else
        render :json => @answer.errors.full_messages
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :answer_id)
  end

  def current_answer
    if params[:id]
      @answer = Answer.find(params[:id])
      @answer = Answer.answer
    elsif params[:answer]
      @answer = Answer.find(params[:answer][:answer_id])
    end
  end
end
