require 'ruble'

command 'Select Tag Pair and Content' do |cmd|
  cmd.key_binding = 'CONTROL+M2+.'
  cmd.scope = 'text.html'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    offset = context.editor.caret_offset
    root_node = context.editor.editor_part.file_service.parse_result
    node = root_node.getNodeAtOffset(offset)
    # This selects the open tag, the content and the end tag
    context.editor.selection = (node.getStartingOffset...node.getEndingOffset + 1)
  end
end
