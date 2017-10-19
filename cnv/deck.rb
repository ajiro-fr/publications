require 'squib'
require 'yaml'

copywright = "CC~BY-SA~3.0~FR Ajiro.fr, version: v1"

def cutmark(top, left, right, bottom, size)
  line x1: left, y1: top, x2: left+size, y2: top, stroke_width: 1, cap: :round
  line x1: left, y1: top, x2: left, y2: top+size, stroke_width: 1, cap: :round

  line x1: right, y1: top, x2: right, y2: top+size, stroke_width: 1, cap: :round
  line x1: right, y1: top, x2: right-size, y2: top, stroke_width: 1, cap: :round

  line x1: left, y1: bottom, x2: left+size, y2: bottom, stroke_width: 1, cap: :round
  line x1: left, y1: bottom, x2: left, y2: bottom-size, stroke_width: 1, cap: :round

  line x1: right, y1: bottom, x2: right-size, y2: bottom, stroke_width: 1, cap: :round
  line x1: right, y1: bottom, x2: right, y2: bottom-size, stroke_width: 1, cap: :round
end


Dir["data/*.yml"].each do |data|
  puts "processing #{data}"
  style = File.basename(data, '.yml')
  values = YAML.load_file(data)

  Squib::Deck.new(cards: values.size, layout: 'layout/poker.yml') do
    background color: 'white'

    rect layout: 'safe', fill_color: 'lightgray'
    rect layout: 'inside'


    text str: values.map { |e| e["name"]}, layout: 'description_text'

    text str: copywright, layout: 'copyright'
    cutmark 40, 40, 785, 1085, 10
    save format: :pdf, file: "poker-#{style}.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
  end
end
