require 'ruble'

command t(:delete_whitespace_between_tags) do |cmd|
  cmd.key_binding = 'Control+Option+Delete'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :document
  cmd.invoke do |context|
    doc = STDIN.read
    caret_offset = context.editor.caret_offset
    before = doc[0...caret_offset]
    rest = doc[caret_offset..-1]
    before + rest.sub(/(?=\S)|\s+/, '')
  end
end
