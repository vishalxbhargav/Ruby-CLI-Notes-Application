require_relative "../model/notes.rb"
require_relative "../utils/generatePdf.rb"
require 'json'

class NotesService
    def create_note(id)
        begin
            note=Note.new();
            puts 
            print "Enter note title : "
            note.title=gets.chomp.to_s
            print "Enter note content : "
            note.content=gets.chomp.to_s

            if !note.title||!note.content
                raise "please provide valide Creadentials"
            end
            #get user data
            file = File.read("./data/users.json")
            data = JSON.parse(file);
            
            #get user credential
            data.each do |users|
                if users["id"]==id
                    hash_note={}
                    if users["notes"].length<0
                        hash_note[:id]=1
                    else 
                        hash_note["id"]=users["notes"].length+1
                    end
                    hash_note[:title]=note.title
                    hash_note[:content]=note.content
                    users["notes"]<<hash_note
                end
            end
            File.write('./data/users.json',JSON.dump(data)) 
            puts 
            p "Note created successfully!."    
        rescue SystemCallError=>e  
            puts "Error : #{e.message}"  
        end
    end
    def view_notes(id)
        puts
        #get user data
        file = File.read("./data/users.json")
        data = JSON.parse(file);

        data.each do |user|
            if user["id"]==id
                if user["notes"].length>0
                    puts "|"+"id".center(5)+"|"+"title".center(30)+"|"+"content".center(50)+"|"
                    puts "-"*89
                    user["notes"].each do |note|
                        puts "|"+note["id"].to_s.center(5)+"|"+note["title"].center(30)+"|"+note["content"].center(50)+"|"
                    end
                    
                else
                    puts "Empty?"
                end
            end
        end
        puts 
        puts
    end
    def update_notes(id)
        puts
        print "Enter note ID to update: "
        note_id=gets.chomp.to_i
        print "Enter new title: "
        title=gets.chomp.to_s
        print "Enter new content: "
        content=gets.chomp.to_s

        #get data
        file = File.read("./data/users.json")
        data = JSON.parse(file);
        flag=false
        data.each do |user|
            if user["id"]==id
                user["notes"].each do |note|
                    if note["id"]==note_id
                        flag=true;
                        note["title"]=title
                        note["content"]=content
                        puts
                    end
                end
            end
        end
        if flag
            File.write('./data/users.json',JSON.dump(data)) 
            puts 
            p "Note updated successfully!."  
            puts
        else
            puts
            p "Note not found wit id : #{note_id}"
            puts
        end
    end
    def delete_notes(id)
        puts
        print "Enter note ID to delete: "
        note_id=gets.chomp.to_i

        #get data
        file = File.read("./data/users.json")
        data = JSON.parse(file);
        flag=false
        data.each do |users|
            if users["id"]==id
                len=users["notes"].length
                users["notes"].reject!{ |user| user["id"]==note_id} 
                if len!=users["notes"].length
                    flag=true;
                end
                break              
            end
        end
        if flag
            File.write('./data/users.json',JSON.dump(data)) 
            puts 
            p "Note deleted successfully!."  
            puts
        else
            puts
            p "Note not found wit id : #{note_id}"
            puts
        end
    end
    def export_notes(id)
        puts
        print "Enter note ID to export : "
        note_id=gets.chomp.to_i

        #get data
        file = File.read("./data/users.json")
        data = JSON.parse(file);
        flag=false
        data.each do |users|
            if users["id"]==id
                len=users["notes"].length
                users["notes"].each do |note|
                    if note["id"]==note_id
                        flag=generate_pdf(note["title"],note["content"])
                        break
                    end
                end 
                break          
            end
        end
        if flag
            File.write('./data/users.json',JSON.dump(data)) 
            puts 
           
            p "Note exportded to PDF successfully!"
            p "The PDF has been saved in your "
            p "Download folder."
            puts
        else
            puts
            p "Note not found wit id : #{note_id}"
            puts
        end
    end
    def export_all_notes(id)
    end
end