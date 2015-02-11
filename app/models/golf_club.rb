class GolfClub < ActiveRecord::Base
  has_many :tee_time_bookings
end
