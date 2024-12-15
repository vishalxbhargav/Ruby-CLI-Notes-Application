require 'prawn'

def generate_pdf(title, content)
    begin
        Prawn::Document.generate("/home/luffy/Downloads/#{title}.pdf") do
        text "Title", size: 30, style: :bold
        text title, size: 20
        move_down 20
        text "Content", size: 30, style: :bold
        text content, size: 20
        end
        true
    rescue => e
        puts "Error generating PDF: #{e.message}"
        false
    end
end
def generate_all_pdf(notes,username)
    begin
        Prawn::Document.generate("/home/luffy/Downloads/#{username}.pdf") do
            notes.each do |note|
                text "Title", size: 30, style: :bold
                text note["title"], size: 20
                move_down 15
                text "Content", size: 30, style: :bold
                text note["title"], size: 20
                move_down 20
            end
        end
        true
    rescue => e
        puts "Error generating PDF: #{e.message}"
        false
    end
end

  