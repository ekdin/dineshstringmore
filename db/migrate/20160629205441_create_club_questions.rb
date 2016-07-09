class CreateClubQuestions < ActiveRecord::Migration
  def change
    create_table :club_questions do |t|
    	t.integer :club_id
    	t.integer :user_id
    	t.string  :content
    	t.integer :status
    	t.timestamps null: false
    end
    add_index :club_questions, :club_id
    add_index :club_questions, :user_id
  end
end
