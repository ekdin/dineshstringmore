class AnswersController<ApplicationController

	def create
		
		answer=Answer.new(answer_params)
		answer.save
		@answer=Answer.find(answer.id)
		@qid=@answer.club_question_id



	end

	def destroy

		@answer=Answer.find(params[:id])
		@answer.destroy
		respond_to do |format|
			format.js
		end	

	end
	private
	def answer_params

		params.require(:answer).permit(:club_question_id,:answer,:answer_pic).merge(:user_id=>current_user.id,:status=>1)

		
	end

end
