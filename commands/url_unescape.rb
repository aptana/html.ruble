require 'ruble'

command t(:url_unescape) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke {|context| require 'cgi'; CGI.unescape(STDIN.read) }
end
