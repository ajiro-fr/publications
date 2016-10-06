require 'squib'
require 'yaml'

values = Dir["images/*.svg"]

Squib::Deck.new(cards: values.size, layout: 'layout/card.yml') do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  circle layout: 'topleft_circle'
  rect layout: 'highlight'
  svg file: values, layout: 'topleft_value'
  svg file: values, layout: 'center_value'
  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: 'poker.pdf'
end
