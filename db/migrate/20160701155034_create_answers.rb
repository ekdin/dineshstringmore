class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :club_question_id
    	t.integer :user_id
    	t.string  :answer
    	t.integer  :status
    	t.timestamps null: false
    end

    add_index :answers, :club_question_id
    add_index :answers, :user_id

  end
end
