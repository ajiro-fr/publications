require 'squib'
require 'yaml'

Version=1
Copywright = "CC~BY-SA~3.0~FR, ajiro.fr"

def save_home_made(file)
  save format: :pdf, file: file, width: "29.7cm", height: "21cm", trim: "0.25cm", gap: 0
end

def debug_grid()
  grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4
end


Dir["faces/*"].each do |data|
  puts "processing #{data}"
  style = File.basename(data, '.yml')
  faces = Dir["faces/#{style}/*.svg"]

  Squib::Deck.new(cards: faces.size, layout: 'layout.yml', width: '3.5cm', height: '3.5cm', dpi: 300) do
    svg file: faces, layout: 'face'

    #rect layout: 'copyright'
    #text str: Copywright, layout: 'copyright'

    save_home_made "avatar-#{style}.pdf"
  end
end
