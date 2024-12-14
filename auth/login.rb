require_relative "..//service/userService.rb"
require_relative "..//utils/notesUtil.rb"


def login_user()
  user=User.new()
  userService=UserServiceImp.new()
  print "Enter a username : "
  user.username=gets.chomp.to_s
  print "Enter a password : "
  user.password=gets.chomp.to_s
  puts 
  result=userService.check_credentials(user)
  puts
  if(result)
    notesUtil=NotesUtil.new();
    notesUtil.notes_details(result)
  else
    puts "User not found"
  end
  
end