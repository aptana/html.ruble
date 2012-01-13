require 'ruble'

command t(:open_doc_in_internal_browser) do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke {|context| STDIN.read }
end