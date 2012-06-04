require 'ruble'

command t(:select_tag_pair_and_content) do |cmd|
  cmd.key_binding = 'CONTROL+M2+.'
  cmd.scope = 'text.html'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    offset = context.editor.caret_offset
    root_node = context.editor.editor_part.getAST
    node = root_node.getNodeAtOffset(offset)
    # This selects the open tag, the content and the end tag
    context.editor.selection = (node.getStartingOffset...node.getEndingOffset + 1)
  end
end
