require 'squib'
require 'yaml'

Version=1
Copywright = "CC~BY-SA~3.0~FR, version: v#{Version}"

Icon='icons/pointy-hat.svg'

def save_home_made(file)
  save format: :pdf, file: file, width: "29.7cm", height: "21cm", trim: 40, gap: 0
end

def debug_grid()
  grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
  grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4
end

Cards = YAML.load_file('data/cards.yml')
Colors = Cards.map { |e| e["color"]}
HatColors = Cards.map { |e| e["hat-color"]}
Squib::Deck.new(cards: Cards.size, layout: 'layout/short.yml') do
  background color: 'white'
  rect layout: 'safe', fill_color: Colors, radius: 10

  rect layout: 'title_background'
  text str: Cards.map { |e| e["title"]}, layout: 'title_text', color: Colors

  svg file: Icon, mask: Colors, layout: 'art'

  rect layout: 'description_background'
  text str: Cards.map { |e| e["description"]}, layout: 'description_text', markup: true

  text str: Copywright, layout: 'copyright'

  save_home_made "cards.pdf"
end

Squib::Deck.new(cards: Cards.size, layout: 'layout/details.yml') do
  background color: 'white'
  rect layout: 'safe', fill_color: Colors, radius: 10

  rect layout: 'title_background'
  text str: Cards.map { |e| e["title"]}, layout: 'title_text', color: Colors

  svg file: Icon, mask: Colors, layout: 'art'

  rect layout: 'description_background'
  svg file: Icon, mask: HatColors, layout: 'hat'

  text str: Cards.map { |e| e["intent"]}, layout: 'intent_text', markup: true
  text str: Cards.map { |e| e["subtitle"]}, layout: 'subtitle_text', markup: true
  text str: Cards.map { |e| e["details"]}, layout: 'details_text', markup: true
  text str: Cards.map { |e| e["persona"]}, layout: 'persona_text', markup: true
  text str: "Exemples de questions", layout: 'question_title_text', markup: true
  text str: Cards.map { |e| e["questions"]}, layout: 'questions_text', markup: true

  text str: Copywright, layout: 'copyright'

  save_home_made "cards-details.pdf"
end
