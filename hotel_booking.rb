require './room'
require './user_list'

class Hotel

  def initialize
    @hotel_room = Room.new
    @hotel_guest = UserList.new
  end

  def input_txt
    puts "Welcome to ruby Hotel Booking System \n
          Enter 1: For Listing available rooms \n
          Enter 2: For Check-in into a room \n
          Enter 3: For Check-out of a room \n
          Enter 4: For  Add a Customer \n
          Enter 5: For Find a customer \n
          Enter 6: For Update a customer details (different attributes) \n
          Type and Enter quit: To quit from the programe
        "
  end

  def input_prompt
    input_txt
    until (a = gets.chomp) =~ /(?:ex|qu)it/i
      check_options(a.to_i)
      input_txt
    end
  end

  def check_options(input_val)
    case input_val
      when 1
        @hotel_room.display_rooms
      when 2
        @hotel_room.check_in_out(false)
      when 3
        @hotel_room.check_in_out(true)
      when 4
        @hotel_guest.add_user
      when 5
        @hotel_guest.find_user
      when 6
        @hotel_guest.update_user
      else
        puts "Please Retry again"
    end
  end
end

hotel = Hotel.new
hotel.input_prompt
