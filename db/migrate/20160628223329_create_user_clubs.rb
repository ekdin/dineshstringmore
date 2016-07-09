class CreateUserClubs < ActiveRecord::Migration
  def change
    create_table :user_clubs do |t|
    	t.integer :user_id
    	t.integer :club_id
    	t.timestamps null: false  

    end
    add_index :user_clubs, :user_id
    add_index :user_clubs, :club_id
    add_index :user_clubs, [:user_id, :club_id], unique: true
  end
end
