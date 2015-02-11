class CreateTeeTimeBookings < ActiveRecord::Migration
  def change
    create_table :tee_time_bookings do |t|
      t.string :timeslot
      t.integer :golf_club_id
      t.integer :user_id
      t.timestamps
    end
  end
end