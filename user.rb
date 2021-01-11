class User
  attr_accessor :email, :first_name, :last_name

  def initialize(email, first_name, last_name)
    @email, @first_name, @last_name = email, first_name, last_name
  end
end
