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
  save format: :pdf, file: "delegation-poker-fr.pdf"
end

Squib::Deck.new(cards: fr.size, layout: 'layout/biface.yml') do
  background color: fr.map {|i| i['background'] }

  rect layout: 'cut'
  rect layout: 'safe'

  # Manager
  circle layout: 'topleft_circle'
  text str: fr.map {|i| i['number'] }, layout: 'topleft_value'
  text str: 'Manager', layout: 'manager_label'
  text str: fr.map {|i| i['title'].upcase }, layout: 'manager_title'
  svg file: "1f464.svg", layout: 'manager_icon'
  text str: fr.map {|i| i['manager'] }, layout: 'manager_text'

  # Team
  circle layout: 'bottomright_circle'
  text str: fr.map {|i| i['number'] }, layout: 'bottomright_value'
  text str: 'Team', layout: 'team_label'
  text str: fr.map {|i| i['title'].upcase }, layout: 'team_title'
  svg file: "1f465.svg", layout: 'team_icon'
  text str: fr.map {|i| i['team'] }, layout: 'team_text'


  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: "delegation-poker-2-fr.pdf"
end
