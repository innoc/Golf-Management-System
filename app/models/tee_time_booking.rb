class TeeTimeBooking < ActiveRecord::Base
  belongs_to :user
  belongs_to  :golf_club
end