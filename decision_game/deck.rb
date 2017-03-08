require 'squib'
require 'yaml'

copywright = "CC~BY-SA~3.0~FR Ajiro.fr, version: v1"

def debug_grid()
  grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4
end

Dir["data/*.yml"].each do |data|
  lang = File.basename(data, '.yml')
  questions = YAML.load_file(data)

  Squib::Deck.new(cards: questions.size, layout: ['layout/card.yml']) do
    background color: 'white'

    rect layout: 'safe', fill_color: 'lightgray'
    rect layout: 'inside'

    svg file: questions.map {|i| i['icon'] }, layout: 'art'

    rect layout: 'text_section'
    text str: questions.map {|i| i['text'] }, layout: 'text'

    text str: copywright, layout: 'copyright'

    #debug_grid
    save format: :pdf, file: "questions-#{lang}.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
  end
end
