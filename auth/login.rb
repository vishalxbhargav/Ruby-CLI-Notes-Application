require_relative "..//service/userService.rb"


def login_user()
  user=User.new()
  userService=UserServiceImp.new()
  print "Enter a username : "
  user.username=gets.chomp.to_s
  print "Enter a password : "
  user.password=gets.chomp.to_i

  result=userService.check_credentials(user)

  if(result)
    puts "Please choose an option:"
    puts "1. Create Note"
    puts "2. View Notes"
    puts "3. Update Note"
    puts "4. Delete Note"
    puts "5. Export Specific Note to PDF"
    puts "6. Exit"


  else
    puts "User not found"
  end
  
end