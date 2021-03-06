class AddQuestionPicPaperclip < ActiveRecord::Migration
  def self.up
  	add_column :club_questions, :question_pic_file_name, :string
  	add_column :club_questions, :question_pic_content_type, :string
  	add_column :club_questions, :question_pic_file_size, :integer
  	add_column :club_questions, :question_pic_updated_at, :datetime
  end
  def self.down
  	remove_column :club_questions, :question_pic_file_name, :string
  	remove_column :club_questions, :question_pic_content_type, :string
  	remove_column :club_questions, :question_pic_file_size, :integer
  	remove_column :club_questions, :question_pic_updated_at, :datetime
  end
end
