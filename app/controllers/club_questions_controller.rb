class ClubQuestionsController < ApplicationController

  def create

  	clubquestion=ClubQuestion.new(club_question_params)
    clubquestion.save
    @question=ClubQuestion.find(clubquestion.id)
  end

  def destroy
  	
  end

  #----------------- club page-----------------------------------------------------

  def getclubquestions

      @clubfeed={

                    questions: ClubQuestion.joins(' inner join clubs on clubs.id= club_questions.club_id').where(:club_id=>params[:id]).order(:created_at=>'desc').page(params[:page]).per(5)
                }
      @url='/club_question/'+params[:id].to_s+'/getclubquestions?&page='+(params[:page].to_i+1).to_s
      @pageid=params[:page]
      respond_to do |format|

        format.js

      end 

  end  
  

  #-----------------user club page----------------------------------

    def getuserclubquestions
      @user=User.find(params[:id])
      @club_ids=@user.clubs.pluck(:id)  

      @clubfeed={

                    questions: ClubQuestion.joins(' inner join clubs on clubs.id= club_questions.club_id').where('club_questions.club_id in (?)', @club_ids).order(:created_at=>'desc').page(params[:page]).per(5)
                }
      @url='/club_question/'+params[:id].to_s+'/getuserclubquestions?&page='+(params[:page].to_i+1).to_s
      @pageid=params[:page]
      respond_to do |format|

        format.js

      end 

  end  


  def upvote 
      @question = ClubQuestion.find(params[:id])
      @question.upvote_by current_user
       respond_to do |format|

        format.js

      end 
  end  

  def downvote
      @question = ClubQuestion.find(params[:id])
      @question.downvote_by current_user
       respond_to do |format|

        format.js

      end 
  end

  def question
     @club=Club.find(params[:id])
     @question=ClubQuestion.find(params[:qid])
    
  end

  private
   def club_question_params

   	  params.require(:club_question).permit(:club_id,:content,:question_pic).merge(:user_id=>current_user.id,:status=>1)
   	
   end

end
