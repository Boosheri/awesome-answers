class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user

    if @answer.save
      # Notify question creator that they got a reply
      # using email
      # AnswerMailer.new_answer(@answer).deliver_now
      AnswerMailer.new_answer(@answer).deliver_later(wait: 5.seconds)

      redirect_to question_path(@question)
    else

      # For the list of answers
      @answers = @question.answers.order(created_at: :desc)
      render 'questions/show'
    end
  end


  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@answer.question)
    if can?(:crud, @answer)
      @answer.destroy
      redirect_to question_path(@answer.question)
    else
      # head will send an empty HTTP response with a particular reponse code
      # in this case :unauthorized code is 401
      # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
      head :unauthorized
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
