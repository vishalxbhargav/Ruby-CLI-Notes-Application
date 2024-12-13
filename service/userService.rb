require 'json'
# module UserService
#   def create_user
#   end
#   def check_credentials
#   end
# end

class UserServiceImp
  # include UserService
  def create_user(user)
    begin
      if !user.username||!user.password
        raise "please provide valide Creadentials"
      end
      #get old json data
      file = File.read("./data/users.json")
      data = JSON.parse(file);
      
      #create new user
      hash_user={id:data.size+1,username:user.username,password:user.password,notes:[]}
      data<<hash_user
      p "Registration successful. Please log in."
      File.write('./data/users.json',JSON.dump(data)) 
    rescue SystemCallError =>e
      puts "Error : #{e.message}"
    end
  end


  def check_credentials(user)
    begin
      if !user.username||!user.password
        raise "please provide valide Creadentials"
      end
      #get old json data
      file = File.read("./data/users.json")
      data = JSON.parse(file);
      
      #check user credential
      data.each do |users|
        if users["username"]==user.username && users["password"]
          p "Login successful. Welcome, #{user.username}!"
          return true;
        end
      end
      
      return false;
    rescue SystemCallError =>e
      puts "Error : #{e.message}"
    end
  end
end