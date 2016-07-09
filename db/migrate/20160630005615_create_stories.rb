class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.integer :user_id
    	t.integer :club_id
    	t.string  :title
    	t.integer :status
    	t.timestamps null: false
    end
    add_index :stories, :user_id
    add_index :stories, :club_id
    add_index :stories, :title

  end
end
