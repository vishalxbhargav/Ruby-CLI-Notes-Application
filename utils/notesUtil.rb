require_relative "../service/notesService.rb"

class NotesUtil
    def notes_details(id)
        while true
            puts "Please choose an option:"
            puts "1. Create Note"
            puts "2. View Notes"
            puts "3. Update Note"
            puts "4. Delete Note"
            puts "5. Export Specific Note to PDF"
            puts "6. Exit"
            puts
            print "Enter option number : "
            option=gets.chomp.to_i
            notesService=NotesService.new()
            case option
            when 1
                notesService.create_note(id)
            when 2
                notesService.view_notes(id)
            when 3
                notesService.update_notes(id)
            when 4
                notesService.delete_notes(id)
            when 5
                puts "export specific notes to pdf"
            when 6
                break;
            else 
                puts "Invalid Option, please try agian"
            end
        end
    end
end