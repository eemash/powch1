class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :restaurant
      t.string :email
      t.date :date

      t.timestamps

    end
  end
end
