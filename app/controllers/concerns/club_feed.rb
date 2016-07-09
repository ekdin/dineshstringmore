module ClubFeed
	extend ActiveSupport::Concern

	def user_open_club_feed(club_id,page_parm)
		@clubfeed={
				stories: Story.joins(' inner join clubs on clubs.id= stories.club_id').where(:club_id=>club_id).order(:created_at=>'desc').page(page_parm).per(1),
				questions: ClubQuestion.joins(' inner join clubs on clubs.id= club_questions.club_id').where(:club_id=>club_id).order(:created_at=>'desc').page(page_parm).per(1)
			}
	end

	def user_club_feed(page_parm,club_ids)

		@clubfeed={
				stories: Story.joins(' inner join clubs on clubs.id= stories.club_id').where('stories.club_id in (?)',club_ids).order(:created_at=>'desc').page(page_parm).per(1),
				questions: ClubQuestion.joins(' inner join clubs on clubs.id= club_questions.club_id').where('club_questions.club_id in (?)',club_ids).order(:created_at=>'desc').page(page_parm).per(1)
			}
	end
end
