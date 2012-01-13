require 'ruble'

command t(:select_tag_content) do |cmd|
  cmd.key_binding = 'CONTROL+M2+/'
  cmd.scope = 'text.html'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    offset = context.editor.caret_offset
    root_node = context.editor.editor_part.file_service.parse_result
    node = root_node.getNodeAtOffset(offset)
    
    # This selects the content and the end tag
    begin
      context.editor.selection = (node.getNameNode().getNameRange().getEndingOffset() + 1...node.getEndNode().getNameRange().getStartingOffset())
    rescue
      # ignore?
    end
  end
end
