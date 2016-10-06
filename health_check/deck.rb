require 'squib'
require 'yaml'

fr = YAML.load_file('data/fr.yml')

Squib::Deck.new(cards: fr.size, layout: ['layout/card.yml', 'layout/questions.yml']) do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  rect layout: 'ok_section', fill_color: '#00FF0010'
  rect layout: 'ko_section', fill_color: '#FF000010'
  rect layout: 'title_section', fill_color: '#00000010'
  svg file: fr.map {|i| i['icon'] }, layout: 'art'
  svg file: '1f60c.svg', layout: 'ok_icon'
  svg file: '1f62b.svg', layout: 'ko_icon'
  text str: fr.map {|i| i['title'] }, layout: 'title'
  text str: fr.map {|i| i['ok'] }, layout: 'ok_text'
  text str: fr.map {|i| i['ko'] }, layout: 'ko_text'
  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: 'questions.pdf'
end

answers = ["1f60c.svg", "1f61f.svg", "1f62b.svg"] * 12

Squib::Deck.new(cards: answers.size, layout: ['layout/card.yml', 'layout/anwsers.yml']) do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  svg file: answers, layout: 'picture'
  text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
  save format: :pdf, file: 'answers.pdf'
end
