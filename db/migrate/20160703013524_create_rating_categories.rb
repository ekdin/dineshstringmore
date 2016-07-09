class CreateRatingCategories < ActiveRecord::Migration
  def change
    create_table :rating_categories do |t|
    	t.string :name
    	t.timestamps null: false
    end
    add_index :rating_categories, :name
  end
end
