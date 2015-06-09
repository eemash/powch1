class AddUserToVisits < ActiveRecord::Migration
  def change
    remove_column :visits, :restaurant
    remove_column :visits, :email
    remove_column :visits, :date

     add_column :visits, :user_id, :integer
     add_column :visits, :restaurant_id, :integer

     end
end
