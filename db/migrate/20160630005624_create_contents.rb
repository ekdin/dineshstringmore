class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
    	t.integer :story_id
    	t.string :content
    	t.string :content_type
    	t.integer :position
    	t.timestamps null: false
    end

    add_index :contents, :story_id
    add_index :contents, :content
    add_index :contents, :content_type
    add_index :contents, :position

  end
end
