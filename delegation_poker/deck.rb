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

Squib::Deck.new(cards: fr.size, layout: 'layout/card.yml') do
  background color: fr.map {|i| i['background'] }

  #rect layout: 'cut'
  rect layout: 'safe', fill_color: "white"

  circle layout: 'topleft_circle'
  text str: fr.map {|i| i['number'] }, layout: 'topleft_value'

  #text str: fr.map {|i| i['number'] }, layout: 'number'
  text str: fr.map {|i| i['title'].upcase }, layout: 'title'
  text str: fr.map {|i| i['description'] }, layout: 'description'
  svg file: fr.map {|i| i['icon'] }, layout: 'icon'

  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: "delegation-poker-picture-fr.pdf"
end

Squib::Deck.new(cards: fr.size, layout: 'layout/biface.yml') do
  background color: fr.map {|i| i['background'] }

  rect layout: 'cut'
  rect layout: 'safe'

  # Manager
  circle layout: 'topleft_circle'
  text str: fr.map {|i| i['number'] }, layout: 'topleft_value'
  text str: 'Manager', layout: 'manager_label'
  text str: fr.map {|i| i['manager_title'].upcase }, layout: 'manager_title'
  svg file: "1f464.svg", layout: 'manager_icon'
  text str: fr.map {|i| i['manager_text'] }, layout: 'manager_text'

  # Team
  circle layout: 'bottomright_circle'
  text str: fr.map {|i| i['number'] }, layout: 'bottomright_value'
  text str: 'Team', layout: 'team_label'
  text str: fr.map {|i| i['team_title'].upcase }, layout: 'team_title'
  svg file: "1f465.svg", layout: 'team_icon'
  text str: fr.map {|i| i['team_text'] }, layout: 'team_text'

  #grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  #grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4

  #draw_graph_paper 825, 1125
  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: "delegation-poker-biface-fr.pdf"
end
