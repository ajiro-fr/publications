require 'squib'

copywright = "CC~BY-SA~3.0~FR Ajiro.fr, version: v1.1"

def cutmark(top, left, right, bottom, size)
  line x1: left, y1: top, x2: left+size, y2: top, stroke_width: 1, cap: :round
  line x1: left, y1: top, x2: left, y2: top+size, stroke_width: 1, cap: :round

  line x1: right, y1: top, x2: right, y2: top+size, stroke_width: 1, cap: :round
  line x1: right, y1: top, x2: right-size, y2: top, stroke_width: 1, cap: :round

  line x1: left, y1: bottom, x2: left+size, y2: bottom, stroke_width: 1, cap: :round
  line x1: left, y1: bottom, x2: left, y2: bottom-size, stroke_width: 1, cap: :round

  line x1: right, y1: bottom, x2: right-size, y2: bottom, stroke_width: 1, cap: :round
  line x1: right, y1: bottom, x2: right, y2: bottom-size, stroke_width: 1, cap: :round
end


Dir["data/*.yml"].each do |data|
  style = File.basename(data, '.yml')
  values = YAML.load_file(data)

  Squib::Deck.new(cards: values.size, layout: 'layout/biface.yml') do
    background color: 'white'

    rect layout: 'safe', fill_color: values.map { |e| e["color"]}
    rect layout: 'inside'

    # Manager
    svg file: "manager.svg", layout: 'manager_icon', mask: values.map { |e| "#ddd"}
    circle layout: 'topleft_circle', fill_color: values.map { |e| e["color"]}
    text str: values.map {|i| i['number'] }, layout: 'topleft_value'
    text str: 'manager', layout: 'manager_label'
    text str: values.map {|i| i['manager_title'] }, layout: 'manager_title'
    text str: values.map {|i| i['manager_text'] }, layout: 'manager_text'

    line layout: 'middle_line', stroke_color: values.map { |e| e["color"]}

    # Team
    svg file: "team.svg", layout: 'team_icon', mask: values.map { |e| "#ddd" }
    circle layout: 'bottomright_circle', fill_color: values.map { |e| e["color"]}
    text str: values.map {|i| i['number'] }, layout: 'bottomright_value'
    text str: 'team', layout: 'team_label'
    text str: values.map {|i| i['team_title'] }, layout: 'team_title'
    text str: values.map {|i| i['team_text'] }, layout: 'team_text'

    #grid width: 25,  height: 25,  stroke_color: '#659ae9', stroke_width: 1.5
    #grid width: 100, height: 100, stroke_color: '#659ae9', stroke_width: 4

    text str: copywright, layout: 'copyright'

    cutmark 40, 40, 785, 1085, 10

    save format: :pdf, file: "delegation-poker-#{style}.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
    save_sheet range: 0..6, columns: 4, rows: 2, trim: 40, gap: 0, prefix: "delegation-poker-#{style}-"
    showcase range: 0..4, offset: 0.8, trim: 40, trim_radius: 16, fill_color: '#3D7890'
    hand range: 0..6, trim: 40, trim_radius: 16, fill_color: '#3D7890'
  end
end
