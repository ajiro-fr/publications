require 'squib'
require 'yaml'


Dir["data/*.yml"].each do |data|
  puts "processing #{data}"
  style = File.basename(data, '.yml')
  content = YAML.load_file(data)

  Squib::Deck.new(cards: content['text'].size, layout: 'layout/card.yml') do
    background color: 'white'
    rect layout: 'cut'
    rect layout: 'outer'
    rect layout: 'inner'
    #circle layout: 'topleft_circle'
    #rect layout: 'highlight'

    text str: content['text'], layout: 'center_value'
    #text str: content['text'], layout: 'topleft_value'

    #svg file: values, layout: 'topleft_value'
    #svg file: values, layout: 'center_value'
    #svg file: "images/break.svg", layout: 'center_value'
    text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
    save format: :pdf, file: "poker-#{style}.pdf"
  end
end
