require 'ruble'

command 'Open Document in Internal Browser' do |cmd|
  cmd.scope = 'text.html -text.html.ruby'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke {|context| STDIN.read }
end
