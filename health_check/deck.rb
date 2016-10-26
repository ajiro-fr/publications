require 'squib'
require 'yaml'


Dir["data/*.yml"].each do |data|
  lang = File.basename(data, '.yml')
  content = YAML.load_file(data)

  questions = content['questions']
  Squib::Deck.new(cards: questions.size, layout: ['layout/card.yml', 'layout/questions.yml']) do
    background color: 'gray'
    rect layout: 'cut'
    rect layout: 'safe'
    rect layout: 'ok_section', fill_color: '#00FF0010'
    rect layout: 'ko_section', fill_color: '#FF000010'
    rect layout: 'title_section', fill_color: '#00000010'
    svg file: questions.map {|i| i['icon'] }, layout: 'art'
    svg file: '1f60c.svg', layout: 'ok_icon'
    svg file: '1f62b.svg', layout: 'ko_icon'
    text str: questions.map {|i| i['title'] }, layout: 'title'
    text str: questions.map {|i| i['ok'] }, layout: 'ok_text'
    text str: questions.map {|i| i['ko'] }, layout: 'ko_text'
    text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
    save format: :pdf, file: "questions-#{lang}.pdf", width: "29.7cm", height: "21cm"#, trim: 40
    showcase range: 0..1, offset: 0.8, trim: 40, trim_radius: 16
    hand range: 0..5, trim: 40, trim_radius: 16
  end

  answers = content['answers'] * 8
  Squib::Deck.new(cards: answers.size, layout: ['layout/card.yml', 'layout/anwsers.yml']) do
    background color: 'gray'
    rect layout: 'cut'
    rect layout: 'safe'
    svg file: answers.map {|i| i['icon'] }, layout: 'picture'
    text str: answers.map {|i| i['text'] }, layout: 'text'
    text str: 'CC 2.0 BY SA Ajiro, http://ajiro.fr', layout: 'copyright'
    save format: :pdf, file: "answers-#{lang}.pdf", width: "29.7cm", height: "21cm"
  end
end
