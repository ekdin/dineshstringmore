class CreateUserRatings < ActiveRecord::Migration
  def change
    create_table :user_ratings do |t|
    	t.integer :user_id
    	t.integer :story_id
    	t.string  :post_type
    	t.integer :rate
    	t.timestamps null: false
    end
    add_index :user_ratings, :user_id
    add_index :user_ratings, :story_id
    add_index :user_ratings, :rate
  end
end
