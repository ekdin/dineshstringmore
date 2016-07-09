class AddColumnToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :name, :string
  	 add_column :users, :bio, :string
  	 add_column :users, :mobile, :string
  	 add_column :users, :address, :string
  	 add_column :users, :city, :string
  	 add_column :users, :state, :string
  	 add_column :users, :country, :string

  end
end
