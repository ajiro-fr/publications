require 'squib'

fr = YAML.load_file('data/fr.yml')

Squib::Deck.new(cards: fr.size, layout: 'layout/card.yml') do
  background color: fr.map {|i| i['background'] }
   
  rect layout: 'cut'
  rect layout: 'safe'

  text str: fr.map {|i| i['number'] }, layout: 'number'
  text str: fr.map {|i| i['title'].upcase }, layout: 'title'
  text str: fr.map {|i| i['description'] }, layout: 'description'
  svg file: fr.map {|i| i['illustration'] }, layout: 'illustration'

  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf
end
