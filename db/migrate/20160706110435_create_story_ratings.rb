class CreateStoryRatings < ActiveRecord::Migration
  def change
    create_table :story_ratings do |t|
    	t.integer :user_id
    	t.integer :story_id
    	t.integer :rate_category_id
    	t.integer :rate
    	t.string  :type
    	t.timestamps null: false 
    end
    add_index :story_ratings, :user_id
    add_index :story_ratings, :story_id
    add_index :story_ratings, :rate_category_id
    add_index :story_ratings, :rate
  end
end
