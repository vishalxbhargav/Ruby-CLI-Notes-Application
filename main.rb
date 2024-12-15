#Notes Taking Application
require_relative "./auth/registration.rb"
require_relative "./auth/login.rb"


while true
  puts "Please choose an option:"
  puts "1. Register"
  puts "2. Login"
  puts "3. Exit"
  puts
  print "Enter Option : "
  option=gets.to_i

  case option
  when 1
    register_user()
  when 2
    login_user()
  when 3
    puts "Goodby!"
    return;
  else 
    puts "!Invalid Option, Please retry again"
  end
end