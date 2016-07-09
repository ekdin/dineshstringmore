class AddClubPicPaperclip < ActiveRecord::Migration
   def self.up
      add_column :clubs, :club_pic_file_name,    :string
      add_column :clubs, :club_pic_content_type, :string
      add_column :clubs, :club_pic_file_size,    :integer
      add_column :clubs, :club_pic_updated_at,   :datetime
    end
  
    def self.down
     remove_column :clubs, :club_pic_file_name
     remove_column :clubs, :club_pic_content_type
     remove_column :clubs, :club_pic_file_size
     remove_column :clubs, :club_pic_updated_at
   end
end
