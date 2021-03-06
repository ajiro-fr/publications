require 'squib'
require 'yaml'

Version=1
Copywright = "CC~BY-SA~3.0~FR, version: v#{Version}"

def set_background()
  background color: 'black'
  rect layout: 'safe', fill_color: 'white', radius: 10
  png file: 'images/backgroung.png', layout: 'safe', alpha: 0.3
end

def save_home_made(file)
  save format: :pdf, file: file, width: "29.7cm", height: "21cm", trim: 40, gap: 0
end

def debug_grid()
  grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4
end

Cards = YAML.load_file('data/cards.yml')
Squib::Deck.new(cards: Cards.size, layout: 'layout/short.yml') do
  set_background

  rect layout: 'title_background'
  text str: Cards.map { |e| e["title"]}, layout: 'title_text'


  svg file: Cards.map {|i| i['icon'] }, layout: 'art'

  rect layout: 'description_background'
  text str: Cards.map { |e| e["description"]}, layout: 'description_text', markup: true

  text str: Copywright, layout: 'copyright'

  save_home_made "cards.pdf"
end
