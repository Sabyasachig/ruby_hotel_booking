class Room

  def initialize
    @rooms = [
      {type: 'Normal Room', avilable: 10, booked: 0},
      {type: 'Delux Room', avilable: 5, booked: 0},
      {type: 'Super Delux  Room', avilable: 3, booked: 0},
      {type: 'Suite Room', avilable: 1, booked: 0}
    ]
  end

  def room_type_input
    puts "Please enter the room type :"
    gets.chomp
  end

  def number_of_rooms_input
    puts "Please enter the number of rooms :"
    gets.chomp
  end

  def get_room_inputs
    [room_type_input, number_of_rooms_input]
  end

  def check_in_out(checkout=false)
    type, number = get_room_inputs
    unless type.nil? && number.to_i > 0
      checkout ? release_room(type, number) : book_room(type, number)
    else
      puts "Please Enter the correct information"
      check_in_out(checkout)
    end
  end

  def display_rooms
    puts "List of rooms --> "
    @rooms.each do |room|
      puts  "Room Type: #{room[:type]} ---> Available Rooms: #{room[:avilable] - room[:booked]}"
    end
  end

  #book a room based on type and number ,Ex: Normal Room, 5
  #Validate the room type and availability before confirmation
  def book_room(type, number)
    select_room_flag = false
    @rooms.each_with_index do |room, i|
        if room[:type].downcase == type.downcase
          select_room_flag = true
          if room[:avilable].to_i < (room[:booked].to_i + number.to_i)
            puts "Sorry we have only #{room[:avilable].to_i - room[:booked].to_i} room/s avilavle for the room type #{room[:type]}"
          else
            puts  "Congratulation we have sccesfully booked #{number} #{room[:type]} for you"
            @rooms[i][:booked] = room[:booked].to_i + number.to_i
          end
        end
    end
    puts "Sorry Please enter the correct room type" if select_room_flag === false
  end

  #release a room based on type and number ,Ex: Normal Room, 2
  #Validate the room type and number before release
  def release_room(type, number)
    select_room_flag = false
    @rooms.each_with_index do |room, i|
        if room[:type].downcase  == type.downcase
          select_room_flag = true
          if room[:booked].to_i < number.to_i
            puts "Sorry Wrong Input"
          else
            puts  "Congratulation you have sccesfully checked out #{number} #{room[:type]}"
            @rooms[i][:booked] = room[:booked].to_i - number.to_i
          end
        end
    end
    puts "Sorry Please enter the correct room type" if select_room_flag === false
  end

end
