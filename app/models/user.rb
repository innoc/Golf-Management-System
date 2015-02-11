class User < ActiveRecord::Base
  has_many :tee_time_bookings

  validates_uniqueness_of :username
  validates_presence_of :username

  
  def self.authenticate(username)
    user = find_by_username(username)
    return user if user
  end  
end