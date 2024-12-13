require_relative "..//service/userService.rb"
require_relative "../model/user"

def register_user()
  userService=UserServiceImp.new()
  print "Enter a username : "
  username=gets.chomp.to_s
  print "Enter a password : "
  password=gets.chomp.to_s
  user=User.new()
  user.id=0;
  user.username=username;
  user.password=password;
  userService.create_user(user)
  
end