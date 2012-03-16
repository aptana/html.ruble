require 'ruble'

command t(:wrap_lines_in_tag_pairs) do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+COMMAND+W' # FIXME This is mac specific
  cmd.scope = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    input = STDIN.read
    input.gsub(/[\$`\\]/, '\\1').gsub(/([ \t]*)(.+)/, '\1<${1:li}>\2</${1:li}>')
  end
end
