module BookingHelper

  def create_time_slots(time_seperation)
    time = Time.new
    duration_time = []
    start_time = Time.local(time.year,time.month,time.day,9,0,0) 
    end_time =  Time.local(time.year,time.month,time.day,17,0,0) 
    while start_time  <  end_time
      start_time_old = start_time
      start_time += time_seperation.minutes
      duration_time << "#{start_time_old.strftime("%H:%M%p")} - #{start_time.strftime("%H:%M%p")}" 
      start_time += 1.minutes
    end 
    return duration_time
  end 

  def user_booking_restriction(time_slot,user,golf_club)
    time_slot_object = user.tee_time_bookings.where(["timeslot = ? and golf_club_id = ? ",time_slot, golf_club.id])[0]
    booked_status = TeeTimeBooking.where(["timeslot = ? and golf_club_id = ? ", time_slot, golf_club.id])[0]
    return "yes" if time_slot_object.blank? and booked_status.blank?
    return  "booked" if time_slot_object.blank? and !(booked_status.blank?)
    return  time_slot_object if !(time_slot_object.blank?)
  end
    
end