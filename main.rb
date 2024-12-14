#Notes Taking Application
require_relative "./auth/registration.rb"
require_relative "./auth/login.rb"



puts <<MESSAGE
Please choose an option:
1. Register
2. Login
3. Exit
MESSAGE
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