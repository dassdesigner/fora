class Api::AnswersController < ApplicationController

  def create
    @answer = current_question.answers.new(answer_params)
    @answer.author_id = current_user.id
    if @answer.save
      render :show
    else
      render :json => @answer.errors, :status => :unprocessable_entity
    end
  end

  def index
    @answers = current_question.answers.includes(:votes)
    @votes_hash = current_user.answer_votes_hash
    render :index
  end

  def show
    @answer = Answer.includes(:votes).find(params[:id])
    @votes_hash[@answer.id] = @answer.votes.find_by(user_id: current_user.id)
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

  def current_question
    if params[:id]
       Question.find(params[:id])
    elsif params[:answer]
       Question.find(params[:answer][:question_id])
    end
  end
end
