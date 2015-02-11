class CreateGolfClubs < ActiveRecord::Migration
  def change
    create_table :golf_clubs do |t|
      t.string :name
      t.timestamps
    end
  end
end
