class BookingController < ApplicationController

  def club_directory
    @clubs = GolfClub.all 
  end

  def book_time_slot
    unless current_user.tee_time_bookings.count > 1
      book_time = TeeTimeBooking.new(:timeslot => params[:time_value], :user_id=>current_user.id,:golf_club_id=>params[:golf_club_id])
      book_time.save
      flash[:notice]="You have successfully booked a time slot"

    else
      flash[:notice]="Not allowed to make more than two concurrent bookings"
    end 
    if request.post?       
      respond_to do |format| 
        format.html{redirect_to club_directory_path}
        format.js
       end
    end
  end 

  def cancel_time_slot
    tee_time = TeeTimeBooking.find(params[:time_slot_id])
    tee_time.destroy
    flash[:notice]="Your booking was deleted "
    if request.post?       
      respond_to do |format| 
        format.html{redirect_to club_directory_path}
        format.js
       end
    end
  end 
end