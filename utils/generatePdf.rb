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
  