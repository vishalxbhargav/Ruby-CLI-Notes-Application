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
      #check if username already present
      if find_user_by_name(data,user.username)
        puts 
        raise "username already exist try different username !"
      end
      #create new user
      hash_user={id:data.size+1,username:user.username,password:user.password,notes:[]}
      data<<hash_user
      #update json data
      File.write('./data/users.json',JSON.dump(data)) 
      p "Registration successful. Please log in."
    rescue SystemCallError =>e
      puts "Error : #{e.message}"
    rescue Exception =>e
      puts e.message
    end
  end
  def find_user_by_name(data,username)
    data.each do |user|
      if user["username"]==username
        return true
      end
    end
    return false
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
        if users["username"]==user.username && users["password"]==user.password
          p "Login successful. Welcome, #{user.username}!"
          return users["id"];
        end
      end
      
      return false;
    rescue SystemCallError =>e
      puts "Error : #{e.message}"
    end
  end
end