class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
    	t.string :name
    	t.string :description 
    	t.integer :interest_id
    	t.integer :user_id
    	t.integer :status
    	t.timestamps null: false  
    end
  end
end
