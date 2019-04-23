class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
      question = Question.find params[:question_id]
      like = Like.new(user: current_user, question: question)
      
      unless can?(:like, question)
        #if this is true, skip. if false, run this. above is same as below
        # if not can?(:like, question)
        flash[:danger] = "that's a nit narcissistic.."
        return redirect_to question_path(question)
      end
      if like.save
        flash[:success] = "Question Liked!"
      else
        flash[:danger] = "Already Liked..."
      end
  
      redirect_to question_path(question)
    end
  
    def destroy
      question = Question.find params[:question_id]
      like = Like.find params[:id]
      
      like.destroy
  
      flash[:success] = "Question Unliked!"
      redirect_to question_path(question)
    end
end