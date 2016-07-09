class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
    	t.integer :story_id
    	t.integer :user_id
    	t.string  :comment
    	t.integer  :status
    	t.timestamps null: false
    end
    add_index :story_comments, :story_id
    add_index :story_comments, :user_id

  end
end
