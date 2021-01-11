require './user'

class UserList < User

  def initialize
    @all_users = []
    @email, @first_name, @last_name = ''
  end

  def add_user
    get_inputs()
    unless @email.strip.nil? || @email.strip.empty?
      if is_uniq_email?
        @all_users << User.new(@email, @first_name, @last_name)
      else
        puts "Please Enter a uinq email!!"
      end
    else
      puts "Email Can not be blank!!"
    end
    reset_inputs
  end

  def reset_inputs
    @email, @first_name, @last_name = ''
  end

  def email_input
    puts "Please Enter the Email"
    @email = gets.chomp
  end

  def first_name_input
    puts "Please Enter the first name"
    @first_name = gets.chomp
  end

  def last_name_input
    puts "Please Enter the Last name"
    @last_name = gets.chomp
  end

  def get_inputs
    email_input
    first_name_input
    last_name_input
  end

  def find_user
    email_input
    @email.nil? ? find_user : find_and_update()
    reset_inputs
  end

  def update_user
    email_input
    @email.nil? ? update_user : find_and_update(true)
    reset_inputs
  end

  def is_uniq_email?
    selected_user = @all_users.select {|user| user.email == @email.strip}
    selected_user.empty? ? true : false
  end

  def find_and_update(update=false)
    @all_users.each do |user|
      if user.email == @email.strip
        if update
          first_name_input
          last_name_input
          user.first_name, user.last_name = @first_name, @last_name
        else
          puts "Email: #{user.email} First Name: #{user.first_name} Last name: #{user.last_name} "
        end
      end
    end
  end

end
