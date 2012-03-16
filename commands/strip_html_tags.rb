require 'ruble'

command t(:strip_html_tags) do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke {|context| STDIN.read.gsub(/<\/?[^>]*>/, "") }
end
